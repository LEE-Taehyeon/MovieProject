package com.my.movie.user;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class CustomerVO {
    private String id;     
	private String password;
	private String passwordConfirm; 
	private String name;   
	private String gender;
	private String birth;
	private String mail;
	private String phone;
	private String zipcode;
	private String address;
	private String addressdetail;
	private String extraAddress;
	private Date Regdate;
	
	public CustomerVO() {}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordConfirm() {
		return passwordConfirm;
	}

	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressdetail() {
		return addressdetail;
	}

	public void setAddressdetail(String addressdetail) {
		this.addressdetail = addressdetail;
	}

	public String getExtraAddress() {
		return extraAddress;
	}

	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}

	public Date getRegdate() {
		return Regdate;
	}

	public void setRegdate(Date regdate) {
		Regdate = regdate;
	}

	@Override
	public String toString() {
		return "CustomerVO [id=" + id + ", password=" + password + ", passwordConfirm=" + passwordConfirm + ", name="
				+ name + ", gender=" + gender + ", birth=" + birth + ", mail=" + mail + ", phone=" + phone
				+ ", zipcode=" + zipcode + ", address=" + address + ", addressdetail=" + addressdetail
				+ ", extraAddress=" + extraAddress + ", Regdate=" + Regdate + "]";
	}

	

	

}
