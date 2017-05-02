<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="dashboard.jsp">ProgEdu</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="studentDashboard.jsp"><fmt:message key="top_navbar_dashboard"/></a></li>
               <!-- <li><a href="teacherGroup.jsp"><fmt:message key="top_navbar_groupProject"/></a></li>
                <li class="dropdown">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                		<fmt:message key="top_navbar_manage"/> <span class="caret"></span></a>
                	<ul class="dropdown-menu">
                 	<li><a href="studentManagement.jsp"><fmt:message key="top_navbar_manageStudent"/></a></li>
                 	<li><a href="assignmentManagement.jsp"><fmt:message key="top_navbar_manageHW"/></a></li>
                 	<li><a href="groupManagement.jsp"><fmt:message key="top_navbar_manageGroup"/></a></li>
                	</ul>
                </li> --> 
            </ul>
            
            <ul class="nav navbar-nav navbar-right">
            	<li class="dropdown">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                		<fmt:message key="top_navbar_language"/> <span class="caret"></span></a>
                	<ul class="dropdown-menu" >
                 	<li id="English" value="en"><a href="ChooseLanguage?language=en"><fmt:message key="top_navbar_lanEnglish"/></a></li>
                 	<li id="Chinese" value="zh"><a href="ChooseLanguage?language=zh"><fmt:message key="top_navbar_lanChinese"/></a></li>
                	</ul>
                </li>
    			<li><a href="memberLogOut.jsp" id="loginLink"><fmt:message key="top_navbar_signOut"/></a></li>
			</ul>
        </div>
    </div>
</div>
   
<br><br><br>