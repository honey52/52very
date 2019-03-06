<script>
	function change() {
		cost = document.ordercost.cost.value;
		cnt = document.ordercost.count.value;

		var totalcost = parseInt(cost * cnt);
		document.getElementById('totalcost').innerHTML = Number(totalcost)
				.toLocaleString('en');
	}
</script>

<!-- Page Content -->
<div class="container">
	<div class="row">
		<div class="col-lg-3">
			<h1 class="my-4">Menu</h1>
			<div class="list-group">
				<a href="test.go?mc_code=0"
					class="list-group-item list-group-item-action">전체메뉴</a> <a
					href="test.go?mc_code=1"
					class="list-group-item list-group-item-action">버거세트</a> <a
					href="test.go?mc_code=2"
					class="list-group-item list-group-item-action">치킨세트</a> <a
					href="test.go?mc_code=3"
					class="list-group-item list-group-item-action">착한메뉴</a> <a
					href="test.go?mc_code=4"
					class="list-group-item list-group-item-action">햄버거</a> <a
					href="test.go?mc_code=5"
					class="list-group-item list-group-item-action">치킨</a> <a
					href="test.go?mc_code=6"
					class="list-group-item list-group-item-action">디저트</a> <a
					href="test.go?mc_code=7"
					class="list-group-item list-group-item-action">드링크</a>
			</div>
		</div>
		<!-- /.col-lg-3 -->

		<div class="col-lg-9">

			<h1 class="mt-4">${mct.MC_TITLE}</h1>
			<blockquote class="blockquote">
				<footer class="blockquote-footer">${mct.MC_SUB}</footer>
			</blockquote>

			<!-- Portfolio Item Row -->
			<div class="row">

				<div class="col-md-7">
					<img class="img-fluid"
						src="${pageContext.request.contextPath}/resources/menuimg/${dtl.MN_IMG}"
						alt="">
				</div>

				<div class="col-md-5">
					<h3>${dtl.MN_TITLE}</h3>
					<p>${dtl.MN_DESCRIPTION}</p>
					<h4 class="mt-4">원산지</h4>
					<ul style="list-style-type: none;">
						<li>${dtl.MN_ORIGIN1}</li>
						<li>${dtl.MN_ORIGIN2}</li>
						<li>${dtl.MN_ORIGIN3}</li>
					</ul>
					<div class="row">
						<table class="table table-borderless">
							<tr>
								<td><h4>
										<b>${dtl.MN_KCAL} Kcal</b>
									</h4></td>
								<th><h3>
										<img class="img-fluid"
											src="${pageContext.request.contextPath}/resources/images/won.png">&nbsp;
										<b id="totalcost"><fmt:formatNumber value="${dtl.MN_COST}"
												pattern="#,###.##" /></b>
									</h3></th>
							</tr>
						</table>
					</div>
					<div class="row">
						<form action="test7.go" method="get" name="ordercost">
							<table class="table table-borderless">
								<tr>
									<th>
										<h5>
											<b>수량 : <input type="hidden" name="menu_num"
												value="${dtl.MN_NUM}"> <input type="hidden"
												name="menu" value="${dtl.MN_TITLE}"> <input
												type="hidden" name="cost" value="${dtl.MN_COST}"> <input
												type="number" name="count" id="1" value="1" min="1"
												style="width: 60px; margin-right: 50px; text-align: center;"
												onchange="change();"></b>
											<c:if test="${user_id != null}">
												<input type="submit" value="장바구니 담기"
													onclick="return addCart(1);">
											</c:if>
											<c:if test="${user_id == '' || user_id eq null}">
												<input type="submit" value="장바구니 담기" onclick="loginPopUp();">
											</c:if>
										</h5>
									</th>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<h5 class="my-4">
					<b>영양정보</b>
				</h5>
				<table class="table table-sm table-striped"
					style="margin-top: -15px; text-align: center;">
					<tr>
						<th>총중량 g</th>
						<th>열량 Kcal</th>
						<th>단백질 g(%)</th>
						<th>나트륨 mg(%)</th>
						<th>당류 g</th>
						<th>포화지방 g(%)</th>
					</tr>
					<tr>
						<td>${dtl.MN_GRAM}</td>
						<td>${dtl.MN_KCAL}</td>
						<td>${dtl.MN_PRO}(${dtl.MN_PROPER})</td>
						<td>${dtl.MN_NA}(${dtl.MN_NAPER})</td>
						<td>${dtl.MN_SU}</td>
						<td>${dtl.MN_FAT}(${dtl.MN_FATPER}</td>
					</tr>
					<tr>
						<th colspan="6">비고</th>
					</tr>
					<tr align="left">
						<td colspan="6">${dtl.MN_ALLERGY}</td>
					</tr>
				</table>

			</div>
			<!-- /.row -->
			<!-- Related Projects Row -->
			<h5 class="my-4">
				<b>다른 ${mct.MC_TITLE}</b>
			</h5>
			<div id="carouselExampleIndicators" class="carousel slide my-4"
				data-ride="carousel" data-interval="3000">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<div class="row">
							<c:forEach var="mimg" items="${rm}" begin="0" end="3">
								<div class="col-md-3 col-sm-6 mb-4">
									<a
										href="test2.go?mn_num=${mimg.MN_NUM}&mc_code=${mimg.MC_CODE}">
										<img class="img-fluid"
										src="${pageContext.request.contextPath}/resources/menuimg/${mimg.MN_IMG}"
										alt="">
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="carousel-item">
						<div class="row">
							<c:forEach var="mimg" items="${rm}" begin="4" end="7">
								<div class="col-md-3 col-sm-6 mb-4">
									<a
										href="test2.go?mn_num=${mimg.MN_NUM}&mc_code=${mimg.MC_CODE}">
										<img class="img-fluid"
										src="${pageContext.request.contextPath}/resources/menuimg/${mimg.MN_IMG}"
										alt="">
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- /.col-lg-9 -->
	</div>
	<!-- /.row -->

</div>
<!-- /.container -->
