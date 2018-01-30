<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<head>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>办公自动化管理系统</title>
<!-- <script>
	function setit() {
		debugger
		var a = document.forms[0]
		document.forms[0].submit();
	}
</script> -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
</head>

<body>
	<div class="top">
		<div class="global-width">
			<img src="${pageContext.request.contextPath}/Images/logo.gif"
				class="logo" />
		</div>
	</div>
	<div class="status">
		<div class="global-width">
			${sessionUser.vname}
			你好！欢迎访问办公管理系统！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"
				onclick="location.href='${pageContext.request.contextPath}/user/loginOut.action'";>注销</a>
		</div>
	</div>
	<form id="myForm" name="myForm"
		action="${pageContext.request.contextPath}/user/updatestatus1.action"
		 method="post">
		<input type="hidden" name="operating" value="${sessionUser.vname}" />
		<div class="main">
			<div class="global-width">



				<div class="nav" id="nav">
					<div class="t"></div>
					<dl>
						<dt
							onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">信息管理
						</dt>
						<dd>
							<a href="${pageContext.request.contextPath}/user/personalMessage"
								target="_self">个人信息</a>
						</dd>
					</dl>
					<dl>
						<dt
							onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
							邮件管理</dt>
						<dd>
							<a href="${pageContext.request.contextPath}/user/writeEmail"
								target="_self">写邮件</a>
						</dd>
						<dd>
							<a href="${pageContext.request.contextPath}/user/recieveEmail"
								target="_self">收邮件</a>
						</dd>
						<dd>
							<a href="${pageContext.request.contextPath}/user/spam"
								target="_self">垃圾邮件</a>
						</dd>
					</dl>
					<dl>
						<dt
							onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
							考勤管理</dt>
						<dd>
							<a
								href="${pageContext.request.contextPath}/user/attendanceManagement"
								target="_self">休假</a>
						</dd>
					</dl>

					<dl>

						<dt
							onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
							权限管理</dt>
						<dd>
							<a href="${pageContext.request.contextPath}/user/personalAccount"
								target="_self">个人账户</a>
						</dd>
						<dd>
							<a href="${pageContext.request.contextPath}/user/allAccount" target="_self">管理账户</a>
						</dd>
					</dl>
				</div>

				<div class="action">
					<div class="t">休假审核</div>
					<div class="pages">
						<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="right" width="30%">姓名：</td>
								<td align="left"><input type="text" name="applicant"
									id="applicant" value="${oneLeaveForm.applicant}"
									readonly="readonly" /></td>
							</tr>
							<tr>
								<td align="right" width="30%">开始时间：</td>
								<td align="left"><input type="text" name="begintime"
									id="begintime" value="${oneLeaveForm.begintime}"
									readonly="readonly" /></td>
							</tr>
							<tr>
								<td align="right" width="30%">结束时间：</td>
								<td align="left"><input type="text" name="endtime"
									id="endtime" value="${oneLeaveForm.endtime}"
									readonly="readonly" /></td>
							</tr>
							<tr>
								<td align="right" width="30%">请假天数：</td>
								<td align="left"><input type="text" name="days" id="days"
									value="${oneLeaveForm.endtime}" readonly="readonly" /></td>
							</tr>
							<tr>
								<td align="right" width="30%">请假原因：</td>
								<td align="left"><textarea rows="10" cols="30"
										name="reason" readonly="readonly">
										${oneLeaveForm.reason}
										</textarea></td>
							</tr>
							<tr>
								<td align="right" width="30%">申请人：</td>
								<td align="left">${oneLeaveForm.applicant}</td>

							</tr>
							<tr>
								<td><input type="button" id="shenhetongguo" value="审核通过"
									onclick="location.href='${pageContext.request.contextPath}/user/updatestatus1.action'" /> 
									<input type="button" id="butongguo"
									value="审核不通过"
									onclick="location.href='${pageContext.request.contextPath}/user/updatestatus2.action'" /></td>
							</tr>
						</table>

					</div>
				</div>
			</div>
		</div>

	</form>
	<div class="copyright">Copyright &nbsp; &copy; &nbsp;</div>
</body>
</html>