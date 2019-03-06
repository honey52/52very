<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

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

<title>IdCheck</title>

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/css/shop-homepage.css?v=<%=System.currentTimeMillis() %>"
	rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/script/member.js?v=<%=System.currentTimeMillis() %>"></script>
</head>

<body>
	<form action="test4.go" method="get" name="frm">
		<table class="table table-borderless">
			<tr>
				<th colspan="2">아이디 입력</th>
				<td colspan="1"><input type="text" name="mb_id"
					value="${mb_id}"></td>
				<td><input type="submit" value="중복확인"></td>
			</tr>
			<c:if test="${result == 1}">
				<script type="text/javascript">
					opener.document.frm.mb_id.value = "";
				</script>
				<tr>
					<th colspan="4">${mb_id}은(는) 사용중인 아이디입니다.</th>
				</tr>
			</c:if>
			<c:if test="${result == -1}">
				<tr>
					<th colspan="3">${mb_id}은(는) 사용 가능한 아이디입니다.</th>
					<td><input type="button" value="사용" class="cancel"
						onclick="idok()"></td>
				</tr>
			</c:if>
		</table>
	</form>

</body>

</html>
