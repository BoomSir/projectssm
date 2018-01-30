package action;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import model.Mail;
import model.User;
import service.inter.IMailServer;

@Controller
@RequestMapping(value = "/user")
public class MailAction {

	@Autowired
	IMailServer ser1;

	@RequestMapping("/recieveEmail")
	public String toReceiveEmail(Mail mail, HttpSession session) {
		User user = (User) session.getAttribute("sessionUser");
		String recipient = user.getVname();
		List<Mail> listMails = ser1.listMails(recipient);
		session.setAttribute("listMails", listMails);
		return "recieveEmail";
	}

	@RequestMapping("/spam")
	public String toSpam(Mail mail, HttpSession session) {
		User user = (User) session.getAttribute("sessionUser");
		String recipient = user.getVname();
		List<Mail> listMails2 = ser1.listMails2(recipient);
		session.setAttribute("listMails2", listMails2);
		return "spam";
	}

	@RequestMapping("/writeEmail.action")
	public String toWriteEmailAction(Mail mail, @RequestParam("upload") MultipartFile file) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String datestring = sdf.format(date).toString();
		mail.setTime(datestring);
		mail.setIsread(0);
		if (!file.isEmpty()) {
			try {
				file.transferTo(new File("D:/temp/" + file.getOriginalFilename()));
				mail.setFile(file.getOriginalFilename());
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			mail.setFile("");
		}
		ser1.insertEmail(mail);
		return "redirect:/user/writeEmail";
	}

	@RequestMapping("/readEmail.action")
	public String toReadEmail(HttpServletRequest request, HttpSession session) {
		/*
		 * User user = (User) session.getAttribute("sessionUser"); String
		 * recipient=user.getVname(); List<Mail> listMails = ser1.listMails(recipient);
		 * session.setAttribute("listMails", listMails);
		 */
		String midstring = request.getParameter("mid");
		int mid = Integer.parseInt(midstring);
		ser1.updateByMid(mid);
		Mail oneMail = ser1.selectOneMail(mid);
		session.setAttribute("oneMail", oneMail);
		return "readEmail";
	}

	@RequestMapping("/mailChange.action")
	public String toMailChange(HttpServletRequest request) {
		String midstring = request.getParameter("mid");
		int mid = Integer.parseInt(midstring);
		ser1.changeMail(mid);
		return "redirect:/user/recieveEmail";
	}

	@RequestMapping("/mailDelete.action")
	public String toMailDelete(HttpServletRequest request) {
		String midstring = request.getParameter("mid");
		int mid = Integer.parseInt(midstring);
		ser1.deleteMail(mid);
		return "redirect:/user/spam";
	}

	@RequestMapping("/mailBack.action")
	public String toMailBack(HttpServletRequest request) {
		String midstring = request.getParameter("mid");
		int mid = Integer.parseInt(midstring);
		ser1.backMail(mid);
		return "redirect:/user/spam";
	}

	/*
	 * @RequestMapping("/mailBack.action") public String
	 * toMailBack(HttpServletRequest request) { String
	 * midstring=request.getParameter("mid"); int mid=Integer.parseInt(midstring);
	 * ser1.backMail(mid); return "redirect:/user/spam"; }
	 */
	@RequestMapping("/loadDown.action")
	public String downloadFile( HttpServletRequest request,	HttpServletResponse response) {
			File file = new File("D:\\temp\\sn.txt");
			if (file.exists()) {
				response.setContentType("application/force-download");// 设置强制下载不打开
				response.addHeader("Content-Disposition", "attachment;fileName=" + file.getName());// 设置文件名
				byte[] buffer = new byte[1024];
				FileInputStream fis = null;
				BufferedInputStream bis = null;
				try {
					fis = new FileInputStream(file);
					bis = new BufferedInputStream(fis);
					OutputStream os = response.getOutputStream();
					int i = bis.read(buffer);
					while (i != -1) {
						os.write(buffer, 0, i);
						i = bis.read(buffer);
					}
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				} finally {
					if (bis != null) {
						try {
							bis.close();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					if (fis != null) {
						try {
							fis.close();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
			}
		//}
		return null;
	}

}
