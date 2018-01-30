<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
		<form id="myForm" name="myForm" action="${pageContext.request.contextPath}/user/submitMessage" method="post">
		<input type="hidden" name="id" value="${sessionUser.id}"/>
		<input type="hidden" name="username" value="${sessionUser.username}" id="username"/> 
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
							个人信息
						</div>
						<div class="pages">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr >
									<td align="right" width="30%">昵称：</td><td align="left"><input type="text" name="vname" id="vname" value="${sessionUser.vname }"/></td>
								</tr>
								<tr >
									<td align="right" width="30%">年龄：</td><td align="left"><input type="text" name="age" id="age" value="${sessionUser.age }"/></td>
								</tr>
								<tr >
									<td align="right" width="30%">性别：</td><td align="left">
										<input type="text" name="sex" id="sex" value="${sessionUser.sex }"/>
									</td>
								</tr>
								<tr >
									<td align="right" width="30%">手机：</td><td align="left"><input type="text" name="phone" id="phone" value="${sessionUser.phone }"/></td>
								</tr>
								<tr >
									<td align="right" width="30%">地址：</td><td align="left"><input type="text" name="address" id="address" value="${sessionUser.address }"/></td>
								</tr>
								<tr >
									<td align="center" colspan="2"><br/>
									<input type="button"  id="save" value="提交数据" onclick="setit()" />
									<input type="button"  id="backindex" value="返回主页" onclick="location.href='${pageContext.request.contextPath}/user/toindex.do'" /></td>
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
</html>