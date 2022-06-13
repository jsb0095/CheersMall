<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-06-07
  Time: 오후 2:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>회원목록</title>
</head>
<body>
<jsp:include page="../../../resources/layout/header.jsp" flush="false"></jsp:include>
<table class="table">
    <tr>
        <th>회원번호</th>
        <th>회원아이디</th>
        <th>비밀번호</th>
        <th>이름</th>
        <th>생년월일</th>
        <th>이메일</th>
        <th>전화번호</th>
        <th>주소</th>
        <th>상세주소</th>
        <th>참고항목</th>
        <th>구매수량</th>


    </tr>
    <c:forEach var="user" items="${userList}">
    <tr>
        <td>${user.cheersMemberId}</td>
        <td>${user.memberId}</td>
        <td>${user.memberPassword}</td>
        <td>${user.memberName}</td>
        <td>${user.memberBirthDay}</td>
        <td>${user.memberEmail}</td>
        <td>${user.memberMobile}</td>
        <td>${user.memberAddress1}</td>
        <td>${user.memberAddress2}</td>
        <td>${user.memberAddress3}</td>
        <td>${user.memberBuy}</td>



    </tr>
    </c:forEach>
</body>
</html>
