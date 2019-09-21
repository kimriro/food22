<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	var score = 1;
	$('.starRev span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  
		  console.log($(this).addClass('on').text());
		  score = $(this).addClass('on').text();
		  
		  return false;
		});
	
	 $("#submit").click(function(){
		    $.post("star_proc.jsp",
		    {
		      menu: "치돈",
		      star: score
		    },
		    function(data,status){
		      alert("Data: " + data + "\nStatus: " + status);
		    });
	  });
	
});
function show_modal() {
	$('#myModal').show();
}
function close_modal() {
	$('#myModal').hide();
}
</script>

</head>
<body>
<h1>평가하기</h1>

  <!-- Button to Open the Modal -->
  <button type="button" class="btn btn-primary" onclick="show_modal()">
    Open modal
  </button>

  <!-- The Modal 시작 -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">평가하기</h4>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
			<div class="starRev">
			  <span class="starR on">1</span>
			  <span class="starR">2</span>
			  <span class="starR">3</span>
			  <span class="starR">4</span>
			  <span class="starR">5</span>
			</div>     
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" id="submit">평가하기</button>
          <button type="button" class="btn btn-danger" onclick="close_modal()">취소</button>
        </div>
        
      </div>
    </div>
  </div>
<!-- 모달 끝 -->


</body>
</html>		