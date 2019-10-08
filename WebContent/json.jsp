<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	
	var html = "";
  $("button").click(function(){
    $.getJSON("http://localhost:8080/food22/search.jsp", function(result){
    	//위에 한줄 코딩이 콘솔 로그 4개의 결과값을 받아온다.
  //  	console.log(result["lastBuildDate"]);
    //	console.log(result["total"]);
   // 	console.log(result["start"]); //each
   // 	console.log(result.items);    //each
      $.each(result['items'], function(i, field){
    	  html += "<a href='" +field.link +"'>" + field.title + "</a><br>";
    	  
     //  $("div").append(field['title'] + " ");
    	  
      });
      $('div').html(html);  
    });
  });
});
</script>
</head>
<body>

<button>Get JSON data</button>

<div id="title"></div>
<div id="link"></div>


</body>
</html>
