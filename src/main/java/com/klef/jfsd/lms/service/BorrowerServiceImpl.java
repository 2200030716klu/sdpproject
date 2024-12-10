package com.klef.jfsd.lms.service;

import java.util.List;


import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Service;

import com.klef.jfsd.lms.model.Borrower;
import com.klef.jfsd.lms.model.Loan;
import com.klef.jfsd.lms.model.Transaction;
import com.klef.jfsd.lms.repository.BorrowerRepository;
import com.klef.jfsd.lms.repository.LoanRepository;
import com.klef.jfsd.lms.repository.TransactionRepository;

import java.sql.Blob;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;



@Service
public class BorrowerServiceImpl implements BorrowerService {

	
	@Autowired
	private BorrowerRepository borrowerRepository;
	
	@Autowired
	private LoanRepository loanRepository;
	
	@Autowired
	private TransactionRepository transactionRepository;
	
	
	@Override
	public String borrowerRegistration(Borrower borrower) {
		borrowerRepository.save(borrower);
		return "Borrower Registered Successfully";
	}

	@Override
	public Borrower checkBorrowerLogin(String email, String password) {
		return borrowerRepository.checkborrowerlogin(email, password);
	}

	@Override
	public String applyLoan(Loan loan) {
		 loanRepository.save(loan);
		 return "Lender Application sent successfully";
	}
	
	@Override
	public List<Loan> viewmyloanrequests(String bname) 
	{
		return loanRepository.findByBorrowername(bname);
	}
	
	@Override
	public List<Loan> borroweractiveloans(String borrowername,String status) 
	{
		
		return loanRepository.borroweractiveloans(borrowername, status);
	}
	
	
	@Override
	public List<Transaction> showmytransactions(String borrowername) 
	{
		
		return transactionRepository.findbyBorrowerName(borrowername);
	}
	
	@Override
	public List<Transaction> gettransactionsbyloanid(String lid) {
		long loanid = Long.parseLong(lid);
		return transactionRepository.findbyloanid(loanid);
		 
	}
	
	

	public List<Loan> getLoansByBorrowerName(String name) {
        return loanRepository.findByBorrowername(name);
    }

	@Override
	public String payloan(String id, String amt) 
	{
		long loanid = Long.parseLong(id); 
	  	int amount = Integer.parseInt(amt);
		Optional<Loan> optionalLoan= loanRepository.findById(loanid);
		

	    if (optionalLoan.isPresent()) {
	        Loan loan = optionalLoan.get();
	        int paid = Integer.parseInt(loan.getPaid());
	        paid+=amount;
	        
	        Transaction t = new Transaction();
	        
	        LocalDate currentDate = LocalDate.now();
	        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
	        String formattedDate = currentDate.format(dateFormatter);
	        
	        LocalTime currentTime = LocalTime.now();
	        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
	        String formattedTime = currentTime.format(timeFormatter);
	        
	        
	        
	        t.setLoanid(loan.getId());
	        t.setBorrowername(loan.getBorrowername());
	        t.setLendername(loan.getLendername());
	        t.setDate(formattedDate);
	        t.setTime(formattedTime);	      
	        t.setTransactionamount(amt);
	        
	        
	        transactionRepository.save(t);


	        int topay = Integer.parseInt(loan.getTopay());
	        int due=topay-paid;
	        
	        if(due==0)
	        {
	        	loan.setStatus("Cleared");
	        }
	        
	        loan.setPaid(Integer.toString(paid));
	        loan.setDue(Integer.toString(due));
	        		
	  
	        loanRepository.save(loan);
	        
	        return "Loan paid successfully";
	    } else {
	        return "Loan not Paid. Please try again.";
	    }
		
	}
	
	
	
	
	@Override
	public String updateBorrowerProfile(Borrower borrower) 
	{
		Borrower b = borrowerRepository.findById(borrower.getId()).get();
		
		b.setGender(borrower.getGender());
		b.setDateofbirth(borrower.getDateofbirth());
		b.setAddress(borrower.getAddress());
		b.setEmpstatus(borrower.getEmpstatus());
		b.setAnnual_income(borrower.getAnnual_income());
		b.setContact (borrower.getContact());
		b.setPassword(borrower.getPassword());
		b.setImage(borrower.getImage());
		
		borrowerRepository.save(b);
		
		return "Borrower Updated Successfully";
		
	}
	
	
	@Override
	public Borrower getBorrower(int id)
	{
		Borrower b = borrowerRepository.findById(id).get();
		return b;
	}
	
	
	@Override
	public Borrower getBorrowerbyName(String borrowerName)
	{
		Borrower b = borrowerRepository.getBorrowerbyName(borrowerName);
		return b;
	}


	
	

}
