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
            											
	<form action="join_proc.jsp" method="post" >										
	<div class="form-group">										
	<label for="email" class="control-label">이메일</label>										
	<input type="text" id="email" name="email" class="form-control"/>										
											
	<label for="password" class="control-label">비밀번호</label>										
	<input type="password" id="password" name="password" class="form-control"/>										
											
						<label for="name" class="control-label">이름</label>					
	<input type="text" id="name" name="name" class="form-control"/>										
											
	<label for="phone" class="control-label">전화번호</label>										
	<input type="text" id="phone" name="phone" class="form-control"/>										
	</div>										
											
	<div class="form-group">										
			<div class="custom-control custom-radio custom-control-inline">								
						<input type="radio" class="custom-control-input" id="customRadio1" name="radio" checked="checked">					
						<label class="custom-control-label" for="customRadio1">개인</label>					
						</div>					
							<div class="custom-control custom-radio custom-control-inline">				
							<input type="radio" class="custom-control-input" id="customRadio2" name="radio">				
							<label class="custom-control-label" for="customRadio2">사업자</label>				
							</div>				
						</div>					
										
	<div class="form-group">										
	<input type="submit" value="회원가입" class="btn btn-primary btn-block">										
	</div>										
	</form>										
            