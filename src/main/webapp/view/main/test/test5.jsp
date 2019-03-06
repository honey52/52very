<!-- Page Content -->
<div class="container" style="margin-top: 50px; margin-bottom: 150px;" align="center">
	<c:set var="totalEA" value="0"></c:set>
	<c:forEach var="c" items="${odList}">
		<c:set var="totalEA" value="${totalEA + c.OD_COUNT}" />
	</c:forEach>
	<h1>주 문 서</h1><br>
	<table class="table table-sm" style="width: 40%;">
		<tbody>
			<tr>
				<th>주문일자</th>
				<td colspan="2"></td>
				<td align="right">${oList.OT_DATE}</td>
				<td align="right">${oList.OT_HOUR}</td>
			</tr>
			<tr style="border-bottom: hidden;">
				<th rowspan="3">주소</th>
				<td colspan="4" style="border-bottom: hidden;">${oList.OT_RAP1}</td>
			</tr>
			<tr>
				<td colspan="4" style="border-bottom: hidden;">${oList.OT_RAP2}</td>
			</tr>
			<tr style="border-bottom: hidden;">
				<td colspan="4">${oList.OT_ADT}</td>
			</tr>
			<tr style="border-bottom: hidden;">
				<th>주문자</th>
				<td colspan="4">${oList.MB_NAME}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td colspan="4">${oList.OT_TEL}</td>
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
			<c:forEach var="li" items="${odList}">
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
				<td colspan="5" style="font-size: 12px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* 요청사항 : ${oList.OT_REQUIRE}</td>
			</tr>
			<tr style="border-bottom: hidden;">
				<td>과세품목</td>
				<td></td>
				<td></td>
				<td></td>
				<td align="right"><fmt:formatNumber value="${oList.OT_PRICE*0.9}" pattern="#,###"/></td>
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
				<td align="right"><fmt:formatNumber value="${oList.OT_PRICE*0.1}" pattern="#,###"/></td>
			</tr>
			<tr>
				<td>합&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계</td>
				<td></td>
				<td align="right">${totalEA}</td>
				<td></td>
				<td align="right"><fmt:formatNumber value="${oList.OT_PRICE}" pattern="#,###"/></td>
			</tr>
			<tr style="border-top: hidden;">
				<td colspan="5" style="font-size: 12px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* 결제방법 : ${oList.PM_TITLE}</td>
			</tr>
		</tbody>
	</table>
		<p>	주문하신 음식은 30분 이내에 배달됩니다.</p>
</div>
<!-- /.container -->