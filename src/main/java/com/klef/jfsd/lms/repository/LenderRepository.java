package com.klef.jfsd.lms.repository;

import org.springframework.data.jpa.repository.JpaRepository;



import org.springframework.data.jpa.repository.Query;

import com.klef.jfsd.lms.model.Lender;

public interface LenderRepository extends JpaRepository<Lender, Integer>
{
	@Query("select l from Lender l where l.email=?1 and l.password=?2 ")
	public Lender checklenderlogin(String email,String password);

	@Query("select l from Lender l where l.name=?1")
	public Lender getLenderbyName(String lendername);

}