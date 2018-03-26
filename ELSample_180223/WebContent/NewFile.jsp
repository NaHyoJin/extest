<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>NewFile.jsp</title>
</head>
<body>

<%--  이건 일반적으로 스크립트 릿 사용해서 하는거지.
	<%
		String name = request.getParameter("name");
	%>
	
	name : <%=name %>
 --%>	
	
	EL Tag name : ${param.name } <!-- "name" -->
	
</body>
</html>