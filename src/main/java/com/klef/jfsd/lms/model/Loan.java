package com.klef.jfsd.lms.model;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "loan_data")
public class Loan
{
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="loanid")
    private Long id;

    @Column(name="borrowername")
    private String borrowername;
    
    @Column(name="lendername")
    private String lendername;

    @Column(name="sanctionamount",nullable = false)
    private String sanctionAmount;
    
    @Column(name="topay")
    private String topay;

	@Column(name="paid")
    private String paid="0";
	
	@Column(name="due")
    private String due="0";
    
	@Column(name="loanterm",nullable = false)
    private String loanTerm;  // in months

    @Column(name="purpose")
    private String purpose;
    
    @Column(name="interestrate",nullable = false)
    private String interestrate;
    
    @Column(name="status", columnDefinition="varchar(255) default 'NotApproved' ")
    private String status="Pending";
    
       
    
    
    
    
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

	public String getSanctionAmount() {
		return sanctionAmount;
	}

	public void setSanctionAmount(String sanctionAmount) {
		this.sanctionAmount = sanctionAmount;
	}

    public String getTopay() {
		return topay;
	}

	public void setTopay(String topay) {
		this.topay = topay;
	}

	public String getPaid() {
		return paid;
	}

	public void setPaid(String paid) {
		this.paid = paid;
	}

	public String getDue() {
		return due;
	}

	public void setDue(String due) {
		this.due = due;
	}


	public String getLoanTerm() {
		return loanTerm;
	}

	public void setLoanTerm(String loanTerm) {
		this.loanTerm = loanTerm;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String Purpose) {
		purpose = Purpose;
	}

	public String getInterestrate() {
		return interestrate;
	}

	public void setInterestrate(String interestrate) {
		this.interestrate = interestrate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}




