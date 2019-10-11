<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <title>맛집</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="top.jsp" flush="false"/>


<div class="container">
  <h2>입력 하기</h2>
  <form action="sumbit2.jsp">
    <div class="form-group">
      <label for="name">가게이름</label>
      <input type="text" class="form-control" id="name" placeholder="가게이름 입력" name="name">
    </div>
    
    <div class="form-group">
      <label for="loc">위치</label>
      <input type="loc" class="form-control" id="loc" placeholder="위치 입력" name="loc">
    </div>
   
    <div class="form-group">
      <label for="tel">전화번호</label>
      <input type="number" class="form-control" id="tel" placeholder="전화번호 입력" name="tel">
    </div>
    <div class="form-group">
      <label for="time">영업 시간</label>
      <input type="text" class="form-control" id="time" placeholder="영업시간 입력" name="time">
    </div>
   
    <button type="submit" class="btn btn-primary">추가하기</button>
  </form>
</div>

</body>
</html>