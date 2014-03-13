<%@ taglib uri="/bind" prefix="bind" %>



test

<%!

	public static class Person {
		private int age;
		private String name;
		private Person spouse;
		
		public void setAge(int age) { this.age = age; }
		public int getAge() { return this.age; }
		public void setName(String name) { this.name = name; }
		public String getName() { return this.name; }
		public void setSpouse(Person spouse) { this.spouse = spouse; }
		public Person getSpouse() { return this.spouse; }
	}


%>

<%


Person p = new Person();
p.setSpouse(new Person());


/*
try {
	com.interface21.web.bind.BindException be = new com.interface21.web.bind.BindException(p);
	//com.interface21.web.util.BindUtils.bind(request, p);
	com.interface21.web.util.BindUtils.bind(request, be);
	if (p.getAge() <= 0)
		be.add(new com.interface21.web.bind.FieldError("age", new Integer(p.getAge()), "tooyoung", "Too young"));
	if (be.hasErrors()) 
		throw be;
	request.setAttribute("person", p);
}
catch (com.interface21.web.bind.BindException ex) {
	request.setAttribute("com.interface21.framework.web.tags.AttributeNames.ERRORS", ex);
}
*/


try {
	com.interface21.web.bind.DataBinder b = new com.interface21.web.bind.DataBinder(p);
	b.bind(request);
	if (p.getAge() <= 0)
		b.add(new com.interface21.web.bind.FieldError("age", new Integer(p.getAge()), "tooyoung", "Too young"));
	b.complete(request);
	request.setAttribute("person", p);
}
catch (com.interface21.web.bind.BindException ex) {
	// already added to request: just choose different view
	out.println("Catch block<br>");
}


%>


Name is <%=p.getName() %> <br>
Age is <%=p.getAge() %> <br>
Spouse name is <%=p.getSpouse().getName() %> <br>


<form action="test.jsp" >

<bind:bind model="person" >


	<bind:error property="name">
		Name error
		<font color="red"><b><%=message%></b></font>
		<br/>
	</bind:error>
	Name: <input type="text" name="name" value="<bind:value property="name" />" />
	
	
	<bind:error property="age">
			Age error
			<font color="red"><b><%=message%></b></font>
			<br/>
		</bind:error>
	Age: <input type="text" name="age" value="<bind:value property="age" />" />
	
	<bind:error property="spouse.name">
			<font color="red"><b><%=message%></b></font>
			<br/>
		</bind:error>
	Age: <input type="text" name="spouse.name" value="<bind:value property="spouse.name" />" />



</bind:bind>

<input type="submit" value="Update" />

</form>