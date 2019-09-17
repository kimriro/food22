<%@page import="food22.MENUVO"%>
<%@page import="food22.STOREVO"%>
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
    String s_id = request.getParameter("s_id");
	String ob = request.getParameter("orderby");//오름차순						
	System.out.println(ob);						
							
	//위 데이터를 데이터 베이스에 넣기						
	Connection conn = null;						
	Boolean connect = false;						
							
	ArrayList<MENUVO> list = new ArrayList<>();						
							
	try {						
		Context init = new InitialContext();					
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/kndb");					
		conn = ds.getConnection();					
		String sql = null;					
		boolean isDesc = false;					
							
		if (ob == null) {					
			//오름차순				
							
			sql = "SELECT * FROM menu WHERE s_id= ? ORDER BY price desc";				
							
		} else {					
			//내림차순				
			sql = "SELECT * FROM menu WHERE s_id= ? ORDER BY price aes";				
		}					
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, s_id);
		ResultSet rs = pstmt.executeQuery();					
							
		while (rs.next()) {					
			MENUVO vo = new MENUVO();				
			vo.setId(rs.getInt("id"));							
			vo.setName(rs.getString("name"));								
			vo.setPrice(rs.getString("price"));				
							
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
<title>맛집 리스트 </title>							
<meta charset="utf-8">							
<meta name="viewport" content="width=device-width, initial-scale=1">							
<link rel="stylesheet"							
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">						
<script							
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>						
<script							
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>						
<script							
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>						
							
							
<style>							
	.starR {						
	background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;						
	background-size: auto 100%;						
	width: 30px;						
	height: 30px;						
	display: inline-block;						
	text-indent: -9999px;						
	cursor: pointer;						
	}						
	.starR.on{background-position:0 0;}						
</style>							
<script>

$(document).ready(function(){
	var score = 5;
	$('.starRev span').click(function(){		
		console.log('asdf');	
		$(this).parent().children('span').removeClass('on');	
		$(this).addClass('on').prevAll('span').addClass('on');
		console.log($(this).addClass('on').text());
		score = $(this).addClass('on').text();
		return false;	
		});	
	  $("button").click(function(){
		    $.post("star_proc.jsp",
		    {
		      menu: $('#m_menuname').text(),
		      star: score
		    },
		    function(data,status){
		      alert("Data: " + data + "\nStatus: " + status);
		     
		      modalClose();
		    });
		  });
});			
							
	function getMenuName(name) {						
	    $('#m_menuname').text(name);			
		$('#myModal').show();					
							
	}						
	function modalClose(){
		location.reload();
		$('#myModal').hide();					
	}						
</script>							
							
</head>							
<body>							
	<jsp:include page="top.jsp" flush="false" />						
							
	<div class="container">			
<h2>맛집 리스트</h2>			
<table class="table">			
<thead>			
<tr>			
<% if(ob==null){%>			
<th>메뉴이름<a href="menu.jsp?s_id=<%=s_id %>&orderby=1">↑</a></th>
<% } else{%>
	<th>메뉴이름 <a href="menu.jsps_id=<%=s_id %>">↓</a></th>
	<% }%>		
<th>가격</th>			
		
</tr>			
</thead>			
<tbody>			
<%for (MENUVO vo : list) { %>			
<tr class="table-dark text-dark">			
<td><%=vo.getName() %></td>					
<td><%=vo.getPrice() %></td>			
</tr>			
	<% } %>		
</tbody>			
</table>			
	</div>						
							
	<!-- 모달 시작 -->						
	<!-- The Modal -->						
	<div class="modal" id="myModal">						
		<div class="modal-dialog">					
			<div class="modal-content">				
							
				<!-- Modal Header -->			
				<div class="modal-header">			
					<h4 class="modal-title">별점 평가하기</h4>		
							
				</div>			
							
				<!-- Modal body -->			
				<div class="modal-body">
				<p id="m_menuname"></p>			
					<div class="starRev">		
						<span class="starR on">1</span> <span class="starR on">2</span> <span	
							class="starR on">3</span> <span class="starR on">4</span> <span
							class="starR on">5</span>
							
					</div>		
				</div>			
							
				<!-- Modal footer -->			
				<div class="modal-footer">			
					<button type="button" class="btn btn-primary" id="submit">평가하기</button>		
					<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="modalClose()">취소</button>		
				</div>			
							
			</div>				
		</div>					
	</div>						
<!-- 모달 끝-->							
							
</body>							
</html>	