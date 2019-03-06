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
<script type="text/javascript">
	$(document).ready(function() {
		var $sel = $('#select');
		var $email = $('#email');

		$sel.change(function() {
			val = $sel.val();
			if (val.length < 1) {
				$email.removeAttr('readonly');
			} else {
				$email.attr('readonly', true);
			}
			$email.val(val);
		});
	});
</script>
<c:set var="i" value="${user_info}" />
<div id="wrapper">
	<div id="content-wrapper">
		<div class="container-fluid">
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li class="breadcrumb-item">회원정보</li>
			</ol>

			<!-- Icon Cards-->
			<form action="test11.go" method="post" name="frm">
				<div class="row">
					<c:if test="${i.MB_GENDER == 0}">
						<div class="col-xl-3 col-sm-6 mb-3" align="center">
							<img
								src="${pageContext.request.contextPath}/resources/images/man.png">
							<br> <br> <br> <br> <br> <br> <br>
							<input type="submit" class="btn btn-outline-dark btn-sm"
								value="회원정보수정" onclick="return updateCheck()" />
						</div>
					</c:if>
					<c:if test="${i.MB_GENDER == 1}">
						<div class="col-xl-3 col-sm-6 mb-3" align="center">
							<img
								src="${pageContext.request.contextPath}/resources/images/woman.png">
							<br> <br> <br> <br> <br> <br> <br>
							<input type="submit" class="btn btn-outline-dark btn-sm"
								value="회원정보수정" onclick="return updateCheck()" />
						</div>
					</c:if>
					<div class="col-xl-9 col-sm-6 mb-3">
						<input type="hidden" name="mb_num" value="${i.MB_NUM}">
						<table class="table table-borderless">
							<tbody>
								<tr>
									<th>아아디</th>
									<td colspan="3"><input type="text" name="mb_id"
										value="${i.MB_ID}" style="border: none;" readonly="readonly" /></td>
								</tr>
								<tr>
									<th>이름</th>
									<td><input type="text" name="mb_name"
										style="border: none;" value="${i.MB_NAME}" readonly="readonly" /></td>
									<th>생년월일</th>
									<fmt:parseDate value="${i.MB_BIRTH}" var="date"
										pattern="yyyyMMdd" />
									<fmt:formatDate value="${date}" var="mb_birth"
										pattern="yyyy-MM-dd" />
									<td><input type="date" name="mb_birth"
										style="border: none;" value="${mb_birth}" readonly="readonly" /></td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td><input type="password" name="mb_pwd"
										required="required" /></td>
									<th>비밀번호 확인</th>
									<td><input type="password" name="mb_pwd_re"
										required="required" /></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<c:set var="mb_tel" value="${i.MB_TEL}" />
									<td colspan="3"><select name="tel1" style="width: 80px;">
											<option value='010'>010</option>
											<option value='011'>011</option>
											<option value='016'>016</option>
											<option value='017'>017</option>
											<option value='018'>018</option>
											<option value='019'>019</option>
											<option value='02'>02</option>
											<option value='031'>031</option>
											<option value='032'>032</option>
											<option value='033'>033</option>
											<option value='041'>041</option>
											<option value='042'>042</option>
											<option value='043'>043</option>
											<option value='051'>051</option>
											<option value='052'>052</option>
											<option value='053'>053</option>
											<option value='054'>054</option>
											<option value='055'>055</option>
											<option value='061'>061</option>
											<option value='062'>062</option>
											<option value='063'>063</option>
											<option value='064'>064</option>
									</select>&nbsp;- <input maxlength="4" type="tel" style="width: 80px;"
										name="tel2" value="${fn:substring(mb_tel, 4, 8)}" />&nbsp;- <input
										maxlength="4" type="tel" style="width: 80px;" name="tel3"
										value="${fn:substring(mb_tel, 9, 13)}" /></td>
								</tr>
								<tr>
									<th>이메일</th>
									<c:set var="mb_email" value="${i.MB_EMAIL}" />
									<td colspan="3"><input type="text" name="e_f"
										value="${fn:substringBefore(mb_email, '@')}" />&nbsp;@ <input
										type="text" id="email" name="e_b"
										value="${fn:substringAfter(mb_email, '@')}"> <select
										id="select">
											<option value=''>직접입력</option>
											<option value='gmail.com'>gmail.com</option>
											<option value='naver.com'>naver.com</option>
											<option value='live.com'>live.com</option>
											<option value='hotmail.com'>hotmail.com</option>
											<option value='yahoo.com'>yahoo.com</option>
											<option value='hanmail.net'>hanmail.net</option>
											<option value='daum.net'>daum.net</option>
											<option value='hanmir.com'>hanmir.com</option>
											<option value='hitel'>hitel.net</option>
											<option value='dreamwiz.com'>dreamwiz.com</option>
											<option value='nate.com'>nate.com</option>
											<option value='empal.com'>empal.com</option>
									</select><br> <input type="checkbox" name="mb_eopen" value="1"
										checked="checked">공개여부
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox"
										name="mb_adok" value="1" checked="checked">수신동의</td>
								</tr>
								<tr>
									<th rowspan="3">주소</th>
									<td colspan="3" style="border-bottom: hidden;"><span
										style="display: inline-block; width: 87px;">우편번호</span> <input
										type="hidden" id="confmKey" name="confmKey" value="">
										<input type="text" readonly="readonly" style="width: 100px;"
										name="mb_zipno" id="mb_zipno" value="${i.MB_ZIPNO}" /> &nbsp;
										<button type="button" class="btn btn-outline-dark btn-sm"
											onclick="findAddr();">
											<img
												src="${pageContext.request.contextPath}/resources/images/house.png">검색
										</button></td>
								</tr>
								<tr>
									<td colspan="3" style="border-bottom: hidden;"><span
										style="display: inline-block; width: 87px;">도로명주소</span> <input
										type="text" readonly id="mb_rap1" name="mb_rap1"
										style="width: 450px;" value="${i.MB_RAP1}" /></td>
								</tr>
								<tr>
									<td colspan="3"><span
										style="display: inline-block; width: 90px;">상세주소</span><input
										type="text" id="mb_adt" name="mb_adt" style="width: 221px;"
										value="${i.MB_ADT}" /> &nbsp;<input type="text" id="mb_rap2"
										name="mb_rap2" style="width: 221px;" value="${i.MB_RAP2}" /></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</form>
			<!-- DataTables Example -->
			<div class="card mb-3">
				<div class="card-header">주문이력</div>
				<div class="card-body">
					<div class="table-responsive" id="orders">
						<table class="table table-bordered table-sm" id="dataTable">
							<thead>
								<tr align="center">
									<th>주문번호</th>
									<th>주문날짜</th>
									<th>주문상품(주문서)</th>
									<th>주문지</th>
									<th>요청사항</th>
									<th>결제가격</th>
									<th>결제방법</th>
									<th>결제상태</th>
									<th>비고</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="all" items="${orderlist}">
									<tr>
										<td align="center">${all.OT_NUM}</td>
										<td>${all.OT_DATE}&nbsp;${all.OT_HOUR}</td>
										<td><a style="cursor: pointer"
											onclick="goReceipt(${all.OT_NUM});">${all.OT_MENU}</a></td>
										<td>${all.OT_RAP1}<br>${all.OT_ADT}</td>
										<td>${all.OT_REQUIRE}</td>
										<td align="right"><fmt:formatNumber
												value="${all.OT_PRICE}" pattern="#,###.##원" /></td>
										<td align="center">${all.PM_TITLE}</td>
										<td align="center">${all.PS_TITLE}</td>
										<td align="center">${all.OST_TITLE}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<fmt:parseNumber value="${page.endn}" var="endn" />
					<fmt:parseNumber value="${page.lstbnum}" var="lstbnum" />
					<ul class="pagination justify-content-center pagination-sm">
						<li class="page-item"><a class="page-link"
							href="test11.go?pg=1&bEa=${page.bEa}">처음</a></li>
						<c:if test="${(page.stn-1) <= 0}">
							<li class="page-item"><a class="page-link"
								href="test11.go?pg=1&bEa=${page.bEa}">◀</a></li>
						</c:if>
						<c:if test="${(page.stn-1) > 0}">
							<li class="page-item"><a class="page-link"
								href="test11.go?pg=${page.stn-1}&bEa=${page.bEa}">◀</a></li>
						</c:if>
						<c:if test="${ endn>=lstbnum }">
							<c:forEach var="i" begin="${page.stn}" end="${lstbnum}">
								<li class="page-item"><a class="page-link"
									href="test11.go?pg=${i}&bEa=${page.bEa}">${i}</a></li>
							</c:forEach>
						</c:if>
						<c:if test="${ endn<lstbnum }">
							<c:forEach var="i" begin="${page.stn}" end="${endn}">
								<li class="page-item"><a class="page-link"
									href="test11.go?pg=${i}&bEa=${page.bEa}">${i}</a></li>
							</c:forEach>
						</c:if>
						<c:if test="${ endn>=lstbnum }">
							<li class="page-item"><a class="page-link"
								href="test11.go?pg=${lstbnum}&bEa=${page.bEa}">▶</a></li>
						</c:if>
						<c:if test="${ endn<lstbnum }">
							<li class="page-item"><a class="page-link"
								href="test11.go?pg=${endn+1}&bEa=${page.bEa}">▶</a></li>
						</c:if>
						<li class="page-item"><a class="page-link"
							href="test11.go?pg=${lstbnum}&bEa=${page.bEa}">맨끝</a></li>
					</ul>
				</div>
				<c:set var="now" value="<%=new java.util.Date()%>" />
				<div class="card-footer small text-muted">
					Updated
					<fmt:formatDate value="${now}" pattern="yyyy-MM-dd hh:mm:ss" />
				</div>
			</div>
			<!-- /.container-fluid -->
		</div>
	</div>
</div>