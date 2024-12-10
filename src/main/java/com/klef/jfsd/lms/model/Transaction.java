package com.klef.jfsd.lms.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "transaction_data")
public class Transaction
{
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="transactionid")
    private Long id;

    
	@Column(name="loanid")
    private Long loanid;
    
    @Column(name="borrowername")
    private String borrowername;
    
    @Column(name="lendername")
    private String lendername;

    @Column(name="transactionamount",nullable = false)
    private String transactionamount;
    
    @Column(name="date")
    private String date;
    
    @Column(name="time")
    private String time;

    
    
    
    public Long getLoanid() {
		return loanid;
	}

	public void setLoanid(Long loanid) {
		this.loanid = loanid;
	}

    
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getBorrowername() {
		return borrowername;
	}

	public void setBorrowername(String borrowername) {
		this.borrowername = borrowername;
	}

	public String getLendername() {
		return lendername;
	}

	public void setLendername(String lendername) {
		this.lendername = lendername;
	}

	public String getTransactionamount() {
		return transactionamount;
	}

	public void setTransactionamount(String transactionamount) {
		this.transactionamount = transactionamount;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
    
    
 

}




