<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밥 메이트</title>
<link rel="stylesheet" href="https://maxdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>		
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>		

        <style>
            .page{
                position:absolute;
                top:40%;
                left:50%;
                transform:translate(-50%, -50%);
            }
        </style>
    </head>
    <body>
    <jsp:include page="top.jsp" flush="false"/>
        <div class="page">
            <div class="title">
                <h1>회원가입</h1>
            </div>
            <div class="content form-horizontal align-items-center">
               
                <form action="Login_proc.jsp" method="post" >
                    <div class="form-group">
                        <label for="username" class="control-label">아이디</label><br>
                        <input type="text" id="username" name="username" class="form-control"/><br>

                        <label for="password" class="control-label">비밀번호</label><br>
                        <input type="password" id="password" name="password" class="form-control"/><br>
                    </div>
                    <div class="form-group">
                        <input type="submit" value="로그인" class="btn btn-primary btn-block">
                    </div>
                </form>
                </div>
            </div>
        
    </body>
</html>