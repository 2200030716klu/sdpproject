package com.klef.jfsd.lms.service;

import java.util.List;


import com.klef.jfsd.lms.model.Borrower;
import com.klef.jfsd.lms.model.Loan;
import com.klef.jfsd.lms.model.Transaction;

public interface BorrowerService
{

	public String borrowerRegistration(Borrower borrower);	
	public Borrower checkBorrowerLogin(String email,String password);
	
	public String applyLoan(Loan loan);
	
	public List<Loan> viewmyloanrequests(String bname);
	List<Loan> borroweractiveloans(String borrowername ,String status);
	public String payloan(String loanid, String amount);
	String updateBorrowerProfile(Borrower borrower);
	Borrower getBorrower(int id);
	List<Transaction> showmytransactions(String borrowername);
	public List<Transaction> gettransactionsbyloanid(String loanid);
	Borrower getBorrowerbyName(String borrowerName);


}
