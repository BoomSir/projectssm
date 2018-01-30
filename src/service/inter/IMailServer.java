package service.inter;

import java.util.List;

import model.Mail;
import model.User;

public interface IMailServer {
	List<Mail> listMails(String recipient);
	int insertEmail(Mail mail);
	Mail selectOneMail(int mid);
	int changeMail(int mid);
	List<Mail> listMails2(String recipient);
	int deleteMail(int mid);
	int updateByMid(int mid);
	int backMail(int mid);
}
