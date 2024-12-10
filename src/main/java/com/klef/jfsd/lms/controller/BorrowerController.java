
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

import com.klef.jfsd.lms.model.Borrower;
import com.klef.jfsd.lms.model.Lender;
import com.klef.jfsd.lms.model.Loan;
import com.klef.jfsd.lms.model.Transaction;
import com.klef.jfsd.lms.service.BorrowerService;
import com.klef.jfsd.lms.service.LenderService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



@Controller
public class BorrowerController 
{
	@Autowired
	private BorrowerService borrowerService;
	
	@Autowired
	private LenderService lenderService;

	
	
	
	@GetMapping("/")
	public ModelAndView home()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
	}
	
	@GetMapping("borrowerhome")
	public ModelAndView borrowerhome()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("borrowerhome");
		return mv;
	}
	
	
	
	@GetMapping("borrowerregistration")
	public ModelAndView borrowerregistration()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("borrowerregistration");
		return mv;
	}
	
	
	
	@PostMapping("insertborrower")
	public ModelAndView insertborrower(HttpServletRequest request,@RequestParam("bimage")MultipartFile file) throws IOException, SerialException, SQLException
	{
		String name = request.getParameter("bname");
		String gender = request.getParameter("bgender");
		String dob = request.getParameter("bdob");
		String email = request.getParameter("bemail");
		String address = request.getParameter("baddress");
		String empstatus = request.getParameter("bempstatus");
		String annual_income = request.getParameter("bannual_income");
		String contact = request.getParameter("bcontact");
		String password = request.getParameter("bpwd");
		
		
		byte [] bytes = file.getBytes() ;
		Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
		
		
		Borrower borrower = new Borrower();
		
		borrower.setName(name);
		borrower.setGender(gender);
		borrower.setDateofbirth(dob);
		borrower.setEmail(email);
		borrower.setAddress(address);
		borrower.setEmpstatus(empstatus);
		borrower.setAnnual_income(annual_income);
		borrower.setContact(contact);
		borrower.setPassword(password);
		borrower.setImage(blob);
		
		String message = borrowerService.borrowerRegistration(borrower);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("borrowerregistration");
		mv.addObject("message",message);
		
		return mv;
	}
	
	
	
	@GetMapping("borrowerprofile")
	public ModelAndView borrowerprofile()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("borrowerprofile");
		return mv;
	}
	
	@GetMapping("displayborrowerimage")
	public ResponseEntity<byte[]> displayproductimage(@RequestParam int id) throws SQLException
	{
		Borrower borrower = borrowerService.getBorrower(id);
		byte[] imagesbytes = null;
		imagesbytes =borrower.getImage().getBytes(1,(int) borrower.getImage().length());
		
		return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imagesbytes) ;
	}
	

	

@GetMapping("updateborrowerprofile")
public ModelAndView updateprofile(HttpServletRequest request)
{
	ModelAndView mv = new ModelAndView("updateborrowerprofile");
	return mv;
}


@PostMapping("updatebp")
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
	
	Borrower b = borrowerService.getBorrower(id);

	HttpSession session = request.getSession();
	session.setAttribute("borrower", b);
	
	return new ModelAndView("redirect:/borrowerprofile");

}





@GetMapping("bviewlprofile")
public ModelAndView bviewlprofile(HttpServletRequest request)
{
	String lendername= request.getParameter("lname");
	
	ModelAndView mv = new ModelAndView();
	mv.setViewName("bviewlprofile");
	
	Lender l = lenderService.getLenderbyName(lendername);
	
	mv.addObject("lender" ,l);
	return mv;
}






	
	
	
	
	@GetMapping("applyloan")
	public ModelAndView applyloan()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("applyloan");
		return mv;
	}
	
	
	
	@PostMapping("insertloan")
	public ModelAndView addloan(HttpServletRequest request)
	{
		String borrowername = request.getParameter("bname");
		System.out.println(borrowername);
		String sanctionAmount = request.getParameter("samount");
		
		String loanterm = request.getParameter("loanterm");
		String purpose = request.getParameter("purpose");
		String interestrate = request.getParameter("interestrate");
		
		
		int amount=Integer.parseInt(sanctionAmount);
		int time=Integer.parseInt(loanterm);
		double interest=Double.parseDouble(interestrate);
		

		double pay = amount*time*(interest)/100;
	    int topay = (int)pay+amount;
	    
	    
		
		
		Loan loan = new Loan();
		loan.setBorrowername(borrowername);
		loan.setSanctionAmount(sanctionAmount);
		loan.setTopay(Integer.toString(topay));
		loan.setDue(Integer.toString(topay));
		loan.setLoanTerm(loanterm);
		loan.setPurpose(purpose);
		loan.setInterestrate(interestrate);
		
		
		String message = borrowerService.applyLoan(loan);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("applyloan");
		mv.addObject("message",message);
		
		return mv;
	}
	
	
	
	
	
	
	
	
	@GetMapping("myloanrequests")
	public ModelAndView viewmyloanrequests(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("myloanrequests");
		 String borrowerName =" ";
		HttpSession session = request.getSession(false);
		Borrower borrower = (Borrower) session.getAttribute("borrower");
		
		if (borrower != null) 
		{
            borrowerName = borrower.getName();
        }
		
		
		List<Loan> loans = borrowerService.viewmyloanrequests(borrowerName);
				
		mv.addObject("loans" ,loans) ;
		return mv;
	}
	

	
	
	@GetMapping("borroweractiveloans")
	public ModelAndView borroweractiveloans(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("borroweractiveloans");
		 String borrowerName =" ";
			HttpSession session = request.getSession(false);
			Borrower borrower = (Borrower) session.getAttribute("borrower");
			
			if (borrower != null) {
	            borrowerName = borrower.getName();
	        }
			
			
			List<Loan> loans = borrowerService.borroweractiveloans(borrowerName, "Active");
					
			mv.addObject("loans" ,loans);
		return mv;
	}
	
	
	
	@GetMapping("showmytransactions")
	public ModelAndView showmytransactions(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("showmytransactions");
		 String borrowerName =" ";
			HttpSession session = request.getSession(false);
			Borrower borrower = (Borrower) session.getAttribute("borrower");
			
			if (borrower != null) {
	            borrowerName = borrower.getName();
	        }
			
			
			List<Transaction> transactions = borrowerService.showmytransactions(borrowerName);
			
					
			mv.addObject("transactions" ,transactions) ;
		return mv;
	}
	
	
	
	
	@GetMapping("payloan")
	public ModelAndView payloan( HttpServletRequest request) 
	{

	    ModelAndView mv = new ModelAndView();

	    String loanid= request.getParameter("lid");
	    String amount= request.getParameter("amount");
	    String msg = borrowerService.payloan(loanid, amount);

	    
	    mv.addObject("msg", msg);

	    mv.setViewName("redirect:/borroweractiveloans");  
	    return mv;
	}
	
	
	
	
	
	@GetMapping("borrowershowtsnbyloanid")
	public ModelAndView borrowershowtsnbyloanid(HttpServletRequest request)
	{
		String loanid= request.getParameter("lid");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("bshowtsnbyloanid");
		
		List<Transaction> transactions = borrowerService.gettransactionsbyloanid(loanid);
			
					
			mv.addObject("transactions" ,transactions) ;
		return mv;
	}
	
	
	
	
	
	@PostMapping("checkborrowerlogin")
	public ModelAndView checkborrowerlogin(HttpServletRequest request)
	{
		
		ModelAndView mv = new ModelAndView();
	
		String bemail = request.getParameter("bemail");
		String bpwd = request.getParameter("bpwd");
		
		Borrower borrower = borrowerService.checkBorrowerLogin(bemail, bpwd);
		
		
		if(borrower!= null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("borrower", borrower);
			mv.setViewName("borrowerhome");
			//long count = borrowerService.customercount();
			//mv.addObject("count",count);
		}
		else 
		{
			mv.setViewName("loginfail");
			mv.addObject("message","Login Failed");
		}
		return mv;
	}
	
	
	@GetMapping("borrowerlogout")
	public String borrowerlogout(HttpServletRequest request) {
	    
	    HttpSession session = request.getSession(false); 

	    if (session != null) {
	        session.removeAttribute("borrower");
	    }
	    
	    return "redirect:/"; 
	}
}


