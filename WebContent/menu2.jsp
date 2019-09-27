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
// System.out.println(ob);
//위 데이터를 데이터 베이스에 넣기
Connection conn = null;			
Boolean connect = false;
MENUVO vo = new MENUVO();
	
try {	
	Context init = new InitialContext();
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/kndb");
	conn = ds.getConnection();
	String sql = "SELECT * FROM menu WHERE name = ?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, m_name);
	ResultSet rs = pstmt.executeQuery();
	
	if (rs.next()) {
		vo.setId(rs.getInt("id"));
		vo.setName(rs.getString("name"));
		vo.setPrice(rs.getString("price"));
		vo.setImg(rs.getString("img"));
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
		      menu: $('#m_menuname').text(),
		      star: score
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
	
});

function modalClose() {
// 	location.reload();
	history.back();
// 	$('#myModal').hide();
}

function show_modal() {
	$('#myModal').show();
}
function close_modal() {
	$('#myModal').hide();
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
        <th> </th>
      </tr>
    </thead>
    <tbody>
      <tr class="table-dark text-dark">
        <td id="m_menuname"><%=vo.getName() %></td>
        <td><%=vo.getPrice() %></td>
        <td>
        	<div class="starRev">
			  <span class="starR on">1</span>
			  <span class="starR on">2</span>
			  <span class="starR on">3</span>
			  <span class="starR on">4</span>
			  <span class="starR on">5</span>
			  <button type="button" class="btn btn-danger" id="star">확인</button>
			</div> 
			</td>
			<td>
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                                 리뷰 작성
            </button>
        </td>
      </tr>      
    </tbody>
  </table>
  <% if (vo.getImg() == null) { %>
  	<p class="text-center"> 이미지가 없습니다. </p>
  <% } else { %>
  <img src="<%=vo.getImg() %>" width="380" height="300" style="float: left" class="rounded mx-auto d-block">		
<%} %>		
<p class="mx-auto">리뷰 리스트</p>	
</div>
<div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">리뷰 작성</h4>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
		<div class="form-group">
		<label for= "comment"></label>
		<textarea class= "form-control" rows="2" id="comment" name= "text"></textarea>
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
</body>
</html>