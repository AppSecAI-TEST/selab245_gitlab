<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="utf-8"%>
<%@ page import="conn.conn,conn.httpConnect,teacher.teacherGetUserHw,jenkins.jenkinsApi"%>
<%@ page import="java.util.List" import="java.util.ArrayList" import="java.util.*"
	import="org.gitlab.api.GitlabAPI" import="org.gitlab.api.models.*"
	import="com.offbytwo.jenkins.model.JobWithDetails"
	import="com.offbytwo.jenkins.JenkinsServer"
	import="com.offbytwo.jenkins.client.JenkinsHttpClient"
	%>
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
	
	<title>ProgEdu</title>
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
                <a class="navbar-brand">ProgEdu</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="teacherHW.jsp">儀表板</a></li>
                    <li><a href="teacherGroup.jsp">專題</a></li>
                    <li class="dropdown">
                    	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">設定 <span class="caret"></span></a>
                    	<ul class="dropdown-menu">
	                    	<li><a href="teacherManageStudent.jsp">學生管理</a></li>
	                    	<li><a href="teacherManageHW.jsp">作業管理</a></li>
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
	
	<%
		conn conn = new conn();
		httpConnect httpConn = new httpConnect();
		teacherGetUserHw getUserHw = new teacherGetUserHw();
		String gitlabURL = "http://140.134.26.71:20080";
		List<GitlabUser> users = conn.getUsers();
		List<GitlabProject> projects = new ArrayList<GitlabProject>();	
		
		GitlabUser root = conn.getRoot();
		
		GitlabSession rootSession = conn.getRootSession();
		String private_token = conn.getPrivate_token(rootSession);
		
		Collections.reverse(users);
		
		jenkinsApi jenkins = new jenkinsApi();
	%>
	
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>座號</th>
					<th>姓名</th>
					<%
						List<GitlabProject> rootProjects = conn.getProject(root);
						Collections.reverse(rootProjects);
						for(GitlabProject project : rootProjects){
							if(project.getName().substring(0,3).equals("OOP")){
								%>
									<th><%=project.getName() %></th>
								<%
							}
						}
					%>
				</tr>
			</thead>
			<tbody>
				<%
					for(GitlabUser user : users){
						String userName = user.getUsername();
			    		String personal_url = "http://140.134.26.71:20080/u/" + userName;
						projects = conn.getProject(user);
						Collections.reverse(projects);
						%>
							<tr>
								<td><%=user.getId() %></td>
								<td><strong><a href="#" onclick="window.open('<%=personal_url %>')"><%=user.getName() %></a></strong></td>
								<%
									for(GitlabProject project : projects){
										String project_WebURL = project.getWebUrl();
										project_WebURL = project_WebURL.replace("http://0912fe2b3e43", "http://140.134.26.71:20080");
										project_WebURL += "/commits/master"; 
										
										//---Jenkins---
										String url = "http://140.134.26.71:38080/api/json";
										ArrayList<HashMap<String,String>> jobJson = jenkins.getJobJson("GJen","zxcv1234" , url, project.getName());
										String color = jenkins.getJobColor(jobJson, userName, project.getName());
										String colorPic = null;
										if(color!=null){
											colorPic = jenkins.getColorPic(color);
										}else{
											colorPic = "jenkins_pic/jenkins_gray.PNG";
										}
										//-------------
										
										if(project.getName().substring(0,3).equals("OOP")){
											String project_event_url = conn.getProjectEvent(project.getId(), private_token);
											int total_commit_count = getUserHw.httpGetProjectEvent(project_event_url);
											%>
												<td><a href="#" onclick="window.open('<%=project_WebURL%>')"><%=total_commit_count %></a>
												<img src="<%=colorPic %>" width="36" height="31"></td>
											<%
										}
									}
								%>
							</tr>
						<%
					}
				
				%>
			</tbody>
		</table>
	</div>
	
</body>
</html>