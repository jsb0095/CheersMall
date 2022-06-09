<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-06-08
  Time: 오후 4:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${itemDTO.itemName}상세페이지</title>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="/resources/js/jquery.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div style="display: flex; margin: auto" >
<div style="margin-left:220px; width: 550px; height: 650px; flex:1">
    <span class="a2" style="margin-left: 150px; text-align: center">
        <span class="card" style="margin-top: 50px ;float:left; width: 275px; height: 350px">
            <img style="margin: auto" width="500px" height="500px" src="${pageContext.request.contextPath}/upload/${itemDTO.itemImageName1}">
        </span>
    </span>
</div>
    <div style="margin:50px 0; width: 550px; height: 650px;flex: 1;">
     <table>
         <tr>
             <td>상품명: </td><td>${itemDTO.itemName}</td>
         </tr>

         <tr>
            <td>소비자가격: </td><td style="color: red"><del>${itemDTO.itemPrice}원</del></td>
        </tr>
         <tr></tr>
         <tr>
             <td>할인판매가: </td><td><b>${itemDTO.itemDiscount}원</b></td>
         </tr>
         <tr></tr>
         <tr>
             <td>재고량: </td><td>${itemDTO.itemStock}개</td>
         </tr>
         <tr></tr>
         <tr>
             <td>유통기한: </td><td>${itemDTO.itemExp}</td>
         </tr>
         <tr></tr>
         <tr>
             <td>배송비: </td><td>${itemDTO.itemDelivery}원</td>
         </tr>
             <td><button class="btn-outline-light bg-warning" style="color: white"  onclick="itemBuy()">상품구매</button></td>
             <td><button class="btn-outline-light bg-warning"  style="color: white"   onclick="cartAdd()">장바구니추가</button></td>
         <c:if test="${sessionScope.getMemberId eq 'admin'}">
             <td><button class="btn-outline-light bg-warning" style="color: white"   onclick="itemUpdate()">상품수정</button></td>
             <td><button class="btn-outline-light bg-warning" style="color: white"   onclick="itemDelete()">상품삭제</button></td>
         </c:if>
     </table>
    </div>
</div>
<div>
    <img class="container" style="margin-left: 200px" src="${pageContext.request.contextPath}/upload/${itemDTO.itemImageName2}">
    <c:if test="${itemDTO.itemImageName3 ne null}">
        <img class="container" style="margin-left: 200px"  src="${pageContext.request.contextPath}/upload/${itemDTO.itemImageName3}">
    </c:if>
</div>
</body>
<script>
    function itemUpdate(){
        location.href="/item/updateForm?itemId=${itemDTO.itemId}"

    }
    function itemDelete(){
        location.href="/item/itemDelete?itemId=${itemDTO.itemId}"
    }
    function cartAdd(){
        $.ajax({
        type:"post",
            url:"/item/cartDuplicate",
            data:{"itemId":'${itemDTO.itemId}',"cheersMemberId":'${sessionScope.getId}'},
                 dataType:"text",
            success: function (result){
                if(result=="ok"){
                 location.href="/item/cartCount?itemId=${itemDTO.itemId}&cheersMemberId=${sessionScope.getId}"
                }else{
                    location.href="/item/itemCart?itemId=${itemDTO.itemId}&cheersMemberId=${sessionScope.getId}"
                }
            },

        })

    }
</script>
<style>

    td{
        width: 300px;
        font-size: 30px;
        padding-bottom: 20px;
    }
</style>
</html>
