<%@page import="naver.NSearch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8"); // 한글 깨짐 방지
String search = request.getParameter("search");
// 내가 만든 네이버 검색 API를 불러 보자
// String result = NSearch.getDate(search);
// out.println(result);
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
	var html = "";
	$.getJSON("search.jsp?search=<%=search %>", function(result){
	   $.each(result.items, function(i, field){
	      html += "<a href='" + field.link + "' target='_blank'>" + field.title + "</a><br>" ;
	   });
       $('#result').html(html);
	});
});
</script>

</head>
<body>
<jsp:include page="top.jsp" flush="false"/>
<div class="container">
  <h2>검색 결과</h2>
  <div id="result"></div>
</div>


</body>
</html>

