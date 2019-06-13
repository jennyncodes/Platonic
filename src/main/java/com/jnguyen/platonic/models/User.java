package com.jnguyen.platonic.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="users")
public class User {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Size(min=2, message="First name must be at least 2 characters or more")
	private String firstName;
	
	@Size(min = 2, message="Last name must be at least 2 characters of more")
	private String lastName;
	
	@Min(value=18, message="You must be 18 and over to use this app")
	private int age;
	
	@Pattern(regexp="^[a-zA-Z0-9_!#$%&’*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+.[a-zA-Z0-9.-]+$", message="Invalid email pattern")
	@Email(message="Email must be valid")
	private String email;
	
	@Size(min=2, message="City must be 2 characters or more")
	private String city;
	
	@Size(min=2, message="State must be 2 characters or more")
	private String state;
	
	@Size( min=2, message="Hobbies must be 2 or more characters")
	private String hobbies;
	
	@Size(min=5, message="Description must be 5 or more characters.")
	private String context;

	@Size(min=5, message= "Password must be greater than 8 characters")
	private String password;
	
	@Transient
	private String passwordConfirmation;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="MM:dd:yyyy HH:mm:ss")
	private Date createdAt;
	@DateTimeFormat(pattern="MM:dd:yyyy HH:mm:ss")
	private Date updatedAt;

	//Relationships
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
			name="users_messages",
			joinColumns=@JoinColumn(name="user_id"),
			inverseJoinColumns=@JoinColumn(name="message_id")
			)
	private List<Message> comments;
	
	@OneToMany(mappedBy="user", fetch=FetchType.LAZY)
	private List<Hobby> userHobbies;
	
	//constructor
	public User() {
		
	}

	public User( String firstName,  String lastName, int age, String email, String hobbies, String context, String password, String city, String state) {

		this.firstName = firstName;
		this.lastName = lastName;
		this.age = age;
		this.email = email;
		this.hobbies= hobbies;
		this.context= context;
		this.password=password;
		this.city = city;
		this.state = state;

	}
	//getter and setter

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getHobbies() {
		return hobbies;
	}

	public void setHobbies(String hobbies) {
		this.hobbies = hobbies;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordConfirmation() {
		return passwordConfirmation;
	}

	public void setPasswordConfirmation(String passwordConfirmation) {
		this.passwordConfirmation = passwordConfirmation;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public List<Message> getComments() {
		return comments;
	}

	public void setComments(List<Message> comments) {
		this.comments = comments;
	}

	public List<Hobby> getUserHobbies() {
		return userHobbies;
	}

	public void setUserHobbies(List<Hobby> userHobbies) {
		this.userHobbies = userHobbies;
	}
	@PrePersist
	 protected void onCreate(){
		 this.createdAt = new Date();
	 }
	 @PreUpdate
	 protected void onUpdate(){
		 this.updatedAt = new Date();
	}
	

}
