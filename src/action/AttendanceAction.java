package action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import model.LeaveForm;
import model.Mail;
import model.User;
import service.inter.IAttendanceServer;

@Controller
@RequestMapping(value="/user")
public class AttendanceAction {
	@Autowired
	IAttendanceServer ser2;
	
	
	
	@RequestMapping("/attendanceManagement")
	public String toAttendanceManagement(LeaveForm leaveForm,HttpSession session) {
		User user = (User) session.getAttribute("sessionUser");
		String applicant=user.getUsername();
		List<LeaveForm> listleaveForm = ser2.listLeaveForm(applicant);
		session.setAttribute("listleaveForm", listleaveForm);
		return "attendanceManagement";
	}
	
	
	@RequestMapping("/toApply.action")
	public String toApply(LeaveForm leaveForm,HttpSession session) {
		List<User> userAdmins=ser2.listUserAdmins();
		session.setAttribute("userAdmins", userAdmins);
		return "applyforleave";
	}
	
	
	@RequestMapping("/applyforleave.action")
	public String toApplyforleave(LeaveForm leaveForm) {
		leaveForm.setApprovalStatus("未审批");
		ser2.insertLeaveForm(leaveForm);
		return "applyforleave";
	}
	
	
	@RequestMapping("/ispermit.action")
	public String toIspermit(LeaveForm leaveForm,HttpSession session,HttpServletRequest request) {
		String ridstring=request.getParameter("rid");
		int rid=Integer.parseInt(ridstring);
		LeaveForm oneLeaveForm=ser2.selectOneLeaveForm(rid);
		session.setAttribute("oneLeaveForm", oneLeaveForm);
		return "ispermitread";
	}
	
	
	@RequestMapping("/updatestatus1.action")
	public String toUpdatestatus1(LeaveForm leaveForm,HttpSession session) {
		LeaveForm oneLeaveForm1 = (LeaveForm) session.getAttribute("oneLeaveForm");
		int rid=oneLeaveForm1.getRid();
		ser2.updateByRid1(rid);
		return "redirect:/user/attendanceManagement";
	}
	
	@RequestMapping("/updatestatus2.action")
	public String toUpdatestatus2(LeaveForm leaveForm,HttpSession session) {
		LeaveForm oneLeaveForm2 = (LeaveForm) session.getAttribute("oneLeaveForm");
		int rid=oneLeaveForm2.getRid();
		ser2.updateByRid2(rid);
		return "redirect:/user/attendanceManagement";
	}
}
