<%@page import="food22.USERVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    // 세션 체크 (불러오기)
  // String email = (String)session.getAttribute("email");
    USERVO vo =(USERVO)session.getAttribute("user"); 
//    System.out.println(email);
    
  //  if(email !=null){
    //	System.out.println("여기 있어요");
    	
  //  }else{
    //	System.out.println("여기 없어요");
   // }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="index.jsp">맛집</a>

<ul class="navbar-nav">

<li class="nav-item">
  <% if(vo !=null && vo.getGrade() >9){%>
      <a class="nav-link" href="store.jsp">맛집 추가</a>
      <%} %>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="p2.jsp">전체 맛집</a>
    </li>
    <li class="nav-item">
    <% if(vo!=null){%>
 <a class="nav-link" href="fa.jsp">맛집 추천</a>      
      <%} else{ %>
      <a class="nav-link" href="Longin.jsp">맛집 추천</a>
      <%} %>
      
    </li>
     <li class="nav-item">
     <% if(vo==null){%>
      <a class="nav-link" href="Longin.jsp">로그인</a>
      <%} else{ %>
      <a class="nav-link" href="logout.jsp">로그아웃</a>
      
      <% }%>
    </li>
  </ul>
  <form class="form-inline ml-auto" action="result.jsp">
    <input class="form-control mr-sm-2" type="text" name="search" placeholder="맛집 찾기">
    <button class="btn btn-success" type="submit">Search</button>
  </form>
</nav>
</body>
</html>