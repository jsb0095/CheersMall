<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-06-09
  Time: 오전 8:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>상품수정</title>
</head>
<body>
<jsp:include page="../../../resources/layout/header.jsp" flush="false"></jsp:include>

<div class="position-absolute top-50 start-50 translate-middle d-grid mx-auto">
    <form method="post" action="/item/itemUpdate" enctype="multipart/form-data">
        <input type="text" class="gap-2 form-control" name="itemId" value="${updateItem.itemId}"hidden>
        <input type="text" class="gap-2 form-control" name="itemName" value="${updateItem.itemName}" placeholder="상품명">
        <input type="text" class="gap-2 form-control" name="itemPrice" value="${updateItem.itemPrice}" placeholder="상품가격">
        <input type="text" class="gap-2 form-control" name="itemDiscount" value="${updateItem.itemDiscount}" placeholder="상품할인가">
        <input type="text" class="gap-2 form-control" name="itemStock" value="${updateItem.itemStock}"  placeholder="수량">
        <input type="file" class="gap-2 form-control" name="itemImageFile1"  placeholder="상품사진">
        <input type="file" class="gap-2 form-control" name="itemImageFile2"  placeholder="상품설명사진">
        <input type="file" class="gap-2 form-control" name="itemImageFile3"  placeholder="상품설명사진">

        <input type="text" class="gap-2 form-control" name="itemExp" value="${updateItem.itemExp}" placeholder="유통기한">

        <input type="text" class="gap-2 form-control" name="itemDelivery" value="${updateItem.itemDelivery}" placeholder="배송비">
        <input type="submit" class="d-grid mx-auto" value="상품수정">
    </form>
</div>
</body>
</html>
