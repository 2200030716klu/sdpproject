package com.klef.jfsd.lms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.lms.model.Admin;
import com.klef.jfsd.lms.model.Borrower;
import com.klef.jfsd.lms.model.Lender;
import com.klef.jfsd.lms.model.Loan;
import com.klef.jfsd.lms.repository.AdminRepository;
import com.klef.jfsd.lms.repository.BorrowerRepository;
import com.klef.jfsd.lms.repository.LenderRepository;
import com.klef.jfsd.lms.repository.LoanRepository;


@Service
public class AdminServiceImpl implements AdminService
{
	
//	@Autowired
//	private CustomerRepository customerRepository;
//	
	@Autowired
	private AdminRepository adminRepository;
	
	@Autowired
	private BorrowerRepository borrowerRepository;
	
	@Autowired
	private LenderRepository lenderRepository;
	
	@Autowired
	private LoanRepository loanRepository;
	
	

	@Override
	public Admin checkAdminLogin(String uname, String pwd) {
		return adminRepository.checkAdminLogin(uname, pwd);
	}
	


	
	@Override
	public List<Borrower> viewAllBorrowers() 
	{
		return borrowerRepository.findAll();
	}
	
	
	@Override
	public long borrowercount() {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public List<Lender> viewAllLenders() {
		return lenderRepository.findAll();
	}



	@Override
	public List<Loan> viewAllLoans() {
		return	loanRepository.findAll();
 	}



	@Override
	public void deleteborrower(int id) {
		borrowerRepository.deleteById(id);
		
	}




	@Override
	public void deletelender(int id) {
		lenderRepository.deleteById(id);
	}




	@Override
	public void deleteloan(int loanid)
	{
		loanRepository.deleteById((long) loanid);
		
	}




	@Override
	public Loan getLoanById(int id) 
	{
		return loanRepository.findById((long) id).get();
	}




	    


}
