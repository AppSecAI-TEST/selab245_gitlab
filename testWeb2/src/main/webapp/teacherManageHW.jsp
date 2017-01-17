<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ page import="conn.conn"%>
<%@ page import="java.util.List" import="java.util.ArrayList"
	import="org.gitlab.api.GitlabAPI" import="org.gitlab.api.models.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet"
		href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
	<title>Teacher Dashboard</title>
<title>Insert title here</title>
</head>
<body>
	<%
		if(session.getAttribute("username") == null || session.getAttribute("username").toString().equals("")){
			response.sendRedirect("memberEnter.jsp");
		}
	%>
	<div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand">Teacher Dashboard</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="teacherDashboard.jsp">�ǥ�Projects</a></li>
                    <li><a href="teacherHW.jsp">�@�~</a></li>
                    <li><a href="teacherGroup.jsp">�M�D</a></li>
                    <li class="active"><a href="teacherManageHW.jsp">�@�~�޲z</a></li>
                    <li><a href="#">�M�D�޲z</a></li>
                </ul>
                    <ul class="nav navbar-nav navbar-right">
        <li><a href="memberLogOut.jsp" id="loginLink">�n�X</a></li>
    </ul>

            </div>
        </div>
    </div>
	<br><br><br>
	
	<div class="container">
		<form class="form-signin" method="post" action="CreateProject.jsp">
			<div>
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3>���o�@�~</h3>
					</div>

					<div class="panel-body">
						<div class="form-group">
							<label for="Hw_Name">�@�~�W��:</label> 
							<input type="text" class="form-control" name="Hw_Name"> 
							
							<label for="eInputPassword">�@�~�y�z:</label>
							<input type="text" class="form-control" name="Hw_Description">
						</div>
						
						<div class="form-group">
							<button type="submit" class="btn btn-default btn-block">�e�X</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	
</body>
</html>