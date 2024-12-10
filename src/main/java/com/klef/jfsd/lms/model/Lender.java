package com.klef.jfsd.lms.model;

import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="lender_table")
public class Lender {

	@Id  //primary key = unique + not null
	@GeneratedValue(strategy = GenerationType.IDENTITY)  //auto increment
	@Column(name="lid")
	private int id;
	
	@Column(name="name", nullable=false,length=100)
	private String name;
	
	@Column(name="email", nullable=false,unique=true)
	private String email;
	
	@Column(name="gender", nullable=false)
	private String gender;
	
	@Column(name="dob", nullable=false)
	private String dateofbirth;
		
	@Column(name="address", nullable=false)
	private String address;
	
	@Column(name="contact.no", nullable=false,unique=true)
	private String contact;
	
	@Column(name="image",nullable=false)
	private Blob image; 
	
	@Column(name="password", nullable=false)
	private String password;

	
	
	
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDateofbirth() {
		return dateofbirth;
	}

	public void setDateofbirth(String dateofbirth) {
		this.dateofbirth = dateofbirth;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}
	
	public Blob getImage() {
		return image;
	}

	public void setImage(Blob image) {
		this.image = image;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}	
	

}
