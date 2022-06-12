<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-06-09
  Time: 오후 1:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>장바구니 </title>
    <script src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<table class="table">
    <tr>
        <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상품이미지</th>
        <th>상품가격</th>
        <th>상품명</th>
        <th>&nbsp;&nbsp;&nbsp;&nbsp;상품수량</th>
        <th>삭제</th>



    </tr>
    <c:forEach var="cart" items="${cartDTOList}">
    <tr>
        <td><input type="checkbox" value="${cart.cartId}">&nbsp;&nbsp;&nbsp;&nbsp;<img style="margin: auto" width="100px" height="100px" src="${pageContext.request.contextPath}/upload/${cart.itemImageName1}"></td>
        <td>${cart.itemDiscount*cart.cartQTY}원</td>
        <td>${cart.itemName}</td>
        <td><input class="col-1" type="text" value="${cart.cartQTY}" readonly> <input type="button" class="quantity_modify_plus" value="+" onclick="plus(${cart.cartId},${cart.cartQTY})">
            <input type="button" onclick="minus(${cart.cartId},${cart.cartQTY})" class="quantity_modify_minus" value="-"></td>
        <td><input type="button" value="삭제" onclick="cartDrop(${sessionScope.getId},${cart.cartId})"></td>
    </tr>
    </c:forEach>
    </table>
   <button onclick="KKO()">카카오페이</button>
</body>
<script>
    function plus(cartId,cartQTY){
        if (cartQTY<0){
            alert("상품의 수량이 0개입니다")
        }else {
            $.ajax({
            type:"post",
            url:"/item/plus",
            data:{"cartId":cartId},
            success: function (result){
                if(result){
                    location.href="/item/cartList?cheersMemberId=${sessionScope.getId}"
                }else{
                }
            },
        });
        }

    }
    function  minus(cartId,cartQTY){
        if (cartQTY<=0){
            alert("상품의 수량이 0개입니다")
        }else {
        $.ajax({
            type:"post",
            url:"/item/minus",
            data:{"cartId":cartId},
            success: function (result){
                if(result){
                    location.href="/item/cartList?cheersMemberId=${sessionScope.getId}"
                }else{
                }
            },
        });
        }
    }
    function cartDrop(cheerMemberId,cartId){
      const result= confirm("상품을 삭제하시겠습니까?")
        if(result){
            $.ajax({
                type:"post",
                url:"/item/cartItemDrop",
                data:{"cartId":cartId,"cheersMemberId":cheerMemberId},
                success: function (dropResult){
                    if(dropResult){
                        console.log(dropResult);
                        location.href="redirect:/item/cartList?cheersMemberId=${sessionScope.getId}"
                    }
                },
            });
        }
    }
    function KKO (){
        $.ajax({
            type:"post",
            url:"/item/kkoPay",
            date:"cartDTOList:${cartDTOList}",
            dataType:"json",
            success: function (dropResult){
                if(dropResult){


                }else{
                }
            },
        });
    }

</script>
</html>
