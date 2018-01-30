package mapper;

import java.util.List;

import model.Mail;
import model.User;

public interface UserMapper {
	User selectByName(User user);
	int updateMessage(User user);
	List<User> listUsers();
	int updateUser(User user);
	List<User> selectUserListAll();
	int insertAccount(User user);
}
