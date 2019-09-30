  
<%@page import="food22.USERVO"%>
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
request.setCharacterEncoding("utf-8");  // 한글처리
String m_name = request.getParameter("m_name");  // 메뉴이름
// 리뷰를 쓰기 위해 사용자 정보를 받아와야함
USERVO uvo = (USERVO)session.getAttribute("user");

//리뷰를 담을 그릇을 생성(리스트)
ArrayList<String> reviewList = new ArrayList<>();



// System.out.println(ob);
//위 데이터를 데이터 베이스에 넣기
Connection conn = null;			
Boolean connect = false;
MENUVO mvo = new MENUVO();


	
try {	
	Context init = new InitialContext();
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/kndb");
	conn = ds.getConnection();
	String sql = "SELECT * FROM menu WHERE name = ?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, m_name);
	ResultSet rs = pstmt.executeQuery();
	
	if (rs.next()) {
		mvo.setId(rs.getInt("id"));
		mvo.setName(rs.getString("name"));
		mvo.setPrice(rs.getString("price"));
		mvo.setImg(rs.getString("img"));
	}

	
	sql = "SELECT * FROM review WHERE m_id = ?";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, mvo.getId());
	rs = pstmt.executeQuery();
	
	while (rs.next()) {
		reviewList.add(rs.getString("review"));
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
// 	$('#star').hide();    // 별점 확인 버튼 숨기기
	var score = 5;	 // 별점 초기값
	// 별 클릭 할 때 마다 별점이 바뀜
	$('.starRev span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  
		  console.log($(this).addClass('on').text());
		  score = $(this).addClass('on').text();
		  
		  return false;
	});
 	
	// 별점 주기 확인 버튼
	$("#star").click(function(){
		    $.post("star_proc.jsp",
		    {
		      
		      star: score,
		      m_id: $('#m_id').val(),
		      u_id: $('#u_id').val() 
		    },
		    function(data,status){
		      //alert("Data: " + data + "\nStatus: " + status);
// 		      alert("넘어 오는 값: " + data);
		      if (data == 1) {
		    	  alert("감사합니다.");
		      } else {
		    	  alert("등록 실패. 관리자에게 문의 하세요.")
		      }
		      
		      modalClose();	
		    });
	 });
	
	 $("#submit").click(function(){
		    $.post("review_proc.jsp",
		    {
		      review: $('#comment').val(),
		      m_id: $('#m_id').val(),
		      u_id: $('#u_id').val() 
		    },
		    function(data,status){
// 		      alert("Data: " + data + "\nStatus: " + status);
				if (data == 1) {
					alert("감사합니다.");
		    	} else {
					alert("오류 났어요. 관리자에게 문의!")
				}
		      
		      	modalClose();	
		    });
	  });
	
});
function modalClose() {
 	location.reload();
// 	history.back();
// 	$('#myModal').hide();
}
$(function() {
    $('#comment').keyup(function (e){
        var content = $(this).val();
        $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
        $('#counter').html(content.length + '/50');
    });
    $('#comment').keyup();
});
function send_login() {
	alert("리뷰를 작성을 할려면 로그인 하세요!");
	location.href="login.jsp";
	
}
</script>

</head>
<body>
<jsp:include page="top.jsp" flush="false"/>
<div class="container">
  <h2><%=m_name %></h2>
  <table class="table">
    <thead>
      <tr>
		<th>메뉴이름</th>
        <th>가격</th> 
        <th>평가하기</th>
        <th></th>  
      </tr>
    </thead>
    <tbody>
      <tr class="table-dark text-dark">
        <td id="m_menuname"><%=mvo.getName() %></td>
        <td><%=mvo.getPrice() %></td>
        <td>
        	<div class="starRev">
			  <span class="starR on">1</span>
			  <span class="starR on">2</span>
			  <span class="starR on">3</span>
			  <span class="starR on">4</span>
			  <span class="starR on">5</span>
			  <% if(uvo == null){%>
			  <button type="button" class="btn btn-danger" onclick="send_login()">확인</button>
			  <%}else{ %>
			  <button type="button" class="btn btn-danger" id="star">확인</button>
		 <%}%>
			</div> 
        </td>
        <td>
        	<% if (uvo == null) { %>
        		<button type="button" class="btn btn-primary" onclick="send_login()">
		  			리뷰쓰기
				</button> 
        	 <% } else { %>
		        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
		  			리뷰쓰기
				</button>
			<% } %>
        </td>
      </tr>      
    </tbody>
  </table>
  	<% if (mvo.getImg() == null) { %>
  		<p class="text-center"> 이미지가 없습니다. </p>
  	<% } else { %>
		<img src="<%=mvo.getImg() %>" width="320" height="240" style="float: left" class="rounded mx-auto d-block">		
	<%} %>		
	<h4 class="mx-auto">리뷰 리스트</h4>
	
	<%for (String rStr : reviewList){%>
	<p class="mx-auto"><%=rStr %></p>
	<%} %>		

 <!-- The Modal 시작 -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">리뷰쓰기</h4>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
			<div class="form-group">
	      		<label for="comment"></label>
	      		<textarea class="form-control" rows="2"  maxlength="50" id="comment" name="text"></textarea>
	      		<input type="hidden" id="m_id" value="<%=mvo.getId() %>">
	      		<% if (uvo != null) { %>
	      			<input type="hidden" id="u_id" value="<%=uvo.getId() %>">
	      		<% } %>
	      		<span id="counter" class="text-right">###</span>
	    	</div>	   
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" id="submit">등록하기</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
        </div>
        
      </div>
    </div>
  </div>
<!-- 모달 끝 -->	

</div>

																					
</body>
</html>
