<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-06-13
  Time: 오후 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="/resources/js/jquery.js"></script>
    <title>cheers🍺</title>
</head>
<body>
<jsp:include page="../../../resources/layout/header.jsp" flush="false"></jsp:include>
<div class="container" >
    <table class="table">
        <tr>
            <th>상품이미지</th>
            <th>상품명</th>
            <th>Total 판매금액</th>
            <th>Total 할인판매금액</th>
            <th>Total 판매수량</th>
            <th>랭킹 버튼</th>




        </tr>
        <c:forEach items="${rankinList}" var="rank">

            <tr>

                <td><img style="margin: auto" width="100px" height="100px" src="${pageContext.request.contextPath}/upload/${rank.itemImageName1}"></td>
                <td>${rank.itemName}</td>
                <td>${rank.itemPrice*rank.itemSell}원</td>
                <td>${rank.itemDiscount*rank.itemSell}원</td>
                <td>${rank.itemSell}개</td>
                <td><button onclick="goldRank('${rank.itemId}','${rank.itemName}')" type="button"  style="background-color: gold; color: black">Gold</button>
                <button onclick="sliverRank('${rank.itemId}','${rank.itemName}')" type="button"  style="background-color: silver;color: black">Sliver</button>
                <button onclick="bronzeRank('${rank.itemId}','${rank.itemName}')" type="button" style="background-color: saddlebrown; color: black">Bronze</button></td>

            </tr>
        </c:forEach>
        </table>


</div>
</body>
<script>
    function goldRank(itemId,itemName){

        itemName=itemName+"🥇";


        location.href="/item/rank?itemId="+itemId+"&itemName="+itemName;

    }
    function sliverRank(itemId,itemName) {

        itemName = itemName + "🥈";


        location.href = "/item/rank?itemId=" + itemId + "&itemName=" + itemName;

    }
    function bronzeRank(itemId,itemName){

        itemName=itemName+"🥉";


        location.href="/item/rank?itemId="+itemId+"&itemName="+itemName;

    }
</script>
</html>
