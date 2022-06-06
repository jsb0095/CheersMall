<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-06-03
  Time: 오후 1:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <title>cheers🍺</title>
</head>
<body>
회원아이디:${sessionScope.getMemberId}<br>
회원번호:${sessionScope.getId}<br>

<a href="/member"><input type="image" src="/resources/jpg/logo2.jpg" width="100" height=50"></a>
<a><input type="button" onclick="saveForm()">회원가입</a><br>
<a href="/member/loginForm">로그인</a><br>

<a href="/member/logout">로그아웃</a><br>

<a href="/member/myPage?cheersMemberId=${sessionScope.getId}"><input type="image" src="/resources/jpg/myPageIcon.jpg"width="50" height=50"></a><br>
</body>
<script>
    function saveForm(){
        location.href="/member/saveForm"
    }
    <%--function myPage(){--%>
    <%--    location.href="/member/myPage?memberId="${sessionScope.memberId};--%>
    <%--}--%>
</script>
</html>
