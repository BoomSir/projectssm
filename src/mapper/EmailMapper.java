package mapper;

import java.util.List;

import model.Mail;
import model.User;

public interface EmailMapper {
	List<Mail> listMails(String recipient);
	int insertEmail(Mail mail);
	Mail selectOneMail(int mid);
	int updateOneMail(int mid);
	List<Mail> listMails2(String recipient);
	int deleteMail(int mid);
	int updateByMid(int mid);
}
