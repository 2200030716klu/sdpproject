package com.klef.jfsd.lms.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.klef.jfsd.lms.model.Loan;
import com.klef.jfsd.lms.model.Transaction;



public interface TransactionRepository extends JpaRepository<Transaction, Integer>
{

	@Query("select t from Transaction t where t.borrowername=?1")
	public List<Transaction> findbyBorrowerName(String borrowername);

	@Query("select t from Transaction t where t.loanid=?1")
	public List<Transaction> findbyloanid(Long loanid);

	@Query("select t from Transaction t where t.lendername=?1")
	public List<Transaction> findbyLenderName(String lendername);
}
