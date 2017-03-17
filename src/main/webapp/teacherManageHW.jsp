<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="utf-8"%>
<%@ page import="conn.conn,conn.httpConnect,conn.Language"%>
<%@ page import="java.util.List" import="java.util.ArrayList"
	import="org.gitlab.api.GitlabAPI" import="org.gitlab.api.models.*"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	
	<script type="text/javascript">
		function handleClick(cb, divId){
			var o=document.getElementById(divId);
			if(cb.checked){
				o.style.display='';
			}else{
				o.style.display='none';
			}
		}
	</script>
	
	<title>ProgEdu</title>
	
</head>
<body>
	<%
		if(session.getAttribute("username") == null || session.getAttribute("username").toString().equals("")){
			response.sendRedirect("index.jsp");
		}
		Language language = new Language();
		session.putValue("page", "teacherManageHW");
		String lan = session.getAttribute("language").toString();
		String basename = language.getBaseName(lan);
		System.out.println("lan : " + lan);
		System.out.println("basename : " + basename);
	%>
	
	<!-- 設定語言 -->
	<fmt:setBundle basename = "<%=basename %>"/>
	
	<div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand">ProgEdu</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="teacherHW.jsp"><fmt:message key="top_navbar_dashboard"/></a></li>
                    <li><a href="teacherGroup.jsp"><fmt:message key="top_navbar_groupProject"/></a></li>
                    <li class="dropdown">
                    	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                    		<fmt:message key="top_navbar_manage"/> <span class="caret"></span></a>
                    	<ul class="dropdown-menu">
	                    	<li><a href="teacherManageStudent.jsp"><fmt:message key="top_navbar_manageStudent"/></a></li>
	                    	<li class="active"><a href="teacherManageHW.jsp"><fmt:message key="top_navbar_manageHW"/></a></li>
	                    	<li><a href="teacherManageGroup.jsp"><fmt:message key="top_navbar_manageGroup"/></a></li>
                    	</ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                	<li class="dropdown">
                    	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                    		<fmt:message key="top_navbar_language"/> <span class="caret"></span></a>
                    	<ul class="dropdown-menu" >
	                    	<li id="English" value="English"><a href="chooseLanguage?language=English"><fmt:message key="top_navbar_lanEnglish"/></a></li>
	                    	<li id="Chinese" value="Chinese"><a href="chooseLanguage?language=Chinese"><fmt:message key="top_navbar_lanChinese"/></a></li>
                    	</ul>
                    </li>
        			<li><a href="memberLogOut.jsp" id="loginLink"><fmt:message key="top_navbar_signOut"/></a></li>
    			</ul>
            </div>
        </div>
    </div>
	<br><br><br>
	
	<div class="container">
		<form class="form-signin" method="post" action="webapi/project/create" enctype="multipart/form-data">
			<div>
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3><fmt:message key="teacherManageHW_h3_distributeHW"/></h3>
					</div>

					<div class="panel-body">
						<div class="col-md-4">
							<div class="form-group">
								<label for="Hw_Name"><fmt:message key="teacherManageHW_label_hwName"/></label>
								<input id="Hw_Name" type="text" class="form-control" name="Hw_Name" required="required" placeholder="ex. OOP-HW1"/>
							</div>				
							
							<!-- ------------------------checkbox display------------------------------- -->
							<div class="form-group">
								<label for="checkbox">
									<input type="checkbox" id="checkbox" onclick='handleClick(this, "example")'><fmt:message key="teacherManageHW_input_ifHasExample"/>
								</label>
							</div>
							<div style="display:none" id="example">
								<div class = "form-group">
									<a href="MvnQuickStart.zip" class="btn btn-default" id="download"><fmt:message key="teacherManageHW_a_downloadMaven"/></a>
								</div>
								<div class = "form-group">
									<label for="file"><fmt:message key="teacherManageHW_label_uploadZip"/></label>
									<input type="file" accept=".zip" name="file" size="50" width="48"/>
								</div>
							</div>
							<!-- ------------------------------------------------------- -->
					
							
							<div class="form-group">
								<label for="Hw_README"><fmt:message key="teacherManageHW_label_hwReadme"/></label>
								<textarea rows="4" cols="50" class="form-control" name="Hw_README" id="Hw_README"></textarea>
							</div>
							
							<div class="form-group">
								<button type="submit" class="btn btn-default"><fmt:message key="teacherManageHW_button_send"/></button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		
	</div>
	
</body>
</html>