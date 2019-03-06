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

<title>cart</title>

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/css/cart.css?v=<%=System.currentTimeMillis() %>"
	rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/script/member.js?v=<%=System.currentTimeMillis() %>"></script>
</head>
<body>
	<section class="pricing py-5">
		<div class="container">
			<div class="row">
				<!-- Plus Tier -->
				<div class="col-lg-4">
					<div class="card mb-5 mb-lg-0">
						<div class="card-body">
							<h4 class="card-price text-center">
							<img src="${pageContext.request.contextPath}/resources/images/cart.png"> 
							</h4>
							<hr>

							<c:if test="${cart[0] == null}">
							<h5 style="text-align: center;"><strong>장바구니가 비었습니다.</strong></h5>							
							</c:if>
							<c:if test="${cart[0] != null}">
								<ul class="fa-ul">
									<c:forEach var="i" items="${cart}" varStatus="s">
										<li><span class="fa-li"><i class="fas fa-check"></i></span>
											<strong>${i.menu} (<fmt:formatNumber
													value="${i.cost}" pattern="#,###.##원" />)&nbsp;&nbsp;
												${i.count}개&nbsp;&nbsp; <fmt:formatNumber
													value="${i.cost*i.count}" pattern="#,###.##원" /></strong>
													<a href="test9.go?index=${s.index}" style="float: right;" id ="del">x</a>
										</li>
									</c:forEach>
								</ul>
								<hr>
								<c:set var="total" value="0" />
								<c:forEach var="i" items="${cart}">
									<c:set var="total" value="${total + i.cost*i.count}" />
								</c:forEach>
								<h6 style="text-align: right;">
									합계 :
									<fmt:formatNumber value="${total}" pattern="#,###.##원" />
								</h6>
								<a href="#" style="cursor:pointer" onclick="goOrder();"
									class="btn btn-block btn-outline-dark text-uppercase">주문하기</a>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>

</html>
