<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-06-05
  Time: 오후 8:41
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>마이페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<table class="table">
    <tr>
        <th>주문번호</th>
        <th>아이디</th>
        <th>주문날짜</th>
        <th>주문명</th>
        <th>주문자번호</th>
        <th>주소1</th>
        <th>주소2</th>
        <th>주소3</th>
        <th>수량</th>
        <th>금액</th>
        <th>운송장번호</th>
        <th>배송일</th>

    </tr>
    <c:forEach var="oder" items="${findId}">
        <tr>
            <td>${oder.oderId}</td>
            <td>${oder.memberId}</td>
            <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${oder.oderDate}"></fmt:formatDate></td>
            <td>${oder.oderName}</td>
            <td>${oder.oderMobile}</td>
            <td>${oder.oderAddress1}</td>
            <td>${oder.oderAddress2}</td>
            <td>${oder.oderAddress3}</td>
            <td>${oder.oderAmount}</td>
            <td>${oder.oderPayment}</td>
            <td>${oder.oderInvoice}</td>
            <td>${oder.oderDelivarry}</td>



        </tr>
    </c:forEach>
</table>
</body>
</html>
