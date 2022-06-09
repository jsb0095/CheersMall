<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-06-06
  Time: 오후 6:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>회원정보수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="/resources/js/jquery.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<table class="table">
    <div class="position-absolute top-50 start-50 translate-middle d-grid mx-auto">
        <form action="/member/update" method="post">

            회원번호<input type="text"  name="cheersMemberId"  value="${userData.cheersMemberId}"readonly>
            아이디<input type="text" id="memberId" name="memberId" value="${userData.memberId}"readonly>
                <span id="updateIdCheck"></span>
            비밀번호<input type="password" name="memberPassword">
            이름<input type="text"  value="${userData.memberName}" name="memberName">
                <input type="text" id="sample6_postcode" name="memberAddress1" placeholder="우편번호"><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                <input type="text" id="sample6_address" name="memberAddress2" placeholder="주소">
                <input type="text" id="sample6_detailAddress" name="memberAddress3" placeholder="상세주소">
                <input type="text" id="sample6_extraAddress" placeholder="참고항목">
                <div class="col-12 d-grid mx-auto"><input type="submit" value="회원정보수정" > <input type="button" onclick="cancel()" value="취소"></div>
                <input type="button" class="col-12 d-grid mx-auto"  onclick="deleteId()" value="회원탈퇴">
        </form>
    </div>


</table>
</body>
<script>
function deleteId(){
  const result= confirm("정말 삭제하시겠습니까 ?")
    if (result){
        location.href="/member/delete?cheersMemberId=${userData.cheersMemberId}";
    }

}

    function cancel(){
        location.href="/member/cheersMain"
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
