<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-06-03
  Time: 오후 3:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- CSS only -->

<html>
<head>

    <title>회원가이페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>
<jsp:include page="../../../resources/layout/header.jsp" flush="false"></jsp:include>
<div class="position-absolute top-50 start-50 translate-middle d-grid mx-auto"style="margin-top: 70px" >
<form action="/member/save" method="post" enctype="multipart/form-data">
    <input type="text" class="form-control" name="memberId" id="duplicateMemberId" onblur="duplicate()" placeholder="아이디"><br>
    <p id="duplicateResult"></p>
    <input type="password" id="password" class="form-control" onblur="pwCheck()" name="memberPassword" placeholder="비밀번호">
    <p id="passCheck"></p>
    <input type="text" class="form-control" name="memberName" placeholder="이름"><br>
    <input type="text" class="form-control" name="memberBirthDay" placeholder="생년월일"><br>
    <input type="email" class="form-control" name="memberEmail" placeholder="이메일"><br>
    <input type="tel" class="form-control" name="memberMobile" placeholder="전화번호"><br>
    <input type="text" class="form-control" id="sample6_postcode" name="memberAddress1" placeholder="우편번호"><br>
    <input type="button" class="form-control btn btn-warning" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br><br>
    <input type="text" class="form-control" id="sample6_address" name="memberAddress2" placeholder="주소"><br>
    <input type="text"class="form-control" id="sample6_detailAddress" name="memberAddress3" placeholder="상세주소"><br>
    <input type="text" class="form-control" id="sample6_extraAddress" placeholder="참고항목"><br>


    <input type="submit"  class="form-control btn btn-warning" value="회원가입">
</form>
</div>
</body>
<script>

    function pwCheck() {
        let passwordCheck= document.getElementById("password").value;
        let passCheck= document.getElementById("passCheck")
        let exp=/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[-_!#$])[A-Za-z\d-_!#$]{5,20}$/;

        if (passwordCheck .match(exp)){
            passCheck.innerHTML="사용가능한 비밀번호입니다"
            passCheck.style.color="green"
        }else{
            passCheck.innerHTML="영문(대,소문자) 숫자 특수기호(-_!#$)<br>사용하여 입력해주세요";
            passCheck.style.color="red"
        }
    }
    function duplicate(){
    const duplicateMemberId=document.getElementById("duplicateMemberId").value;
    const duplicateResult=document.getElementById("duplicateResult");
$.ajax({
    type:"post",
    url:"/member/duplicateCheck",
    data:{"duplicateMemberId":duplicateMemberId},
    dataType:"text",

    success: function (result){
        if(result=="yes"){
            duplicateResult.style.color="green"
            duplicateResult.innerHTML="사용가능한 아이디입니다"
        }else {
            duplicateResult.style.color="red"
            duplicateResult.innerHTML="이미 사용중이거나 탈퇴한 아이디입니다"
        }
    },  error: function(){console.log("중복아이디")}

})
    }
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;

                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</html>
