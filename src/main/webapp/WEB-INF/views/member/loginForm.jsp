<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-06-05
  Time: 오후 5:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>로그인페이지</title>
</head>
<body>
<jsp:include page="../../../resources/layout/header.jsp" flush="false"></jsp:include>

<div class="container col-2" style="margin-top: 230px">
    <form action="/member/login" method="post" name="formName">
        <input class="form-control" type="text" name="memberId" placeholder="아이디"><br>
        <input class="form-control" type="password"  name="memberPassword" placeholder="비밀번호"><br>
        <button type="button" onclick="loginBtn()" class="d-grid mx-auto btn btn-warning" style="color: black" >로그인</button>
    </form>
</div>
</body>
<script>
    function loginBtn() {
        formName.submit();
    }
</script>
</html>
