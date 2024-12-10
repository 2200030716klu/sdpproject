package com.klef.jfsd.lms.controller;

import java.io.IOException;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.lms.model.Admin;
import com.klef.jfsd.lms.model.Borrower;
import com.klef.jfsd.lms.model.Lender;
import com.klef.jfsd.lms.model.Loan;
import com.klef.jfsd.lms.model.Transaction;
import com.klef.jfsd.lms.service.AdminService;
import com.klef.jfsd.lms.service.BorrowerService;
import com.klef.jfsd.lms.service.LenderService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController 
{
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private BorrowerService borrowerService;
	
	@Autowired
	private LenderService lenderService;

	@GetMapping("adminlogin")
	public ModelAndView adminlogin()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminlogin");
		return mv;
	}
	
	
	@PostMapping("checkadminlogin")
	public ModelAndView checkadminlogin(HttpServletRequest request)
	{
		
		ModelAndView mv = new ModelAndView();
	
		String auname = request.getParameter("ausername");
		String apwd = request.getParameter("apwd");
		
		Admin admin = adminService.checkAdminLogin(auname, apwd);
		
		if(admin!= null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("admin", admin);
			
			mv.setViewName("adminhome");
			long count = adminService.borrowercount();
			mv.addObject("count",count);
		}
		else 
		{
			mv.setViewName("adminloginfail");
			mv.addObject("message","Login Failed");
		}
		return mv;
		
		
	}
	
	
	
	@GetMapping("adminlogout")
	public String adminlogout(HttpServletRequest request) {
	    
	    HttpSession session = request.getSession(false); 

	    if (session != null) {
	        session.removeAttribute("admin");
	    }
	    
	    return "redirect:/"; 
	}
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("adminhome")
	public ModelAndView adminhome()
	{
		ModelAndView mv = new ModelAndView("adminhome");
		
		long count = adminService.borrowercount();
		mv.addObject("count",count);
		return mv;
	}
	
	
	
	
	
	
	
	
	
	@GetMapping("viewallborrowers")
	public ModelAndView viewallborrowers()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewborrowers");
		
		long count = adminService.borrowercount();
		mv.addObject("count",count);
		
		List<Borrower> borrowers = adminService.viewAllBorrowers();
		mv.addObject("borrowerslist" ,borrowers) ;
		return mv;
	}
	
	
	
	
	
	@GetMapping("viewborrowerprofile")
	public ModelAndView viewaborrowerprofile(HttpServletRequest request)
	{
		String borrowerid= request.getParameter("bid");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewborrowerprofile");
		
		Borrower b = borrowerService.getBorrower(Integer.parseInt(borrowerid));
		
		mv.addObject("borrower" ,b) ;
		return mv;
	}
	
	
	


@GetMapping("adminupdatebrprofile")
public ModelAndView adminupdatebrprofile(HttpServletRequest request)
{
	String borrowerid= request.getParameter("bid");
	Borrower b = borrowerService.getBorrower(Integer.parseInt(borrowerid));
	ModelAndView mv = new ModelAndView("adminupdatebrprofile");
	mv.addObject("borrower" ,b) ;
	return mv;
}



@PostMapping("adminupdatebp")
public ModelAndView update(HttpServletRequest request,@RequestParam("bimage")MultipartFile file) throws IOException, SerialException, SQLException
{
	
	
	int id =Integer.parseInt(request.getParameter("bid")) ;
	String name = request.getParameter("bname");
	String gender = request.getParameter("bgender");
	String dob = request.getParameter("bdob");
	String address = request.getParameter("baddress");
	String empstatus = request.getParameter("bempstatus");
	String annual_income = request.getParameter("bannual_income");
	String contact = request.getParameter("bcontact");
	String password = request.getParameter("bpwd");
	
	
	Borrower borrower =new Borrower();
	borrower.setId(id);
	borrower.setName(name);

	borrower.setGender(gender);
	borrower.setDateofbirth(dob);
	borrower.setAddress(address);
	borrower.setEmpstatus(empstatus);
	borrower.setAnnual_income(annual_income);
	borrower.setContact (contact);
	borrower.setPassword(password);
	
	if (!file.isEmpty()) {
        byte[] bytes = file.getBytes();
        Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
        borrower.setImage(blob);  
   
    } else 
    {
        Borrower existingBorrower = borrowerService.getBorrower(id);
        borrower.setImage(existingBorrower.getImage());
       
    }
	
	borrowerService.updateBorrowerProfile(borrower);
	
	ModelAndView mv = new ModelAndView("viewborrowerprofile");
	
	 return new ModelAndView("redirect:/viewborrowerprofile?bid=" + id);
	 
	 
}

@GetMapping("admindisplaybi")
public ResponseEntity<byte[]> admindisplaybi(@RequestParam int id) throws SQLException
{
	Borrower borrower = borrowerService.getBorrower(id);
	byte[] imagesbytes = null;
	imagesbytes =borrower.getImage().getBytes(1,(int) borrower.getImage().length());
	
	return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imagesbytes) ;
}




@GetMapping("viewborrowerloans")
public ModelAndView viewmyloanrequests(HttpServletRequest request)
{
	String borrowername= request.getParameter("bname");
	
	ModelAndView mv = new ModelAndView();
	mv.setViewName("viewborrowerloans");
	 String borrowerName =" ";
	 List<Loan> loans = borrowerService.viewmyloanrequests(borrowername);
	mv.addObject("loans" ,loans) ;
	return mv;
}




@GetMapping("viewborrowertransactions")
public ModelAndView viewborrowertransactions(HttpServletRequest request)
{
	String borrowername= request.getParameter("bname");
	
	ModelAndView mv = new ModelAndView();
	mv.setViewName("viewborrowertransactions");
	 List<Transaction> transactions = borrowerService.showmytransactions(borrowername);
	 System.out.print(transactions);
	 mv.addObject("transactions" ,transactions) ;
	 return mv;
}

















@GetMapping("viewalllenders")
public ModelAndView viewalllenders()
{
	ModelAndView mv = new ModelAndView();
	mv.setViewName("viewlenders");
	
	long count = adminService.borrowercount();
	mv.addObject("count",count);
	
	List<Lender> lenders = adminService.viewAllLenders();
	mv.addObject("lenderslist" ,lenders) ;
	return mv;
}





@GetMapping("viewlenderprofile")
public ModelAndView viewlenderprofile(HttpServletRequest request)
{
	String lenderid= request.getParameter("lid");
	
	ModelAndView mv = new ModelAndView();
	mv.setViewName("viewlenderprofile");
	
	Lender l = lenderService.getLender(Integer.parseInt(lenderid));
	
	mv.addObject("lender" ,l);
	return mv;
}





@GetMapping("adminupdatelrprofile")
public ModelAndView adminupdatelrprofile(HttpServletRequest request)
{
	String lenderid= request.getParameter("lid");

	Lender l = lenderService.getLender(Integer.parseInt(lenderid));
	ModelAndView mv = new ModelAndView("adminupdatelrprofile");
	mv.addObject("lender" ,l);
	return mv;
}



@PostMapping("adminupdatelp")
public ModelAndView updatelp(HttpServletRequest request,@RequestParam("limage")MultipartFile file) throws IOException, SerialException, SQLException
{


int id =Integer.parseInt(request.getParameter("lid")) ;
String name = request.getParameter("lname");
String gender = request.getParameter("lgender");
String dob = request.getParameter("ldob");
String address = request.getParameter("laddress");
String contact = request.getParameter("lcontact");
String password = request.getParameter("lpwd");


Lender lender = new Lender();

lender.setId(id);
lender.setName(name);

lender.setGender(gender);
lender.setDateofbirth(dob);
lender.setAddress(address);
lender.setContact (contact);

lender.setPassword(password);

if (!file.isEmpty()) {
    byte[] bytes = file.getBytes();
    Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
    lender.setImage(blob);  

} else 
{
    Lender existingLender = lenderService.getLender(id);
    lender.setImage(existingLender.getImage());
   
}

lenderService.updateLenderProfile(lender);
 return new ModelAndView("redirect:/viewlenderprofile?lid=" + id);
 
 
}

@GetMapping("admindisplayli")
public ResponseEntity<byte[]> admindisplayli(@RequestParam int id) throws SQLException
{
	Lender lender = lenderService.getLender(id);
	byte[] imagesbytes = null;
	imagesbytes =lender.getImage().getBytes(1,(int) lender.getImage().length());
	return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imagesbytes) ;
}


@GetMapping("viewlenderloans")
public ModelAndView viewlenderloans(HttpServletRequest request)
{
	String lendername= request.getParameter("lname");
	
	ModelAndView mv = new ModelAndView();
	mv.setViewName("viewlenderloans");
	 
	 List<Loan> loans = lenderService.viewsanctionedloans(lendername);
	mv.addObject("loans" ,loans) ;
	return mv;
}




@GetMapping("viewlendertransactions")
public ModelAndView viewlendertransactions(HttpServletRequest request)
{
	String lendername= request.getParameter("lname");
	
	ModelAndView mv = new ModelAndView();
	mv.setViewName("viewlendertransactions");
	List<Transaction> transactions = lenderService.showmytransactions(lendername);
	 mv.addObject("transactions" ,transactions) ;
	 return mv;
}







@GetMapping("manageborrowers")
public ModelAndView manageborrowers()
{
	ModelAndView mv = new ModelAndView();
	mv.setViewName("manageborrowers");
	
	
	List<Borrower> borrowers = adminService.viewAllBorrowers();
	mv.addObject("borrowerslist" ,borrowers) ;
	return mv;
}



@GetMapping("managelenders")
public ModelAndView managelenders()
{	
	ModelAndView mv = new ModelAndView();
	mv.setViewName("managelenders");

	List<Lender> lenders = adminService.viewAllLenders();
	mv.addObject("lenderslist" ,lenders) ;
	return mv;
}


@GetMapping("manageloans")
public ModelAndView manageloans()
{	
	ModelAndView mv = new ModelAndView();
	mv.setViewName("manageloans");

	List<Loan> loans = adminService.viewAllLoans();
	mv.addObject("loans" ,loans) ;
	return mv;
}




@GetMapping("deleteborrower")
public String deleteborrower(HttpServletRequest request)
{
		String borrowerid= request.getParameter("bid");
		adminService.deleteborrower(Integer.parseInt(borrowerid)) ;
		return "redirect:/manageborrowers";
}



@GetMapping("deletelender")
public String deletelender(HttpServletRequest request)
{
		String lenderid= request.getParameter("lid");
		adminService.deletelender(Integer.parseInt(lenderid));
		return "redirect:/managelenders";
}


@GetMapping("deleteloan")
public String deleteloan(HttpServletRequest request)
{
		String loanid= request.getParameter("loanid");
		adminService.deleteloan(Integer.parseInt(loanid));
		return "redirect:/manageloans";
}










	


}
