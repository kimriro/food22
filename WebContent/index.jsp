<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<head>
  <title>태풍</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
<a class="navbar-brand" href="index.jsp">태풍</a>
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="store.jsp">태풍 추가</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="print.jsp">태풍 맛집</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="fa.jsp">태풍 추천</a>
    </li>
      <li class="nav-item">
      <a class="nav-link" href="Longin.jsp">로그인 </a>
    </li>
  </ul>
  <form class="form-inline ml-auto" action="search.jsp">
    <input class="form-control mr-sm-2" type="text" name="search" placeholder="Search">
    <button class="btn btn-success" type="submit2">Search</button>
  </form>
</nav>
<br>

<div class="container-fluid">
  <p>태풍을 추천 드려요.</p>
  <img src="http://www.yongwoodong.co.kr/bbs/data/menu/1205779287.jpg">
  </div>
</body>
</html>
