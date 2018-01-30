package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import mapper.AttendanceMapper;
import model.LeaveForm;
import model.User;
import service.inter.IAttendanceServer;

@Service
public class AttendanceServer implements IAttendanceServer {
	
	@Autowired
	AttendanceMapper mapper;

	@Override
	public List<LeaveForm> listLeaveForm(String applicant) {
		// TODO Auto-generated method stub
		return mapper.selectLeaveForms(applicant);
	}

	@Override
	public List<User> listUserAdmins() {
		// TODO Auto-generated method stub
		return mapper.selectListUserAdmins();
	}

	@Override
	public int insertLeaveForm(LeaveForm leaveForm) {
		// TODO Auto-generated method stub
		return mapper.insertLeaveForm(leaveForm);
	}

	@Override
	public int updateByRid1(int rid) {
		// TODO Auto-generated method stub
		return mapper.updateByRid1(rid);
	}

	@Override
	public LeaveForm selectOneLeaveForm(int rid) {
		// TODO Auto-generated method stub
		return mapper.selectOneLeaveForm(rid);
	}

	@Override
	public int updateByRid2(int rid) {
		// TODO Auto-generated method stub
		return mapper.updateByRid2(rid);
	}

	

}
