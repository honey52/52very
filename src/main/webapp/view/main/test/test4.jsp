<!-- Page Content -->
<div class="container" align="center" style="margin-top: 30px;">
	<h2>
		<b>주문확인 및 결제</b>
	</h2>
	<p>지금까지 이런 맛은 없었다... 사랑합니다. 고객님&#10084;</p>
	<form action="test8.go" method="post" name="frm">
		<input type="hidden" name="mb_num" value="${user_info.MB_NUM}">
		<c:if test="${fn:length(cart)-1 == 0}">
		<input type="hidden" name="ot_menu" value="${cart[0].menu}">
		</c:if>
		<c:if test="${fn:length(cart)-1 != 0}">
		<input type="hidden" name="ot_menu" value="${cart[0].menu} 외 ${fn:length(cart)-1}개">
		</c:if>
		<table class="table" style="width: 55%;">
			<tbody>
				<tr>
					<th width="100px;">주문정보</th>
					<td colspan="2">
						<ul class="fa-ul" style="text-align: right; list-style-type: none;">
							<c:forEach var="i" items="${cart}" varStatus="s">
								<li>${i.menu} (<fmt:formatNumber value="${i.cost}" pattern="#,###.##원" />)&nbsp;&nbsp;
								${i.count}개&nbsp;&nbsp;
								<fmt:formatNumber value="${i.cost*i.count}" pattern="#,###.##원" />&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="test9.go?index=${s.index}" id ="del">x</a>
								</li>
							</c:forEach>
						</ul>
						<hr> <c:set var="total" value="0" /> <c:forEach var="i"
							items="${cart}">
							<c:set var="total" value="${total + i.cost*i.count}" />
						</c:forEach>
						<h6 style="text-align: right;">
							총 :
							<fmt:formatNumber value="${total}" pattern="#,###.##원" />
						</h6>
						<input type="hidden" name="ot_price" value="${total}">
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td colspan="2"><select name="tel1" style="width: 80px;">
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
						name="tel2" />&nbsp;- <input maxlength="4" type="tel"
						style="width: 80px;" name="tel3" /></td>
				</tr>
				<tr>
					<th rowspan="4">주소</th>
					<td style="border-bottom: hidden;">우편번호</td>
					<td style="border-bottom: hidden;">
					<input type="hidden" id="confmKey" name="confmKey" value="">
					<input type="text" readonly="readonly" style="width: 100px;" name="mb_zipno" id="mb_zipno" value="${user_info.MB_ZIPNO}"/> &nbsp;
					<button type="button" class="btn btn-outline-dark btn-sm" onclick="findAddr();"><img src="${pageContext.request.contextPath}/resources/images/house.png">검색</button></td>
				</tr>
				<tr style="border-bottom: hidden;">
					<td>도로명주소</td>
					<td><input type="text" readonly id="mb_rap1" name="mb_rap1" value="${user_info.MB_RAP1}" style="width: 362px;" /></td>
				</tr>
				<tr style="border-bottom: hidden;">
					<td>상세주소1</td>
					<td>
					<input type="text" id="mb_rap2" name="mb_rap2" value="${user_info.MB_RAP2}" style="width: 362px;" />
					</td>
				</tr>
				<tr>
					<td>상세주소2</td>
					<td>
					<input type="text" id="mb_adt" name="mb_adt" value="${user_info.MB_ADT}" style="width: 362px;" />
					</td>
				</tr>
				<tr>
					<th>요청사항</th>	
					<td colspan="2">
					<textarea rows="3" cols="64" name="ot_require" style="resize: none;"></textarea>
					</td>
				</tr>
				<tr>
					<th>결제방법</th>	
					<td colspan="2">
						<input type="radio" name="pm_code" value="1" checked="checked">현금&nbsp;&nbsp;
						<input type="radio" name="pm_code" value="2">카드&nbsp;&nbsp;
						<input type="radio" name="pm_code" value="3">계좌이체 (농협 489-01-279426 / 김선중)<br>
						<small>
						* 배달시 배달원에게 결제할 방법을 선택하세요.
						</small>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
					<input type="submit" class="btn btn-outline-dark btn-sm" value="결제" onclick="return orderCheck()"/> &nbsp;
					<input type="button" class="btn btn-outline-danger btn-sm" value="취소" onclick="location.href='test.go'"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
<!-- /.container -->
