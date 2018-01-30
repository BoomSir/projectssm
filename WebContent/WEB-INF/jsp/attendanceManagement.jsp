<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			
			function ispermit(approvalStatus,isadmin,approver,username,rid)
			{
				var str1=approver;
				var str2=username;
				if(str1==str2){
					if(isadmin==1){
						if(approvalStatus=="未审批"){
							location.href="${pageContext.request.contextPath}/user/ispermit.action?rid="+rid;
						}
						else if(approvalStatus=="审批未通过"){
							var c=confirm("该请假单审核未通过，无法操作");
							}
						else if(approvalStatus=="已审批"){
							var b=confirm("该请假单已审批");
						}
					}else{
						var a=confirm("您不是管理员无法操作");
					}	
				}else{
					var d=confirm("您不是审核人，请转告相应审核人审核");
				}
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
				<a href="${pageContext.request.contextPath}/user/toindex.do" onclick="location.href='${pageContext.request.contextPath}/user/loginOut.action'";>注销</a>
			</div>
		</div>
		<form id="myForm" name="myForm" action="userInfo!editData.action" method="post">
		<input type="hidden" name="u.id" value="26"/>
		<input type="hidden" name="u.sex" value="2" id="u_sex"/>
		<input type="hidden" name="u.supper" value="0" id="u_supper"/>
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
							休假信息列表
						</div>
						<div class="pages">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>申请人</td>
									<td>开始时间</td>
									<td>结束时间</td>
									<td>天数</td>
									<td>审批状态</td>
									<td>原因</td>
								</tr>
								<c:forEach items="${listleaveForm}" var="leaveForm">
								<tr>
									<td>${leaveForm.applicant}</td>
									<td>${leaveForm.begintime}</td>
									<td>${leaveForm.endtime}</td>
					    			<td>${leaveForm.days}</td>
					    			<td><a href="#" onclick="ispermit('${leaveForm.approvalStatus}','${sessionUser.isadmin}','${leaveForm.approver}','${sessionUser.username}','${leaveForm.rid}')">${leaveForm.approvalStatus}</a></td>
					    			<td>${leaveForm.reason}</td>
								</tr>
								</c:forEach>
								<tr><td><input type="button"  id="apply" value="申请休假" onclick="location.href='${pageContext.request.contextPath}/user/toApply.action'" /></td></tr>
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