<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-06-07
  Time: 오후 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>운영자전용페이지</title>
</head>
<body>
<jsp:include page="../../../resources/layout/header.jsp" flush="false"></jsp:include>
<div class="text-center" style="word-spacing: 5em">
    <a href="/item/bestPaging" class="text-black">베스트</a>
    <a href="/item/meatPaging" class="text-black">육류</a>
    <a href="/item/seaFoodPaging" class="text-black">해산물</a>
    <a href="/item/nightMealPaging" class="text-black">야식</a>
    <a href="/item//mealKitPaging" class="text-black">밀키트</a>
</div>


</body>
<div style="margin:0 300px; width: 1200px; height: 850px">
    <c:forEach var="item" items="${itemDTOList}">
    <span class="a2" style="margin-left: 150px; text-align: center">
        <span class="card" style="margin-top: 50px ;float:left;margin-left: 10px; width: 275px; height: 350px">
            <img width="275px" height="245px"  onclick="detail(${item.itemId})" src="${pageContext.request.contextPath}/upload/${item.itemImageName1}">
            <span class="card-body">
                <p class="card-text">${item.itemName}<br>
                    <del style="color: red">${item.itemPrice}원</del>=>${item.itemDiscount}원</p>
            </span>
        </span>
    </span>
    </c:forEach>
</div>
<script>
    function detail(itemID){
        location.href="/item/itemDetail?itemId="+itemID;
    }
</script>
</html>
