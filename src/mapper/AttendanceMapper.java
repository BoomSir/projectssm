package mapper;

import java.util.List;

import model.LeaveForm;
import model.User;

public interface AttendanceMapper {

	List<LeaveForm> selectLeaveForms(String applicant);

	List<User> selectListUserAdmins();

	int insertLeaveForm(LeaveForm leaveForm);

	int updateByRid1(int rid);
	
	int updateByRid2(int rid);

	LeaveForm selectOneLeaveForm(int rid);

	
	
}
