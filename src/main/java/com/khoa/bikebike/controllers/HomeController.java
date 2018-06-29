package com.khoa.bikebike.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.khoa.bikebike.models.Part;
import com.khoa.bikebike.models.User;
import com.khoa.bikebike.services.PartService;
import com.khoa.bikebike.services.ReviewService;
import com.khoa.bikebike.services.UserService;
import com.khoa.bikebike.validator.UserValidator;

@Controller
public class HomeController {
	private final UserService userService;
	private final UserValidator userValidator;
	private final PartService partService;
	private final ReviewService reviewService;
	    

	public HomeController(UserService userService, UserValidator userValidator, PartService partService, ReviewService reviewService) {
        this.userService = userService;
        this.userValidator = userValidator;
        this.partService = partService;
        this.reviewService = reviewService;
    }
	

    //Login Reg
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    
    @RequestMapping("/loginReg")
    public String loginReg(@ModelAttribute("user") User user) {
        return "loginreg.jsp";
    }
	
    @RequestMapping(value="/registration", method=RequestMethod.POST)
    public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
        userValidator.validate(user, result);
        if(result.hasErrors()) {
            return "loginreg.jsp";
        }
        User u = userService.registerUser(user);
        session.setAttribute("userId", u.getId());
        return "redirect:/dashboard";
    }
    
    @RequestMapping("/login")
    public String login(@ModelAttribute("user") User user) {
        return "login.jsp";
    }


    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session, @ModelAttribute("user") User user) {
        // if the user is authenticated, save their user id in session
        // else, add error messages and return the login page
    	if(userService.authenticateUser(email, password)){
    		session.setAttribute("userId", userService.findByEmail(email).getId()); //Login via session
    		return "redirect:/dashboard";
    	} else {
    		model.addAttribute("error", "Invalid login, please try again");
    		return "login.jsp";
    	}
    }
   
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
    
    //-----------------------------------------------------------------------------------------------------------------------------------------------

    @RequestMapping("/")
    public String index() {
        return "index.jsp";
    }
    
    @RequestMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
    	Long user_id = (Long)session.getAttribute("userId");
    	User this_user = userService.findUserById(user_id);
    	model.addAttribute("user", this_user);
    	model.addAttribute("part", new Part());
    	
    	//For my parts list
		List<Part> partList = partService.readAll();
		List<Part> myList = new ArrayList<Part>();
		for (int i=0; i<partList.size(); i++) {
			if (partList.get(i).getUser().equals(this_user)){
				myList.add(partList.get(i));
			}
		}
		
    	//For available parts list
    	List<Part> partList2 = partService.readAll();
		for(int i=0; i < myList.size(); i++) {
			if(partList2.contains(myList.get(i))) {
				partList2.remove(myList.get(i));
			}
		}
    	
		
		//use this variable below to display in forEach
		model.addAttribute("notMyParts", partList2);
		model.addAttribute("myParts", myList);
		model.addAttribute("allParts", partList);
    	return "dashboard.jsp";
    }
    
    @RequestMapping("/addPart")
    public String addPart(@ModelAttribute("part") Part part) {
    	return "addpart.jsp";
    }
    
	@PostMapping("/addPart")
	public String createPart(@Valid @ModelAttribute("part") Part part, BindingResult result, Model model, HttpSession session) {
		if(result.hasErrors()) {		
			return "addpart.jsp";
		} else {
			User user = userService.findUserById((Long)session.getAttribute("userId"));
			part.setUser(user);
			partService.createPart(part);
			return "redirect:/dashboard";
		}
	}
    
	@GetMapping("/parts/{partId}")
	public String show(@PathVariable("partId") Long partId, Model model, HttpSession session) {
		Part part = partService.findPart(partId);
		User user = partService.findPart(partId).getUser();
		model.addAttribute("part", part);
		model.addAttribute("user", user);
		session.setAttribute("partId", partId);
		return "showpart.jsp";
	}
    
	 @RequestMapping(value="/parts/delete/{partId}", method=RequestMethod.GET)
	 public String destroy(@PathVariable("partId") Long partId, Model model, HttpSession session) {
		Part this_part = partService.findPart(partId);
		User this_user = userService.findUserById((Long)session.getAttribute("userId"));
		if(this_part.getUser().equals(this_user)) {
			partService.deletePart(partId);
			return "redirect:/dashboard";
		} else {
			model.addAttribute("error", "Only the seller can delete this post");
			return "showpart.jsp";
		}
	 }
	 
	 @RequestMapping("/shoppingCart")
	 public String shoppingCart() {
		 return "/resources/shoppingcart.jsp";
	 }
    
}
