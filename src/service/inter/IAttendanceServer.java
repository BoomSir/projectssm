package service.inter;

import java.util.List;

import model.LeaveForm;
import model.User;

public interface IAttendanceServer {

	List<LeaveForm> listLeaveForm(String applicant);

	List<User> listUserAdmins();

	int insertLeaveForm(LeaveForm leaveForm);

	int updateByRid1(int rid);
	
	int updateByRid2(int rid);

	LeaveForm selectOneLeaveForm(int rid);

	
	
}
