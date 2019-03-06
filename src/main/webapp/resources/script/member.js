// 아이디 중복확인
function idCheck() {
	if (document.frm.mb_id.value == "") {
		alert('아이디를 입력하여 주십시오.');
		document.frm.mb_id.focus();
		return;
	}
	var url = "/honey52/sub/test4.go?mb_id=" + document.frm.mb_id.value;
	window.open(url, "_blank_1", 
			"left="+((screen.availWidth-450)/2-100)+", top="+((screen.availHeight-250)/2-200)+", width=450px, height=250px," +
			"resizable=no, toolbar=no, menubar=no, location=no, scrollbars=no, status=no")
}

// 아이디 사용
function idok() {
	opener.frm.mb_id.value=document.frm.mb_id.value;
	opener.frm.mb_id_re.value=document.frm.mb_id.value;
	self.close();
}

// 주소 검색창 팝업
function findAddr(){
    var pop = window.open("http://93710a37.ngrok.io/honey52/view/sub/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");  
}

// 주소 검색 결과 사용
function jusoCallBack(roadFullAddr, rap1, adt, rap2, engAddr, jibunAddr, zipno, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
	document.frm.mb_rap1.value = rap1;
	document.frm.mb_rap2.value = rap2;
	document.frm.mb_adt.value = adt;
	document.frm.mb_zipno.value = zipno;
}

// 필수입력 창 입력 확인, 중복확인 여부 체크
function joinCheck() {
	if (document.frm.mb_name.value.length == 0) {
		alert("이름을 써주세요");
		frm.mb_name.focus();
		return false;
	}
	
	if (document.frm.mb_id.value.length == 0) {
		alert("아이디를 써주세요");
		frm.mb_id.focus();
		return false;
	}
	
	if (document.frm.mb_id.value.length < 4) {
		alert("아이디는 4글자이상이어야 합니다.");
		frm.mb_id.focus();
		return false;
	}
	
	if (document.frm.mb_pwd.value == "") {
		alert("암호는 반드시 입력해야 합니다.");
		frm.mb_pwd.focus();
		return false;
	}
	
	if (document.frm.mb_pwd.value != document.frm.mb_pwd_re.value) {
		alert("암호가 일치하지 않습니다.");
		frm.mb_pwd.focus();
		return false;
	}
	
	if (document.frm.email_front.value == "") {
		alert("이메일을 써주세요.");
		frm.email_front.focus();
		return false;
	}
	
	if (document.frm.mb_zipno.value == "") {
		alert("주소는 반드시 입력해야합니다.");
		frm.mb_zipno.focus();
		return false;
	}
	
	if (document.frm.mb_id_re.value.length == 0) {
		alert("중복 체크를 하지 않았습니다.");
		frm.mb_id.focus();
		return false;
	}
	return true;
}

// 로그인창 팝업
function loginPopUp(){
    var pop = window.open("/honey52/sub/test5.go","_blank_2", 
    		"left="+(screen.availWidth-570)/2+", top="+(screen.availHeight-420)/2+"," +
    				" width=570, height=420, scrollbars=no, resizable=no");  
}

function logout(){
	alert("로그아웃 되었습니다.");
	location.href="test6.go";
}

function goJoin(){
	opener.location = "/honey52/main/test/test3.go";
	self.close();
}

function goCart() {
	var pop = window.open("/honey52/sub/test8.go","_blank_3", 
    		"left="+(screen.availWidth-600)/2+", top="+((screen.availHeight-480)/2-100)+"," +
    				" width=600, height=480, scrollbars=yes, resizable=yes");
}

function addCart(num) {
	if(document.getElementById(num).value == '0'){
		alert("수량을 입력해주세요.");
		return false;
	} else {
		alert("장바구니에 추가 되었습니다.");
		return true;
	}
	return false;
}

function goOrder(){
	opener.location = "/honey52/main/test/test8.go";
	self.close();
}

//필수입력 창 입력 확인, 중복확인 여부 체크
function orderCheck() {

	if (document.frm.tel2.value.length == 0) {
		alert("연락처를 입력해 주세요");
		frm.tel2.focus();
		return false;
	}
	if (document.frm.tel3.value.length == 0) {
		alert("연락처를 입력해 주세요");
		frm.tel3.focus();
		return false;
	}
	
	if (document.frm.mb_zipno.value == "") {
		alert("주소는 반드시 입력해야합니다.");
		frm.mb_zipno.focus();
		return false;
	}
	
	return true;
}


// 회원정보 수정 체크
function updateCheck() {
	
	if (document.frm.mb_pwd.value != document.frm.mb_pwd_re.value) {
		alert("암호가 일치하지 않습니다.");
		frm.mb_pwd.focus();
		return false;
	}
	
	if (document.frm.tel2.value.length == 0) {
		alert("연락처를 입력해 주세요");
		frm.tel2.focus();
		return false;
	}
	if (document.frm.tel3.value.length == 0) {
		alert("연락처를 입력해 주세요");
		frm.tel3.focus();
		return false;
	}
	
	if (document.frm.email_front.value == "") {
		alert("이메일을 써주세요.");
		frm.email_front.focus();
		return false;
	}
	
	if (document.frm.mb_zipno.value == "") {
		alert("주소는 반드시 입력해야합니다.");
		frm.mb_zipno.focus();
		return false;
	}
	return true;
}

function goReceipt(ot_num) {
	var pop = window.open("/honey52/sub/test10.go?ot_num=" + ot_num,"_blank_4", 
    		"left="+(screen.availWidth-600)/2+", top="+((screen.availHeight-700)/2-100)+"," +
    				" width=600, height=700, scrollbars=yes, resizable=yes");
}
