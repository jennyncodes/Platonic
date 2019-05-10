package com.jnguyen.strictlyplatonic.controllers;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jnguyen.strictlyplatonic.models.Hobby;
import com.jnguyen.strictlyplatonic.models.User;
import com.jnguyen.strictlyplatonic.services.HobbyService;
import com.jnguyen.strictlyplatonic.services.MessageService;
import com.jnguyen.strictlyplatonic.services.UserService;
import com.jnguyen.strictlyplatonic.validator.UserValidator;

@Controller
public class MainController {
	private final UserService userService;
	private final HobbyService hobbyService;
	private final MessageService messageService;
	private final UserValidator userValidator;

	public MainController(UserService userService, MessageService messageService, HobbyService hobbyService, UserValidator userValidator) {
		this.userService= userService;
		this.hobbyService= hobbyService;
		this.messageService= messageService;
		this.userValidator= userValidator;
	}
	
	static ArrayList<String> states = new ArrayList<String>(Arrays.asList("AL", "AK", "AZ", "AR", "CA", "CO", "CT",
			"DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN",
			"MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI",
			"SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"));
	
	@RequestMapping("/")
	 public String login( Model model) {
		 model.addAttribute("states", states);
		 model.addAttribute("user", new User());

	     return "login.jsp";
	 }
	 
	 @RequestMapping(value="/registration", method=RequestMethod.POST)
	 public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session, Model model) {
		 userValidator.validate(user,  result);
		 model.addAttribute("states", states);
		 if(result.hasErrors()) {
			 return "login.jsp";	
		 }
		 User u= userService.registerUser(user);
		 session.setAttribute("userId", u.getId());
		 return "redirect:/main";
	 }
	 
	 @RequestMapping(value="/login", method=RequestMethod.POST)
	 public String loginUser(@ModelAttribute("user") User user, @RequestParam("email1") String email, @RequestParam("password1") String password, Model model, HttpSession session) {
		 if(userService.authenticateUser(email, password)) {
			 User u = userService.findByEmail(email);
			 session.setAttribute("userId", u.getId());
			 return "redirect:/main";
		 
		 }
		 else {
			 model.addAttribute("error", "Please try again.");
			 return "login.jsp";
		 }
	 }
	 @RequestMapping("/main")
	 public String main(Model model, HttpSession session) {
		 Long id= (Long) session.getAttribute("userId");
		 System.err.println(id);
		 if ( id == null) {
			 return "redirect:/";
		 }
		 User user= userService.findUserById(id);
		 model.addAttribute("user", user);
		 return "main.jsp";
		 
	 }
	 @RequestMapping("/profile")
	 public String profile(Model model) {
		 model.addAttribute("user", new User());
		 return "profile.jsp";
	 }
	 
	 @PostMapping("/createProfile")
	 public String createProfile(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session, Model model) {
		if(result.hasErrors()) {
			return "profile.jsp";
				
		}
		else {
			User u= userService.createProfile(user);
			model.addAttribute("user", user);
			return "redirect:/main";
		}
	}
	 
	 @RequestMapping("/coming")
	 public String soon(Model model) {
		model.addAttribute("user", new User());
		return "comingsoon.jsp";
		 
	 }
	 //hobby button
	 @RequestMapping("/hobbies/new")
		public String newHobby(Model model, HttpSession session) {
		 Long id= (Long) session.getAttribute("userId");
		 System.err.println(id);
		 if ( id == null) {
			 return "redirect:/";
		 }
		 	User user= userService.findUserById(id);
		 	Hobby h= new Hobby();
		 	model.addAttribute("user", user);
			model.addAttribute("hobby", h);
			List<Hobby> hobbies = hobbyService.findHobbyByUser(user);
			List<Hobby> userHobbies= hobbyService.allHobbies();
			model.addAttribute("hobbies", hobbies);
			model.addAttribute("userHobbies", userHobbies);
			return "hobby.jsp";
	 }
	 
	 //create a new hobby
	 @PostMapping("/newHobby")
		public String createHobby(@Valid @ModelAttribute("hobby") Hobby hobby, BindingResult result, HttpSession session) {
		System.err.println(hobby.getName());	
		 if(result.hasErrors()) {
				return "hobby.jsp";
				
			}
			else {
				hobby.setUser(userService.findUserById((Long)session.getAttribute("userId")));
				Hobby h= hobbyService.createHobby(hobby);
				return "redirect:/hobbies/new";
			}
		}
	 
	 //view hobby
	 @RequestMapping("/hobbies/{id}")
	public String viewHobby(@PathVariable("id") Long id, Model model, HttpSession session) {
		System.err.println("000000");
		Hobby h= hobbyService.findHobbyById(id);
		
		model.addAttribute("hobby", h);
		return "hobby.jsp";	 
	 }
	 
	 //edit page
	 @RequestMapping("/hobbies/{id}/edit")
	 public String editHobby(@PathVariable("id") Long id, Model model, HttpSession session) {
			System.err.println("000000");
			Hobby h= hobbyService.findHobbyById(id);
			
			model.addAttribute("hobby", h);
			return "edit.jsp";	 
		 }
	 
	 
	 //update or edit hobby
	 @PostMapping("/hobbies/{id}/edit")
	 public String updateHobby(@Valid @PathVariable("id") Long id, @ModelAttribute("hobby") Hobby hobby, BindingResult result,  Model model) {
				if(result.hasErrors()) {
					return "edit.jsp";
				}
				else {
					Hobby hEdit = hobbyService.findHobbyById(id);
					model.addAttribute("hobby", hEdit);
					hobbyService.updateHobby(hobby);
					return "redirect:/hobbies/new";
				}
	 }
	 //delete hobby
	 @RequestMapping("/hobbies/{id}/delete")
	    public String deleteHobby(@PathVariable("id") Long id) {
	    	Hobby h = hobbyService.findHobbyById(id);
	    	hobbyService.deleteHobby(id);
	    	return "redirect:/hobbies/new";
	 }
//	 //create testominals 
//	 @PostMapping("/createTestominal")
//	 public String createTestominal(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session, Model model) {
//		if(result.hasErrors()) {
//			return "testominal.jsp";
//				
//		}
//		else {
//			User u= userService.createTestominal(user);
//			model.addAttribute("user", user);
//			return "redirect:/main";
//		}
//	}
	 
	 //logout
	 @RequestMapping("/logout")
	 public String logout(HttpSession session) {
		 session.invalidate();
		 return "redirect:/";
	 }
//	 
//	 @RequestMapping("/hobbies/{id}/join")
//		public String joinHobby(@PathVariable("id") Long id, HttpSession session) {
//			User u = userService.findUserById((Long) session.getAttribute("userId"));
//			Hobby h = hobbyService.findHobbyById(id);
//			User attendees = h.getUser();
//			attendees.add(u);
//			h.setUser(attendees);
//			hobbyService.updateHobby(h);	
//			return "redirect:/hobbies/new";
//	}
//	 //user cancel going to event
//	 @RequestMapping("/hobbies/{id}/cancel")
//	    public String cancelHobby(@PathVariable("id") Long id, HttpSession session) {
//	    	User u = userService.findUserById((Long) session.getAttribute("userId"));
//			Hobby h = hobbyService.findHobbyById(id);
//	    	List<User> attendees = h.getUser();
//	        for(int i=0; i<attendees.size(); i++) {
//	            if(attendees.get(i).getId() == u.getId()) {
//	            	attendees.remove(i);
//	            }
//	        }
//	        h.setUser(attendees);
//	        userService.updateUser(u);
//	    	return "redirect:/hobbies/new";
//	 }
	 
	
}
