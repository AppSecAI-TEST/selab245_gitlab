<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="utf-8"%>
<%@ page import="conn.conn,conn.httpConnect"%>
<%@ page import="java.util.List" import="java.util.ArrayList"
	import="org.gitlab.api.GitlabAPI" import="org.gitlab.api.models.*"%>
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
		
	<script src="./rich_text_js/nicEdit.js"></script>
	
	<script type="text/javascript">
		bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
	</script>
	
	<title>GitlabEdu</title>
	
</head>
<body>
	<%
		if(session.getAttribute("username") == null || session.getAttribute("username").toString().equals("")){
			response.sendRedirect("index.jsp");
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
                <a class="navbar-brand">GitlabEdu</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="teacherHW.jsp">作業</a></li>
                    <li><a href="teacherGroup.jsp">專題</a></li>
                    <li class="dropdown">
                    	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">設定 <span class="caret"></span></a>
                    	<ul class="dropdown-menu">
	                    	<li><a href="teacherManageStudent.jsp">學生管理</a></li>
	                    	<li class="active"><a href="teacherManageHW.jsp">作業管理</a></li>
	                    	<li><a href="teacherManageGroup.jsp">專題管理</a></li>
                    	</ul>
                    </li>
                </ul>
                    <ul class="nav navbar-nav navbar-right">
        <li><a href="memberLogOut.jsp" id="loginLink">登出</a></li>
    </ul>

            </div>
        </div>
    </div>
	<br><br><br>
	
	<div class="container">
		<form class="form-signin" method="post" action="webapi/project/create" enctype="multipart/mixed">
			<div>
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3>派發作業</h3>
					</div>

					<div class="panel-body">
						<div class="form-group">
							<a href="MvnQuickStart.zip"  class="btn btn-default">下載Maven基本專案</a>
							
							<br>
							<label for="Hw_Name">作業名稱:</label>
							<ul class="list-inline">
								<li>OOP -</li>
								<li><input type="text" class="form-control" name="Hw_Name" placeholder="ex. HW1"> </li>
							</ul> 
							
							<label for="importUrl">importUrl:</label>
							<input type="text" name="importUrl" class="form-control">
							
							<!-- 上傳  -->
							<label for="file">Maven專案(限zip檔):</label>
							<input type="file" accept=".zip" name="file" size="50" />
							<!-- ------------- -->
							
						</div>
						
						<div class="form-group">
							<button type="submit" class="btn btn-default btn-block">送出</button>
						</div>
					</div>
				</div>
			</div>
		</form>
		
	</div>
	
</body>
</html>