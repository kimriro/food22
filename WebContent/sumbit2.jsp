<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");   // 한글 처리
String name = request.getParameter("name");	
String loc = request.getParameter("loc");	
String tel = request.getParameter("tel");	
String time = request.getParameter("time");	
// 위 데이터를 데이터 베이스에 넣기
Connection conn = null;			
Boolean connect = false;
	
try {	
	Context init = new InitialContext();
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/kndb");
	conn = ds.getConnection();
	
	String sql = "INSERT INTO store (name, loc, tel, time) VALUES (?, ?, ?, ?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, loc);
	pstmt.setString(3, tel);
	pstmt.setString(4, time);
	pstmt.executeUpdate();
	
	connect = true;
	conn.close();
} catch (Exception e) {	
	connect = false;
	e.printStackTrace();
}	
	
if (connect == true) {	
	System.out.println("연결되었습니다.");
} else {	
	System.out.println("연결실패.");
}	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
location.href="p2.jsp";
</script>
</body>
</html>