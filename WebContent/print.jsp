<%@page import="java.util.ArrayList"%>			
<%@page import="food22.FOODVO"%>			
<%@page import="java.sql.ResultSet"%>			
<%@page import="java.sql.PreparedStatement"%>			
<%@page import="javax.sql.DataSource"%>			
<%@page import="javax.naming.InitialContext"%>			
<%@page import="javax.naming.Context"%>			
<%@page import="java.sql.Connection"%>			
<%@ page language="java" contentType="text/html; charset=UTF-8"			
pageEncoding="UTF-8"%>			
			
<%			
			String ob = request.getParameter("orderby");
//위 데이터를 데이터 베이스에 넣기			
Connection conn = null;			
Boolean connect = false;			
			
ArrayList<FOODVO> list = new ArrayList<>();			
			
try {			
	Context init = new InitialContext();		
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/kndb");		
	conn = ds.getConnection();		
			
	String sql = null;
	
	
	if(ob == null){
		sql = "SELECT * FROM food ORDER BY price DESC";
 
	}else{
		sql = "SELECT * FROM food ORDER BY price asc";
	}

	PreparedStatement pstmt = conn.prepareStatement(sql);		
	ResultSet rs = pstmt.executeQuery();		
			
	while (rs.next()) {		
		FOODVO vo = new FOODVO();	
		vo.setName(rs.getString("name"));	
		vo.setMenu(rs.getString("menu"));	
		vo.setHome(rs.getString("home"));	
		vo.setPrice(rs.getString("price"));	
		vo.setLoc(rs.getString("loc"));	
		vo.setStar(rs.getString("star"));	
		vo.setTel(rs.getString("tel"));	
		vo.setTime(rs.getString("time"));	
		list.add(vo);	
	}		
			
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
<title>맛집 리스트</title>			
<meta charset="utf-8">			
<meta name="viewport" content="width=device-width, initial-scale=1">			
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">			
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>			
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>			
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>			
<script>			
$(document).ready(function(){	
	$('#menuname').click(function(){		
    
		alert($(this).text());
	});
});			

function getMenuName(name){
	alert(name);
}
</script>
</head>			
<body>			
		<jsp:include page="top.jsp" flush="false"/>

	
<div class="container">			
<h2>맛집 리스트</h2>			
<table class="table">			
<thead>			
<tr>			
<th>가게이름</th>			
<th>메뉴</th>			
<th>원산지</th>
<% if(ob==null){%>			
<th>가격 <a href="print.jsp?orderby=1">↑</a></th>
<% } else{%>
	<th>가격 <a href="print.jsp">↓</a></th>
	<% }%>		
<th>위치</th>			
<th>별점</th>			
<th>전화번호</th>			
<th>영업시간</th>			
</tr>			
</thead>			
<tbody>			
<%for (FOODVO vo : list) { %>			
<tr class="table-dark text-dark">			
<td><%=vo.getName() %></td>			
<td><a href="#" onclick="getMenuName('<%=vo.getMenu()%>')"><%=vo.getMenu() %> </a></td>			
<td><%=vo.getHome() %> </td>			
<td><%=vo.getPrice() %></td>			
<td><%=vo.getLoc() %></td>			
<td><%=vo.getStar() %></td>			
<td><%=vo.getTel() %></td>			
<td><%=vo.getTime() %></td>			
</tr>			
	<% } %>		
</tbody>			
</table>			
</div>			
			
</body>			
</html>			