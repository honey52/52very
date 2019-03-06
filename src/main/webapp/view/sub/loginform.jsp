<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<link rel="shortcut icon" type="image⁄x-icon"
	href="${pageContext.request.contextPath}/resources/images/icon.png">
<title>썬딜리버리</title>

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/css/login.css?v=<%=System.currentTimeMillis() %>"
	rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/script/member.js?v=<%=System.currentTimeMillis() %>"></script>

<script type="text/javascript">
var user_id = "<%=(String)session.getAttribute("user_id")%>"
if (user_id != "null"){
	if(user_id == "admin"){
		alert("관리자로 로그인 되었습니다.");
	} else{
		alert(user_id + "님 환영합니다.");	
	}
	opener.location = "/honey52/main/test/main.go";
	self.close();
}
</script>
	
</head>

<body>
<div class="login-page">
  <div class="form">
<!--     <form class="register-form">
      <input type="text" placeholder="name"/>
      <input type="password" placeholder="password"/>
      <input type="text" placeholder="email address"/>
      <button>create</button>
      <p class="message">Already registered? <a href="#">Sign In</a></p>
    </form> -->
    <form class="login-form" action="/honey52/member/test5.go" method="post">
      <input type="text" placeholder="userID" name="mb_id"/>
      <input type="password" placeholder="password" name="mb_pwd"/>
      <button>login</button>
      <p class="message">Not registered? <a style="cursor:pointer" onclick="goJoin();">Create an account</a></p>
    </form>
<!--     <script type="text/javascript">
$('.message a').click(function(){
	   $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
	});
</script> -->
  </div>
</div>
</body>
</html>