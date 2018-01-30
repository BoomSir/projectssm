package service.inter;

import java.util.List;

import model.Mail;
import model.User;

public interface IUserServer {
	User findByName(User user);
	int updateByname(User user);
	List<User> listUsers();
	int updateUser(User user);
	List<User> selectUserListAll();
	int insertAccount(User user);
	
}
