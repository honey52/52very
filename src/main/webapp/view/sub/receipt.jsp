<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/css/shop-homepage.css?v=<%=System.currentTimeMillis() %>" rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/script/member.js?v=<%=System.currentTimeMillis()%>"></script>
	
<link rel="shortcut icon" type="image⁄x-icon"
	href="${pageContext.request.contextPath}/resources/images/icon.png">
<title>썬딜리버리</title>
</head>

<body>
<!-- Page Content -->
<div class="container" align="center">
	<c:set var="totalEA" value="0"></c:set>
	<c:forEach var="c" items="${rctd}">
		<c:set var="totalEA" value="${totalEA + c.OD_COUNT}" />
	</c:forEach>
	<h1>주 문 서</h1><br>
	<table class="table table-sm" style="width: 80%;">
		<tbody>
			<tr>
				<th>주문일자</th>
				<td colspan="2"></td>
				<td align="right">${rct.OT_DATE}</td>
				<td align="right">${rct.OT_HOUR}</td>
			</tr>
			<tr style="border-bottom: hidden;">
				<th rowspan="3">주소</th>
				<td colspan="4" style="border-bottom: hidden;">${rct.OT_RAP1}</td>
			</tr>
			<tr>
				<td colspan="4" style="border-bottom: hidden;">${rct.OT_RAP2}</td>
			</tr>
			<tr style="border-bottom: hidden;">
				<td colspan="4">${rct.OT_ADT}</td>
			</tr>
			<tr style="border-bottom: hidden;">
				<th>주문자</th>
				<td colspan="4">${rct.MB_NAME}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td colspan="4">${rct.OT_TEL}</td>
			</tr>
			<tr style="border-bottom: hidden;">
				<th>품명</th>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr align="right">
				<td></td>
				<td></td>
				<th>수량</th>
				<th>단가</th>
				<th>금액</th>
			</tr>
			<c:forEach var="li" items="${rctd}">
				<tr style="border-top: hidden;">
					<td colspan="5">${li.MN_TITLE}</td>
				</tr>
				<tr style="border-top: hidden;" align="right">
					<td></td>
					<td></td>
					<td>${li.OD_COUNT}</td>
					<td><fmt:formatNumber value="${li.OD_PRICE}" pattern="#,###"/></td>
					<td><fmt:formatNumber value="${li.OD_COUNT*li.OD_PRICE}" pattern="#,###"/></td>
				</tr>
			</c:forEach>
			<tr style="border-top: hidden;">
				<td colspan="5" style="font-size: 12px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* ${rct.OT_REQUIRE}</td>
			</tr>
			<tr style="border-bottom: hidden;">
				<td>과세품목</td>
				<td></td>
				<td></td>
				<td></td>
				<td align="right"><fmt:formatNumber value="${rct.OT_PRICE*0.9}" pattern="#,###"/></td>
			</tr>
			<tr style="border-bottom: hidden;">
				<td>면세품목</td>
				<td></td>
				<td></td>
				<td></td>
				<td align="right">0</td>
			</tr>
			<tr style="border-bottom: hidden;">
				<td>부&nbsp;&nbsp;가&nbsp;&nbsp;세</td>
				<td></td>
				<td></td>
				<td></td>
				<td align="right"><fmt:formatNumber value="${rct.OT_PRICE*0.1}" pattern="#,###"/></td>
			</tr>
			<tr>
				<td>합&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계</td>
				<td></td>
				<td align="right">${totalEA}</td>
				<td></td>
				<td align="right"><fmt:formatNumber value="${rct.OT_PRICE}" pattern="#,###"/></td>
			</tr>
			<tr style="border-top: hidden;">
				<td colspan="5" style="font-size: 12px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* 결제방법 : ${rct.PM_TITLE}</td>
			</tr>
		</tbody>
	</table>
</div>
<!-- /.container -->
</body>
</html>
