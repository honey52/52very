<script type="text/javascript">
$(document).ready(function(){
	var $sel = $('#select');
	var $email = $('#email');
	
	$sel.change(function(){
		val = $sel.val();
		if(val.length < 1){
			$email.removeAttr('readonly');
		}else{
			$email.attr('readonly', true);
		}
		$email.val(val);
	});
});
</script>


<!-- Page Content -->
<div class="container" align="center" style="margin-top: 30px;">
	<h2>
		<b>썬데리아 가족 되기</b>
	</h2>
	<p>지금까지 이런 맛은 없었다... 사랑합니다. 고객님&#10084;</p>
	<form action="test3.go" method="post" name="frm">
	<table class="table" style="width: 70%;">
		<tbody>
			<tr>
				<th>이름</th>
				<td colspan="5"><input type="text" name="mb_name" /></td>
			</tr>
			<tr>
			<th>성별</th>
				<td colspan="5"><input type="radio" name="mb_gender" value="0">남자
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
					name="mb_gender" value="1" checked="checked">여자</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td colspan="5"><input type="date" name="mb_birth" value="2001-01-01"/></td>
			</tr>
			<tr>
				<th>아아디</th>
				<td colspan="5"><input type="text" name="mb_id"/>
				<input type="hidden" name="mb_id_re" size="20">
				&nbsp;
				<input type="button" class="btn btn-outline-dark btn-sm" value="중복확인" onclick="idCheck();"/><br>
				*아이디는 영문 또는 영문, 숫자 조합으로 작성바랍니다.
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td colspan="5"><input type="password" name="mb_pwd" /><br>
				*비밀번호는 영문, 숫자, 특수문자 조합으로 작성바랍니다.
				</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td colspan="5"><input type="password" name="mb_pwd_re" /></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td colspan="5"><input type="text" name="e_f" />&nbsp;@
				<input type="text" id="email" name="e_b" value="">
				<select id="select">
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
				</select><br>
				<input type="checkbox" name="mb_eopen" value="1" checked="checked">공개여부
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox"
					name="mb_adok" value="1" checked="checked">수신동의
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td colspan="5">
				<select name="tel1" style="width: 80px;">
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
					</select>&nbsp;-
				<input maxlength="4" type="tel" style="width: 80px;" name="tel2" />&nbsp;-
				<input maxlength="4" type="tel" style="width: 80px;" name="tel3" /></td>
			</tr>
			<tr>
				<th rowspan="3">주소</th>
				<td style="border-bottom: hidden;">우편번호</td>
				<td colspan="4" style="border-bottom: hidden;">
				<input type="hidden" id="confmKey" name="confmKey" value=""  >
				<input type="text" readonly="readonly" style="width: 100px;" name="mb_zipno" id="mb_zipno" />
				&nbsp;
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="findAddr();"><img src="${pageContext.request.contextPath}/resources/images/house.png">검색</button></td>
			</tr>
			<tr>
			<td style="border-bottom: hidden;">도로명주소</td>
				<td colspan="4" style="border-bottom: hidden;">
				<input type="text" readonly id="mb_rap1" name="mb_rap1" style="width: 450px;"/></td>
			</tr>
			<tr>
			<td>상세주소</td>
				<td colspan="4"><input type="text" id="mb_adt" name="mb_adt" style="width: 221px;"/>
				&nbsp;<input type="text" id="mb_rap2" name="mb_rap2" style="width: 221px;"/></td>
			</tr>
			<tr>
			<td colspan="6" align="center"><input type="submit" class="btn btn-outline-dark btn-sm" value="회원가입" onclick="return joinCheck()"/>
			&nbsp;<input type="reset" class="btn btn-outline-danger btn-sm" value="취소"/></td>
			
			</tr>
		</tbody>
	</table>
	</form>
</div>
<!-- /.container -->
