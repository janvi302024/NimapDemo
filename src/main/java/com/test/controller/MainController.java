package com.test.controller;

//import java.util.List;


//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;

//import com.test.model.Loginmodel;
//import com.test.model.StudModel;


@RestController
public class MainController {
	
	
	
	
	@GetMapping("/alltest")
	public String Test()
	{
		return new String("Project Tested Successfully!!!");     
	}
	
	/*
	 * @GetMapping("/SignUp") public String getSignUp() { return "SignUp"; }
	 * 
	 * @GetMapping("/SignIn") public String getSignIn() { return "SignIn"; }
	 * 
	 * @GetMapping("/Dashboard") public String getDashboard() { return "Dashboard";
	 * }
	 * 
	 * @ResponseBody
	 * 
	 * @GetMapping("/hello") public String getHello() { return "hello ayush"; }
	 * 
	 * 
	 * 
	 * @ResponseBody
	 * 
	 * @PostMapping("/savestu") public ResponseEntity<String> addstu(@RequestBody
	 * StudModel stu) { studservice.addStu(stu);
	 * 
	 * 
	 * return ResponseEntity.ok("success"); }
	 * 
	 * @ResponseBody
	 * 
	 * @GetMapping("/userdetails") public List<StudModel>getAllStudentDetailss() {
	 * return studservice.getAllStudentDetails(); }
	 * 
	 * @ResponseBody
	 * 
	 * @PostMapping("updatestudent/{id}") public StudModel
	 * getUpdatestudent(@PathVariable int id,@RequestBody StudModel stu) { return
	 * studservice.update(id, stu); }
	 * 
	 * @ResponseBody
	 * 
	 * @PostMapping("deleteuser/{id}") public String deleteUser(@PathVariable int
	 * id) { studservice.deleteUser(id); return "deleted"; }
	 * 
	 * @ResponseBody
	 * 
	 * @PostMapping("/login") public ResponseEntity<String>login(@RequestBody
	 * StudModel sm) {
	 * 
	 * boolean bool = studservice.doLogin(sm); if(bool) return
	 * ResponseEntity.ok("success"); else return
	 * ResponseEntity.badRequest().body("failed");
	 * 
	 * 
	 * }
	 * 
	 * @GetMapping("/checkEmail") public ResponseEntity<Boolean>
	 * checkEmail(@RequestParam String email) { boolean exists =
	 * studservice.checkEmailExists(email); return ResponseEntity.ok(exists); }
	 */
}
