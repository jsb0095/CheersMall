<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-06-03
  Time: 오후 1:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="/resources/js/jquery.js"></script>
    <title>cheers🍺</title>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
회원아이디:${sessionScope.getMemberId}<br>
회원번호:${sessionScope.getId}<br>






<%--<a href="/member/myPage?cheersMemberId=${sessionScope.getId}"><input type="image" src="/resources/jpg/myPageIcon.jpg"width="50" height=50"></a><br>--%>

<a href="/member/kkoPay">결제하기</a>
</body>

</html>
