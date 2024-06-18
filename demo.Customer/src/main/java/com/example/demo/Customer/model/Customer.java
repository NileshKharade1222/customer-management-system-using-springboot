package com.example.demo.Customer.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
public class Customer {
    @Column
    private String firstName;
    @Column
    private String lastName;
    @Column
    private String street;
    @Column
    private String address;
    @Column
    private String city;
    @Column
    private String email;
    @Id
    private String phone;
	public Customer(String firstName, String lastName, String street, String address, String city, String email,
			String phone) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.street = street;
		this.address = address;
		this.city = city;
		this.email = email;
		this.phone = phone;
	}
	public Customer() {
		super();
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "Customer [firstName=" + firstName + ", lastName=" + lastName + ", street=" + street + ", address="
				+ address + ", city=" + city + ", email=" + email + ", phone=" + phone + "]";
	}
	
	
	
    
    
}