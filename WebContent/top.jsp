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
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="insert.jsp">태풍 추가</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="print.jsp">태풍 맛집</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="">태풍 추천</a>
    </li>
  </ul>
  <form class="form-inline" action="/action_page.php">
    <input class="form-control mr-sm-2" type="text" placeholder="Search">
    <button class="btn btn-success" type="submit">Search</button>
  </form>
</nav>
</body>
</html>