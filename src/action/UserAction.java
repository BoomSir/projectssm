package action;

import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.org.apache.regexp.internal.recompile;

import model.User;
import service.inter.IUserServer;
@Controller
@RequestMapping(value="/user")
public class UserAction {
	@Autowired
	IUserServer ser;
	/*
	 * 转到登入页面
	 */
	@RequestMapping("/tologin.do")
	public String dologin() {
		return "login";
	}
	/*
	 * 登入
	 */
	@RequestMapping(value="/login.do",produces="plain/text;charset=UTF-8")
	@ResponseBody
	public String doLogin(User user,HttpSession session) {
		User findUser = ser.findByName(user);
		if (findUser!=null) {
			if(findUser.getPassword().equals(user.getPassword())) {
				//准许登入
				session.setAttribute("sessionUser", findUser);
				return "1";
			}else {
				return "0";
			}
		}else {
			return "0";
		}	
	}
	
	
	/*
	 * 转到首页
	 */
	@RequestMapping("/toindex.do")
	public String index() {
		return "index";
	}
	/*
	 * 转到个人信息编辑页
	 */
	@RequestMapping("/personalMessage")
	public String toPersonalMessage() {
		return "personalMessage";
	}
	
	/*
	 * 转到个人账户
	 */
	@RequestMapping("/personalAccount")
	public String toPersonalAccount() {
		return "personalAccount";
	}
	/*
	 * 提交个人信息
	 */
	@RequestMapping("/submitMessage")
	public String toSubmitMessage(User user,HttpSession session) {
		int s=ser.updateByname(user);
		if(s==1) {
			User findUser = ser.findByName(user);
			session.setAttribute("sessionUser", findUser);
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping("/writeEmail")
	public String towrite(HttpServletRequest request) {
		List<User> listUsers = ser.listUsers();
		request.setAttribute("listUsers", listUsers);
		return "writeEmail";
	}
	
	/*注销*/
	@RequestMapping("/loginOut.action")
	public String toLoginOut(HttpSession session) {
		session.removeAttribute("sessionUser");
		return "login";
	}
	
	
	@RequestMapping("/editPerson.action")
	public String toEditPerson(HttpSession session) {
		return "writePersonalAccount";
	}
	
	@RequestMapping("/backp.action")
	public String toBackp() {
		return "personalAccount";
	}
	
	@RequestMapping("/editPersonsuccess.action")
	public String toEditPersonsuccess(User user) {
		String vname=user.getVname();
		String password=user.getPassword();
		ser.updateUser(user);
		return "success";
	}
	
	@RequestMapping("/allAccount")
	public String toAllAccount(HttpSession session) {
		User user=(User) session.getAttribute("sessionUser");
		int isadmin=user.getIsadmin();
		if(isadmin==0) {
			return "failAccount";
		}else {
			List<User> userlistall=ser.selectUserListAll();
			session.setAttribute("userlistall", userlistall);
			return "allAccount";
		}
	}
	
	
	@RequestMapping("/insertdate.action")
	public String toInsertdate() {
			return "insertAccount";
		}
	

	@RequestMapping("/backa.action")
	public String toBacka() {
			return "redirect:/user/allAccount";
		}
	
	@RequestMapping("/insertAccount.action")
	public String toInsertAccount(User user) {
		user.setId(UUID.randomUUID().toString());
		user.setIsadmin(0);
		ser.insertAccount(user);
		return "redirect:/user/allAccount";
	}
}
