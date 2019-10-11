<%@page import="naver.NSearch"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%			
	
request.setCharacterEncoding("UTF-8");
String search = request.getParameter("search");

//search= "경남대학교 맛집"; //임시로 무조건 이렇게 뜨게 

System.out.println(search + "검색 했네 ");

//내가 만든 네이버 검색 API를 불러보자  

 String result= NSearch.getDate(search);
 out.println(result);


%>


