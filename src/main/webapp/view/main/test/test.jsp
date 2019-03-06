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

			<div id="carouselExampleIndicators" class="carousel slide my-4"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img class="d-block img-fluid"
							src="${pageContext.request.contextPath}/resources/images/event1.jpg"
							alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid"
							src="${pageContext.request.contextPath}/resources/images/event2.jpg"
							alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid"
							src="${pageContext.request.contextPath}/resources/images/event3.jpg"
							alt="Third slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>

			<div class="row">
				<c:forEach var="mli" items="${mlist}" varStatus="s">
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="test2.go?mn_num=${mli.MN_NUM}&mc_code=${mli.MC_CODE}"><img
								class="card-img-top"
								src="${pageContext.request.contextPath}/resources/menuimg/${mli.MN_IMG}"
								alt=""></a>
							<div class="card-body">
								<h5 class="card-title">
									<a href="test2.go?mn_num=${mli.MN_NUM}&mc_code=${mli.MC_CODE}">${mli.MN_TITLE}</a>
								</h5>
								<h5>
									<fmt:formatNumber value="${mli.MN_COST}" pattern="#,###.##원" />
								</h5>
								<p class="card-text">${mli.MN_DESCRIPTION}</p>
							</div>
							<div class="card-footer">
							<form action="test7.go" name="ordercost" method="get">
								<small class="text-muted">
								수량
								<input type="hidden" name="menu_num" value="${mli.MN_NUM}"> 
								<input type="hidden" name="menu" value="${mli.MN_TITLE}"> 
								<input type="hidden" name="cost" value="${mli.MN_COST}">
								<input type="number" name="count" id="${s.count}" value="0" min="0"
								style= "width:40px; margin-left: 40px; text-align: center;">
								<c:if test="${user_id != null}">
								<input type="submit" value="장바구니 담기" onclick="return addCart(${s.count});" style="float:right;">
								</c:if>
								<c:if test="${user_id == '' || user_id eq null}">
								<input type="submit" value="장바구니 담기" onclick="loginPopUp();" style="float:right;">
								</c:if>
								</small>
							</form>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
			<!-- /.row -->
			<fmt:parseNumber value="${page.endn}" var="endn" />
			<fmt:parseNumber value="${page.lstbnum}" var="lstbnum" />
			<ul class="pagination justify-content-center pagination-sm">
				<li class="page-item"><a class="page-link"
					href="test.go?pg=1&bEa=${page.bEa}&mc_code=${page.mc_code}">처음</a></li>
				<c:if test="${(page.stn-1) <= 0}">
					<li class="page-item"><a class="page-link"
						href="test.go?pg=1&bEa=${page.bEa}&mc_code=${page.mc_code}">◀</a></li>
				</c:if>
				<c:if test="${(page.stn-1) > 0}">
					<li class="page-item"><a class="page-link"
						href="test.go?pg=${page.stn-1}&bEa=${page.bEa}&mc_code=${page.mc_code}">◀</a></li>
				</c:if>
				<c:if test="${ endn>=lstbnum }">
					<c:forEach var="i" begin="${page.stn}" end="${lstbnum}">
						<li class="page-item"><a class="page-link"
							href="test.go?pg=${i}&bEa=${page.bEa}&mc_code=${page.mc_code}">${i}</a></li>
					</c:forEach>
				</c:if>
				<c:if test="${ endn<lstbnum }">
					<c:forEach var="i" begin="${page.stn}" end="${endn}">
						<li class="page-item"><a class="page-link"
							href="test.go?pg=${i}&bEa=${page.bEa}&mc_code=${page.mc_code}">${i}</a></li>
					</c:forEach>
				</c:if>
				<c:if test="${ endn>=lstbnum }">
					<li class="page-item"><a class="page-link"
						href="test.go?pg=${lstbnum}&bEa=${page.bEa}&mc_code=${page.mc_code}">▶</a></li>
				</c:if>
				<c:if test="${ endn<lstbnum }">
					<li class="page-item"><a class="page-link"
						href="test.go?pg=${endn+1}&bEa=${page.bEa}&mc_code=${page.mc_code}">▶</a></li>
				</c:if>
				<li class="page-item"><a class="page-link"
					href="test.go?pg=${lstbnum}&bEa=${page.bEa}&mc_code=${page.mc_code}">맨끝</a></li>
			</ul>
		</div>
		<!-- /.col-lg-9 -->
	</div>
	<!-- /.row -->

</div>
<!-- /.container -->
