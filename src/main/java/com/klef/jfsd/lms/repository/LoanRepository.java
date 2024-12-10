package com.klef.jfsd.lms.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.klef.jfsd.lms.model.Loan;

public interface LoanRepository extends JpaRepository<Loan, Long>
{
	
	List<Loan> findByBorrowername(String borrowername);
	
	@Query("select l from Loan l where l.borrowername=?1 and l.status=?2 ")
	public List<Loan> borroweractiveloans(String borrowername,String status);

	@Query("select l from Loan l where l.lendername=?1 and l.status=?2 ")
	List<Loan> lenderactiveloans(String lenderName, String status);
	
	@Query("select l from Loan l where l.status=?1 ")
	List<Loan> viewloanapplications(String status);

	List<Loan> findByLendername(String lendername);

	@Query("select l from Loan l where l.lendername=?1")
	List<Loan> getlenderloans(String lendername);

}