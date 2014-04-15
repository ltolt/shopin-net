package net.shopin.web.vo;

public class AddressVO {
	private Long sid; // 主键sid
	private Long memberSid;// 会员sid
	private String province; // 省份
	private String city; // 城市
	private String area;// 区
	private String address; // 地址
	private String telephone; // 电话
	private String recipientName; // 收件人
	private String mobile; // 手机号
	private String mailCode; // 邮政编码
	private Integer status = 0; // 状态，是否是默认收件地址
	private Integer delFlag = 1; // 删除状态
    private String fullAddress;
    private String completeInfo;
    private String name;
    private String tel;
    
    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getFullAddress() {
		return fullAddress;
	}

	public void setFullAddress(String fullAddress) {
		this.fullAddress = fullAddress;
	}

	public String getCompleteInfo() {
		return completeInfo;
	}

	public void setCompleteInfo(String completeInfo) {
		this.completeInfo = completeInfo;
	}

	
	public Long getSid() {
		return sid;
	}

	public void setSid(Long sid) {
		this.sid = sid;
	}

	public Long getMemberSid() {
		return memberSid;
	}

	public void setMemberSid(Long memberSid) {
		this.memberSid = memberSid;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getRecipientName() {
		return recipientName;
	}

	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getMailCode() {
		return mailCode;
	}

	public void setMailCode(String mailCode) {
		this.mailCode = mailCode;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(Integer delFlag) {
		this.delFlag = delFlag;
	}

}
