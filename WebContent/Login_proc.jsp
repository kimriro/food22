<%@page import="food22.USERVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); //
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
// 	out.println(menu + " 에 " + "별점 " + star + " 점을 줬다.");
	
	// 점수를 DB에 저장
	Connection conn = null;			
	Boolean connect = false;
		
	try {	
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/kndb");
		conn = ds.getConnection();
		
		String sql = "SELECT * FROM users WHERE email= ? AND pw= ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
		pstmt.setString(2, password);
		ResultSet rs = pstmt.executeQuery();
		
		USERVO vo = new USERVO();
		
		out.println("<script>");
		if(rs.next()){
			
			String dbemail= rs.getString("email");
			String pw= rs.getString("pw");
			String name= rs.getString("name");
			String phone= rs.getString("phone");
			int grade= rs.getInt("grade");
			int id = rs.getInt("id");
			vo.setEmail(dbemail);
			vo.setPw(pw);
			vo.setName(name);
			vo.setPhone(phone);
			vo.setGrade(grade);
			vo.setId(id);
			
			//session.setAttribute("email", email);
			session.setAttribute("user", vo);
			out.println("alert('" +name+ " 님 반가워');");	
			out.println("location.href='index.jsp'");
		}else{
			out.println("alert('제대로 입력 했는지 확인 하세요!!');");
		}
		out.println("</script>");
		connect = true;
		conn.close();
	} catch (Exception e) {	
		connect = false;
		e.printStackTrace();
	}	
		
	if (connect == true) {	
		System.out.println("연결되었습니다.");
	//	out.println(1);
	} else {	
		System.out.println("연결실패.");
	//	out.println(0);
	}	
    
%>
