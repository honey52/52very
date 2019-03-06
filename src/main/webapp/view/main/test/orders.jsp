<link
	href="${pageContext.request.contextPath}/resources/css/min.css?v=<%=System.currentTimeMillis() %>"
	rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link
	href="${pageContext.request.contextPath}/resources/css/dataTables.bootstrap4.css?v=<%=System.currentTimeMillis() %>"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin.css?v=<%=System.currentTimeMillis() %>"
	rel="stylesheet">

<div class="container" align="center" style="margin-top: 30px;">
	<!-- DataTables Example -->
	<div class="card mb-3">
		<div class="card-header">주문리스트</div>
		<div class="card-body">
			<div class="table-responsive" id="orders">
			<form action="orders.go" method="post">
				<table class="table table-bordered table-sm" id="dataTable">
					<thead>
						<tr align="center">
							<th>주문번호</th>
							<th>주문날짜</th>
							<th>주문상품</th>
							<th>주문지</th>
							<th>요청사항</th>
							<th>결제가격</th>
							<th>결제방법</th>
							<th>결제상태</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="all" items="${orderlist}" varStatus="s">
						<input type="hidden" name="ot_num${s.index}" value="${all.OT_NUM}">
							<tr>
								<td align="center">${all.OT_NUM}</td>
								<td>${all.OT_DATE}&nbsp;${all.OT_HOUR}</td>
								<td><a style="cursor: pointer"
									onclick="goReceipt(${all.OT_NUM});">${all.OT_MENU}</a></td>
								<td>${all.OT_RAP1}<br>${all.OT_ADT}</td>
								<td>${all.OT_REQUIRE}</td>
								<td align="right"><fmt:formatNumber value="${all.OT_PRICE}"
										pattern="#,###.##원" /></td>
								<td align="center"><select
									class="form-control form-control-sm" name="pm_code${s.index}">
										<c:choose>
											<c:when test="${all.PM_CODE == '1'}">
												<option value="${all.PM_CODE}" selected="selected">${all.PM_TITLE}</option>
												<option value="2">카드결제</option>
												<option value="3">계좌이체</option>
											</c:when>
											<c:when test="${all.PM_CODE == '2'}">
												<option value="1">현금결제</option>
												<option value="${all.PM_CODE}" selected="selected">${all.PM_TITLE}</option>
												<option value="3">계좌이체</option>
											</c:when>
											<c:otherwise>
												<option value="1">현금결제</option>
												<option value="2">카드결제</option>
												<option value="${all.PM_CODE}" selected="selected">${all.PM_TITLE}</option>
											</c:otherwise>
										</c:choose>
								</select></td>
								<td align="center"><select
									class="form-control form-control-sm" name="ps_code${s.index}">
										<c:choose>
											<c:when test="${all.PS_CODE == '1'}">
												<option value="${all.PS_CODE}" selected="selected">${all.PS_TITLE}</option>
												<option value="2">결제완료</option>
											</c:when>
											<c:otherwise>
												<option value="1">결제대기</option>
												<option value="${all.PS_CODE}" selected="selected">${all.PS_TITLE}</option>
											</c:otherwise>
										</c:choose>
								</select></td>
								<td align="center"><select
									class="form-control form-control-sm" name="ost_code${s.index}">
										<c:choose>
											<c:when test="${all.OST_CODE == '1'}">
												<option value="${all.OST_CODE}" selected="selected">${all.OST_TITLE}</option>
												<option value="2">조리중</option>
												<option value="3">배달중</option>
												<option value="4">배달완료</option>
											</c:when>
											<c:when test="${all.OST_CODE == '2'}">
												<option value="1">주문접수</option>
												<option value="${all.OST_CODE}" selected="selected">${all.OST_TITLE}</option>
												<option value="3">배달중</option>
												<option value="4">배달완료</option>
											</c:when>
											<c:when test="${all.OST_CODE == '3'}">
												<option value="1">주문접수</option>
												<option value="2">조리중</option>
												<option value="${all.OST_CODE}" selected="selected">${all.OST_TITLE}</option>
												<option value="4">배달완료</option>
											</c:when>
											<c:otherwise>
												<option value="1">주문접수</option>
												<option value="2">조리중</option>
												<option value="3">배달중</option>
												<option value="${all.OST_CODE}" selected="selected">${all.OST_TITLE}</option>
											</c:otherwise>
										</c:choose>
								</select></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button style="float: right;">적용</button>
				</form>
			</div>
			<fmt:parseNumber value="${page.endn}" var="endn" />
			<fmt:parseNumber value="${page.lstbnum}" var="lstbnum" />
			<ul class="pagination justify-content-center pagination-sm">
				<li class="page-item"><a class="page-link"
					href="orders.go?pg=1&bEa=${page.bEa}">처음</a></li>
				<c:if test="${(page.stn-1) <= 0}">
					<li class="page-item"><a class="page-link"
						href="orders.go?pg=1&bEa=${page.bEa}">◀</a></li>
				</c:if>
				<c:if test="${(page.stn-1) > 0}">
					<li class="page-item"><a class="page-link"
						href="orders.go?pg=${page.stn-1}&bEa=${page.bEa}">◀</a></li>
				</c:if>
				<c:if test="${ endn>=lstbnum }">
					<c:forEach var="i" begin="${page.stn}" end="${lstbnum}">
						<li class="page-item"><a class="page-link"
							href="orders.go?pg=${i}&bEa=${page.bEa}">${i}</a></li>
					</c:forEach>
				</c:if>
				<c:if test="${ endn<lstbnum }">
					<c:forEach var="i" begin="${page.stn}" end="${endn}">
						<li class="page-item"><a class="page-link"
							href="orders.go?pg=${i}&bEa=${page.bEa}">${i}</a></li>
					</c:forEach>
				</c:if>
				<c:if test="${ endn>=lstbnum }">
					<li class="page-item"><a class="page-link"
						href="orders.go?pg=${lstbnum}&bEa=${page.bEa}">▶</a></li>
				</c:if>
				<c:if test="${ endn<lstbnum }">
					<li class="page-item"><a class="page-link"
						href="orders.go?pg=${endn+1}&bEa=${page.bEa}">▶</a></li>
				</c:if>
				<li class="page-item"><a class="page-link"
					href="orders.go?pg=${lstbnum}&bEa=${page.bEa}">맨끝</a></li>
			</ul>
		</div>
		<c:set var="now" value="<%=new java.util.Date()%>" />
		<div class="card-footer small text-muted">
			Updated
			<fmt:formatDate value="${now}" pattern="yyyy-MM-dd hh:mm:ss" />
		</div>
	</div>
</div>