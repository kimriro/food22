<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="index.jsp">태풍</a>
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="store.jsp">태풍 추가</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="p2.jsp">태풍 맛집</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="fa.jsp">태풍 추천</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" href="star.jsp">별점 평가</a>
    </li>
  </ul>
  <form class="form-inline ml-auto" action="search.jsp">
    <input class="form-control mr-sm-2" type="text"  name="search" placeholder="맛집 찾기">
    <button class="btn btn-success" type="submit">Search</button>
  </form>
</nav>
</body>
</html>