package com.klef.jfsd.lms.service;

import java.util.List;

import com.klef.jfsd.lms.model.Lender;
import com.klef.jfsd.lms.model.Loan;
import com.klef.jfsd.lms.model.Transaction;

public interface LenderService 
{
	
	public String lenderRegistration(Lender lender);	
	public Lender checkLenderLogin(String email,String password);
	List<Loan> viewloanapplications(String status);
	String approveLoan(long id, String lenderName);
	List<Loan> lenderactiveloans(String lenderName, String status);
	public List<Transaction> gettransactionsbyloanid(String loanid);
	String updateLenderProfile(Lender lender);
	Lender getLender(int id);
	public List<Transaction> showmytransactions(String lendername);
	public List<Loan> viewsanctionedloans(String lendername);
	List<Loan> getlenderloans(String lendername);
	public Lender getLenderbyName(String lendername);

}
