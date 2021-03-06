<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.captcha.botdetect.web.servlet.Captcha"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>eCommerce Application</title>
</head>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <ul class="nav navbar-nav">
    <div class="navbar-header">
      <a class="navbar-brand">Create Users for Admin</a>
    </div>
    </ul>
  </div>
</nav>
<div class="container">
	<font color="red">${errorMessage}</font>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<form action="${contextPath}/create.htm" method="POST">
	<div class="form-group">
		<table class="table-striped">
			<tr>
				<td>User Email:</td>
				<td><input type="text" name="username" size="30"
					required="required" /></td>
			</tr>

			<tr>
				<td>Password:</td>
				<td><input type="password" name="password" size="30"
					required="required" /></td>
			</tr>
			<c:set var="check" scope="session" value="${requestScope.admin}" />
			<c:if test="${check == 'admin'}">
				<tr>
				<td>Select Role</td>
					<td>
					<select name="role">
							<option value="admin">Admin</option>
							<option value="customer">Customer</option>
							<option value="shopowner">ShopOwner</option>
					</select>
					</td>
				</tr>
			</c:if>
			<tr>
				<td colspan="2"><label for="captchaCode" class="prompt">Retype
						the characters from the picture:</label> <%
 	// Adding BotDetect Captcha to the page
 	Captcha captcha = Captcha.load(request, "CaptchaObject");
 	captcha.setUserInputID("captchaCode");

 	String captchaHtml = captcha.getHtml();
 	out.write(captchaHtml);
 %> <input id="captchaCode" type="text" name="captchaCode"
					required="required" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Login" /></td>
			</tr>

		</table>
		</div>
	</form>
	</div>
</body>
</html>