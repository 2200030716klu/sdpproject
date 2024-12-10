package com.klef.jfsd.lms.service;

import java.util.List;

import com.klef.jfsd.lms.model.Lender;
import com.klef.jfsd.lms.model.Loan;
import com.klef.jfsd.lms.model.Admin;
import com.klef.jfsd.lms.model.Borrower;

public interface AdminService
{
	public List<Borrower> viewAllBorrowers();
	public Admin checkAdminLogin (String uname,String pwd);
	long borrowercount();
	public List<Lender> viewAllLenders();
	public void deleteborrower(int id);
	public void deletelender(int id);
	public List<Loan> viewAllLoans();
	public void deleteloan(int loanid);
	public Loan getLoanById(int id);

}
