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
<jsp:include page="../../../resources/layout/header.jsp" flush="false"></jsp:include>
<div class="text-center" style="word-spacing: 5em">
    <a href="/item/bestPaging" class="text-black">베스트</a>
    <a href="/item/paging" class="text-black">육류</a>
    <a href="/item/paging" class="text-black">해산물</a>
    <a href="/item/paging" class="text-black">MD추천</a>
    <a href="/item/paging" class="text-black">술안주</a>
</div>
<div style="margin:0 300px; width: 1200px; height: 850px">

<c:forEach var="item" items="${itemDTOList}">
    <span class="a2" style="margin-left: 150px; text-align: center">
        <span class="card" style="margin-top: 50px ;float:left; width: 275px; height: 350px">
            <img width="275px" height="245px" onclick="detail(${item.itemId})" src="${pageContext.request.contextPath}/upload/${item.itemImageName1}">
            <span class="card-body">
                <p class="card-text">${item.itemName}<br>
                    <del style="color: red">${item.itemPrice}원</del>=>${item.itemDiscount}원</p>
            </span>
        </span>
    </span>
</c:forEach>
</div>


</body>
<script>
    function detail(itemID){
        location.href="/item/itemDetail?itemId="+itemID;
    }
</script>
</html>
