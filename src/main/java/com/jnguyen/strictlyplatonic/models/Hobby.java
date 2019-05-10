package com.jnguyen.strictlyplatonic.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import com.jnguyen.strictlyplatonic.models.Message;

@Entity
@Table(name="hobbies")
public class Hobby {
	@Id 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Size(min=2, max=255)
	private String name;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date date;
	
	@Size(min=2, max=30, message="Please enter a location")
	private String location;
	
	@Size(min=2, message="State must be at least 2 characters")
	private String state;
	
	@NotBlank
	private String description;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="MM:dd:yyyy HH:mm:ss")
	private Date createdAt;
	@DateTimeFormat(pattern="MM:dd:yyyy HH:mm:ss")
	private Date updatedAt;
	
	//relationships
	@ManyToOne(fetch= FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User user;
	
	@OneToMany(mappedBy="hobby", fetch = FetchType.LAZY)
	private List<Message> messages;
	
	//constructor
	public Hobby() {
		
	}
	public Hobby(String name, Date date, String location, String state, String description, User user) {
		this.name= name;
		this.date=date;
		this.location = location;
		this.state= state;
		this.description=description;
		this.user= user;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
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
