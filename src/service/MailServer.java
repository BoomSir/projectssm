package service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.EmailMapper;
import mapper.UserMapper;
import model.Mail;
import model.User;
import service.inter.IMailServer;
import service.inter.IUserServer;

@Service
public class MailServer implements IMailServer {
	
	@Autowired
	EmailMapper mapper;

	@Override
	public List<Mail> listMails(String recipient) {
		// TODO Auto-generated method stub
		return mapper.listMails(recipient);
	}

	@Override
	public int insertEmail(Mail mail) {
		// TODO Auto-generated method stub
		return mapper.insertEmail(mail);
	}

	@Override
	public Mail selectOneMail(int mid) {
		// TODO Auto-generated method stub
		return mapper.selectOneMail(mid);
	}

	@Override
	public int changeMail(int mid) {
		// TODO Auto-generated method stub
		return mapper.updateOneMail(mid);
	}

	@Override
	public List<Mail> listMails2(String recipient) {
		// TODO Auto-generated method stub
		return mapper.listMails2(recipient);
	}

	@Override
	public int deleteMail(int mid) {
		// TODO Auto-generated method stub
		return mapper.deleteMail(mid);
		
	}

	@Override
	public int updateByMid(int mid) {
		// TODO Auto-generated method stub
		return mapper.updateByMid(mid);
	}

	@Override
	public int backMail(int mid) {
		// TODO Auto-generated method stub
		return mapper.updateByMid(mid);
	}

}
