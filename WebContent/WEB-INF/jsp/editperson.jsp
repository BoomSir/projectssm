<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<head>
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>办公自动化管理系统</title>
		<script>
			function setit()
			{
				document.forms[0].submit();
			}
		</script>
	</head>
	
	<body>
		<div class="top">
			<div class="global-width">
				<img src="${pageContext.request.contextPath}/Images/logo.gif" class="logo" />
			</div>
		</div>
		<div class="status">
			<div class="global-width">
				${sessionUser.vname} 你好！欢迎访问办公管理系统！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" onclick="location.href='${pageContext.request.contextPath}/user/loginOut.action'";>注销</a>
			</div>
		</div>
		<form id="userForm" name="userForm" action="personalAccount" method="post">
		<input type="hidden" name="username" value="${sessionUser.username}"/>
		<div class="main">
			<div class="global-width">
				
 

    <div class="nav" id="nav">
					<div class="t"></div>
					<dl>
							<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">信息管理 
						</dt>
						<dd>
							<a href="${pageContext.request.contextPath}/user/personalMessage" target="_self">个人信息</a>
						</dd>
					</dl>
					<dl>
						<dt
							onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
							邮件管理
						</dt>
						<dd>
							<a href="${pageContext.request.contextPath}/user/writeEmail" target="_self">写邮件</a>
						</dd>
						<dd>
							<a href="${pageContext.request.contextPath}/user/recieveEmail" target="_self">收邮件</a>
						</dd>
						<dd>
							<a href="${pageContext.request.contextPath}/user/spam" target="_self">垃圾邮件</a>
						</dd>
					</dl>
					<dl>
						<dt
							onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
							考勤管理
						</dt>
						<dd>
							<a href="${pageContext.request.contextPath}/user/attendanceManagement" target="_self">休假</a>
						</dd>
					</dl>
					
					<dl >
					
						<dt
							onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
							权限管理
						</dt>
						<dd>
							<a href="${pageContext.request.contextPath}/user/personalAccount" target="_self">个人账户</a>
						</dd>
						<dd>
							<a href="${pageContext.request.contextPath}/user/allAccount" target="_self">管理账户</a>
						</dd>
					</dl>
				</div>
				
				<div class="action">
						<div class="t">
							个人账户
						</div>
						<div class="pages">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr >
									<td align="right" width="30%">用户名：</td><td  align="left"><input type="text" name="vname"  id="vname"/></td>
								</tr>
								<tr >
									<td align="right" width="30%">密码：</td><td  align="left"><input type="text" name="password"   id="password"/></td>
								</tr>
								<tr >
									<td align="center" colspan="2"><br/><input type="button"  id="save" value="编辑数据" onclick="setit()" /></td>
								</tr>
								</table>
						</div>
					</div>
				</div>
				</div>
				</form>
		<div class="copyright">
			Copyright &nbsp; &copy; &nbsp; 
		</div>

	</body>
	<script type="text/javascript">
	 $(function(){
		$("#userForm").validate({
			rules : {
				username:"required",
				password:{required:true,minlength:5}
			},
			message : {
				username:"用户名不为空",
				password:{required:"请输入密码",minlength:"密码过短"}
			}
		});
	}) 
</script>
</html>