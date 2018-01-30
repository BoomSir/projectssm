package service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import mapper.UserMapper;
import model.Mail;
import model.User;
import service.inter.IUserServer;

@Service
public class UserServer implements IUserServer {
	
	@Autowired
	UserMapper mapper;
	
	@Override
	public User findByName (User user) {
		return mapper.selectByName(user);
	}

	@Override
	public int updateByname(User user) {
		// TODO Auto-generated method stub
		return mapper.updateMessage(user);
	}

	@Override
	public List<User> listUsers() {
		// TODO Auto-generated method stub
		return mapper.listUsers();
	}

	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return mapper.updateUser(user);
	}

	@Override
	public List<User> selectUserListAll() {
		// TODO Auto-generated method stub
		return mapper.selectUserListAll();
	}

	@Override
	public int insertAccount(User user) {
		// TODO Auto-generated method stub
		return mapper.insertAccount(user);
	}

	

}
