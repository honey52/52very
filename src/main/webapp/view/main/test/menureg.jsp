<div class="container" align="center" style="margin-top: 30px;">
	<h1 class="my-4">메뉴 등록</h1>
	<form action="menureg.go" method="post" enctype="multipart/form-data">
		<table class="table" style="width: 70%;">
			<tbody>
				<tr>
					<th>카테고리</th>
					<td><select class="form-control" name="mc_code">
							<option value="1">버거세트</option>
							<option value="2">치킨세트</option>
							<option value="3">착한메뉴</option>
							<option value="4">햄버거</option>
							<option value="5">치킨</option>
							<option value="6">디저트</option>
							<option value="7">드링크</option>
					</select></td>
					<th>이미지</th>
					<td><input class="form-control-file border" type="file"
						name="mn_img" required="required"></td>
				</tr>
				<tr>
					<th>메뉴명</th>
					<td><input class="form-control" type="text" name="mn_title"
						required="required"></td>
					<th>메뉴설명</th>
					<td><textarea class="form-control" rows="5"
							name="mn_description" style="resize: none;"></textarea></td>
				</tr>
				<tr>
					<th>원산지1</th>
					<td><input class="form-control" type="text" name="mn_origin1"></td>
					<th>원산지2</th>
					<td><input class="form-control" type="text" name="mn_origin2"></td>
				</tr>
				<tr>
					<th>원산지3</th>
					<td><input class="form-control" type="text" name="mn_origin3"></td>
					<th>열량</th>
					<td><input class="form-control" type="text" name="mn_kcal"
						required="required"></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input class="form-control" type="text" name="mn_cost"
						required="required"></td>
					<th>알레르기 정보</th>
					<td><input class="form-control" type="text" name="mn_allergy"></td>
				</tr>
				<tr>
					<th>총중량 g</th>
					<td><input class="form-control" type="text" name="mn_gram"
						required="required"></td>
					<th>당류 g</th>
					<td><input class="form-control" type="text" name="mn_su"
						required="required"></td>
				</tr>
				<tr>
					<th>단백질 g</th>
					<td><input class="form-control" type="text" name="mn_pro"
						required="required"></td>
					<th>단백질(%)</th>
					<td><input class="form-control" type="text" name="mn_proper"
						required="required"></td>
				</tr>
				<tr>
					<th>나트륨 mg</th>
					<td><input class="form-control" type="text" name="mn_na"
						required="required"></td>
					<th>나트륨(%)</th>
					<td><input class="form-control" type="text" name="mn_naper"
						required="required"></td>
				</tr>
				<tr>
					<th>지방 g</th>
					<td><input class="form-control" type="text" name="mn_fat"
						required="required"></td>
					<th>지방(%)</th>
					<td><input class="form-control" type="text" name="mn_fatper"
						required="required"></td>
				</tr>
				<tr align="center">
					<td colspan="4"><input type="submit" class="btn btn-primary"
						value="전송">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="btn btn-danger"
						value="취소"></td>
				</tr>
			</tbody>
		</table>
	</form>
</div>