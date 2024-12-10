package com.klef.jfsd.lms.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import com.klef.jfsd.lms.model.Borrower;

public interface BorrowerRepository extends JpaRepository<Borrower, Integer>
{
	@Query("select b from Borrower b where b.email=?1 and b.password=?2 ")
	public Borrower checkborrowerlogin(String email,String password);
	
	@Query("select b from Borrower b where b.name=?1 ")
	public Borrower getBorrowerbyName(String borrowerName);

	
	
}
