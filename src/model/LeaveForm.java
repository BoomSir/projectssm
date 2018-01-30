package model;

public class LeaveForm {
	/*`applicant` varchar(255) NOT NULL,
	  `begintime` varchar(255) NOT NULL,
	  `endtime` varchar(255) NOT NULL,
	  `days` int(16) NOT NULL,
	  `approvalStatus` varchar(255) NOT NULL,
	  `reason` varchar(255) NOT NULL,
	  `rid` int(16) NOT NULL AUTO_INCREMENT,
	  PRIMARY KEY (`rid`)*/
	private String applicant;
	private String begintime;
	private String endtime;
	private int days;
	private String approvalStatus;
	private String reason;
	private int rid;
	private String approver;
	
	public String getApplicant() {
		return applicant;
	}
	public void setApplicant(String applicant) {
		this.applicant = applicant;
	}
	public String getBegintime() {
		return begintime;
	}
	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public int getDays() {
		return days;
	}
	public void setDays(int days) {
		this.days = days;
	}
	public String getApprovalStatus() {
		return approvalStatus;
	}
	public void setApprovalStatus(String approvalStatus) {
		this.approvalStatus = approvalStatus;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getApprover() {
		return approver;
	}
	public void setApprover(String approver) {
		this.approver = approver;
	}
	public LeaveForm() {
		super();
	}
}
