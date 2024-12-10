package com.klef.jfsd.lms.service;

import java.util.List;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.klef.jfsd.lms.model.Lender;
import com.klef.jfsd.lms.model.Loan;
import com.klef.jfsd.lms.model.Transaction;
import com.klef.jfsd.lms.repository.LenderRepository;
import com.klef.jfsd.lms.repository.LoanRepository;
import com.klef.jfsd.lms.repository.TransactionRepository;

@Service
public class LenderServiceImpl implements LenderService{


	@Autowired
	private LenderRepository lenderRepository;
	
	@Autowired
	private LoanRepository loanRepository;
	
	@Autowired
	private TransactionRepository transactionRepository;
	
	@Override
	public String lenderRegistration(Lender lender) 
	{
		lenderRepository.save(lender);
		return null;
	}

	@Override
	public Lender checkLenderLogin(String email, String password) {
		return lenderRepository.checklenderlogin(email, password);
	}
	
	
	
	@Override
	public List<Loan> viewloanapplications(String status) 
	{
		
		return loanRepository.viewloanapplications(status);
	}
	
	
	@Override
	public List<Loan> getlenderloans(String lendername) 
	{
		
		return loanRepository.getlenderloans(lendername);
	}
	
	
	
	@Override
	public String approveLoan(long id,String lenderName) 
	{
			Optional<Loan> optionalLoan= loanRepository.findById(id);

		    if (optionalLoan.isPresent()) 
		    {
		        Loan loan = optionalLoan.get();
		        loan.setStatus("Active");
		        loan.setLendername(lenderName);
		        loanRepository.save(loan);
		        
		        return "Lender approved successfully";
		    } else {
		        return "Lender not found. Please try again.";
		    }
	}
	
	
	
	
	@Override
	public List<Loan> lenderactiveloans(String lenderName,String status) 
	{
		
		return loanRepository.lenderactiveloans(lenderName, status);
	}

	@Override
	public List<Transaction> gettransactionsbyloanid(String lid) 
	{
		
		long loanid = Long.parseLong(lid);
		return transactionRepository.findbyloanid(loanid);
	}
	
	@Override
	public String updateLenderProfile(Lender lender)
	{
		Lender l = lenderRepository.findById(lender.getId()).get();
		
		l.setName(lender.getName());
		l.setGender(lender.getGender());
		l.setDateofbirth(lender.getDateofbirth());
		l.setAddress(lender.getAddress());
		l.setContact (lender.getContact());
		l.setImage(lender.getImage());
		l.setPassword(lender.getPassword());
		
		lenderRepository.save(l);
		
		return "Lender Updated Successfully";
		
	}
	
	
	

	@Override
	public Lender getLender(int id) 
	{
		
		Lender l = lenderRepository.findById(id).get();
		return l;
	}

	@Override
	public List<Transaction> showmytransactions(String lendername) {
		
		return transactionRepository.findbyLenderName(lendername);
	}

	@Override
	public List<Loan> viewsanctionedloans(String lendername) {
		return loanRepository.findByLendername(lendername);
	}

	@Override
	public Lender getLenderbyName(String lendername) {
		return lenderRepository.getLenderbyName(lendername);
	}

	

	
}
