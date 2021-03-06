<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="utf-8"%>
<%@ page import="fcu.selab.progedu.conn.Conn, fcu.selab.progedu.conn.HttpConnect, fcu.selab.progedu.conn.Language"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Locale" %>
<%@ page import="org.gitlab.api.models.*" %>
<%@ page import="org.gitlab.api.GitlabAPI" %>
<%@ page import="java.util.ArrayList" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

<%@ include file="language.jsp" %>

<c:url value="index.jsp" var="displayLan">
<c:param name="Language" value="tw" />
</c:url>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet"
			href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		<!-- jQuery library -->
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
		<!-- Latest compiled JavaScript -->
		<script
			src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
	
		<title>ProgEdu Login</title>
		
		 <script type="text/javascript">
			var Msg ='<%=session.getAttribute("enterError")%>';
			    if (Msg != "null") {
				 function alertName(){
				 	alert("Enter Error! Your username or password is incorrect");
				 } 
			 }
		 </script> 
		 <script type="text/javascript"> window.onload = alertName; </script>
		 <link rel="shortcut icon" href="img/favicon.ico"/>
		 <link rel="bookmark" href="img/favicon.ico"/>
	</head>
	<body  style="background-color:#F5F5F5;">
		
		<div class="container" style="width:300px;height:60px">
	        
			<form class="form-signin" method="post" action="AfterEnter">
			
				<h2 class="form-signin-heading"><fmt:message key="index_h2_plzSignIn"/></h2>
				<input type="hidden" name="grant_type" value="password">
				
				<div class="form-group row">
					<label for="inputUsername" class="col-2 col-form-label"><fmt:message key="index_label_userName"/></label> 
					<div class="col-sm-10">
						<input type="text" id="inputUsername" name="username" class="form-control" placeholder="Username" required autofocus> 
					</div>
				</div>
						
				<div class="form-group row">
					<label for="inputPassword" class="col-2 col-form-label"><fmt:message key="index_label_password"/></label> 
					<br>
					<div class="col-sm-10">
						<input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
					</div>
				</div>
				<input type="hidden" name="language" value="<%=finalLan%>">
				<br>
					
				<button class="btn btn-lg btn-primary btn-block" type="submit"><fmt:message key = "index_btn_signIn"/></button>
	
			</form>
		</div>
		<!-- /container -->
	
	</body>
</html>
