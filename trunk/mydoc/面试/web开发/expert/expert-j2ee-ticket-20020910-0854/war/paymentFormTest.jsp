
<%@ taglib uri="/i21" prefix="i21" %>


<%@ page import="java.util.*,com.interface21.validation.*,com.wrox.expertj2ee.ticket.boxoffice.*,com.interface21.beans.*,java.beans.*,com.interface21.web.bind.*,com.wrox.expertj2ee.ticket.customer.*" %>


test

<%!

	public class UserValidator {
	
	/** Minimum length for email */
		public static final int MIN_EMAIL = 6;
		
		/** Maximum length for email */
	public static final int MAX_EMAIL = 64;
	
		public void validate(RegisteredUser u, Errors errs) {	
			
			validateEmail(u.getEmail(), errs);
			checkPostCode(u.getBillingAddress().getPostcode() , errs);

		}
		
		private void validateEmail(String email, Errors errs) {		
				if (email == null || "".equals(email)) {
					errs.rejectValue("email", "emailRequired", "E-mail Address is required");
					return;
				}
				
				int fioa = email.indexOf("@");
				int lioa = email.lastIndexOf("@");
				int liod = email.lastIndexOf(".");
				int len  = email.length();
				if(len < MIN_EMAIL               ||
				len > MAX_EMAIL               ||
				(fioa != lioa)                ||
				(len - liod < 3)              ||
				(lioa > liod)                 ||
				(fioa < 1)                    ||		// not x@ - make sure there's at least 1 char before @ symbol
				(email.charAt(fioa+1) == '.') ||		// not xx@.xxx - dot following straight after first @
				(email.charAt(fioa-1) == '.') ||		// not x.@ - dot preceeding first @
				(email.charAt(0) == '.')				// first character isn't '.'
				) {
					errs.rejectValue("email", "emailInvalid", "E-mail Address is invalid");
					return;
				}
				
				//checkEmailIsUnique(email, ice);
	}	// validateEmail
		
		private void checkPostCode(String postcode, Errors errs) {
		if (postcode == null || postcode.equals("")) 
				errs.rejectValue("billingAddress.postcode", "postcode.missing", "Postcode is required for billing address");
			else
			if (!postcode.startsWith("SE10"))
				errs.rejectValue("billingAddress.postcode", "postcode.notse", "Postcode must be in Greenwich!");
				
		}
		
	}
	
	
	private void exposeMap(HttpServletRequest request, Map model) {
	if (model != null) {
			Set keys = model.keySet();
			Iterator itr = keys.iterator();
			while (itr.hasNext()) {
				String modelname = (String) itr.next();
				Object val = model.get(modelname);
	
				request.setAttribute(modelname, val);
			}
		}
	}


UserValidator validator = new UserValidator();

%>

<%


RegisteredUser user = new RegisteredUser();
PurchaseRequest purchase = new PurchaseRequest(null);

HttpServletRequestDataBinder b = null;
try {
	b = new HttpServletRequestDataBinder(user, "user");
	b.bind(request);
	//if (p.getAge() <= 0)
	//	b.add(new FieldError("age", new Integer(p.getAge()), "tooyoung", "Too young"));
	validator.validate(user, b);
	
	
	b.newTarget(purchase, "purchase");
	b.bind(request);
	
	if (purchase.getCardNumber() == null || "".equals(purchase.getCardNumber()))
		b.rejectValue("cardNumber", "cardNumber", "Credit card number is required");
	else if (purchase.getCardNumber().length() != 16)
		b.rejectValue("cardNumber", "cardNumber", "Credit card number is invalid");
	else {
		try { Long.parseLong(purchase.getCardNumber()); } 
		catch (NumberFormatException ex) {
			b.rejectValue("cardNumber", "cardNumber", "Credit card number is non-numeric");
		}
	}
	
	b.close();
	
	exposeMap(request, b.getModel());
	
	//request.setAttribute("user", user);
	//request.setAttribute("purchase", purchase);
}
catch (BindException ex) {
	// already added to request: just choose different view
	out.println("Catch block<br>");
	exposeMap(request, b.getModel());
	//request.setAttribute("ERRORS", ex);
}


%>

Email message is [<i21:message code="emailRequired" />]


Email is <%=user.getEmail() %> <br>
Postcode is <%=user.getBillingAddress().getPostcode() %> <br>


<i21:hasBindErrors>

	<font color="red" size="4">There were <%=count%> errors</font>
</i21:hasBindErrors>

<br/>

<form action="paymentFormTest.jsp" >


	<i21:bindError name="user" property="email">
		<font color="red"><b><%=message%></b></font>
		<br/>
	</i21:bindError>


	Email: <input type="text" name="email" value="<i21:getProperty name="user" property="email" />" />
	
	
	
	
	<i21:bindError name="user" property="billingAddress.postcode">
			<font color="red"><b><%=message%></b></font>
			<br/>
	</i21:bindError>
	Postcode: <input type="text" name="billingAddress.postcode" value="<i21:getProperty name="user" property="billingAddress.postcode" />" />


<br/>
<i21:bindError name="purchase" property="cardNumber">
			<font color="red"><b><%=message%></b></font>
			<br/>
	</i21:bindError>
	Card number: <input type="car" name="cardNumber" value="<i21:getProperty name="purchase" property="cardNumber" />" />



<input type="submit" value="Update" />

</form>



<jsp:include page="jsp/debug/debug.jsp" />