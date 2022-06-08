<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-06-07
  Time: 오후 4:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<div class="position-absolute top-50 start-50 translate-middle d-grid mx-auto">
<form method="post" action="/item/saveResult" enctype="multipart/form-data">
        <input type="text" class="gap-2 form-control" name="itemName" placeholder="상품명">
        <input type="text" class="gap-2 form-control" name="itemPrice" placeholder="상품가격">
        <input type="text" class="gap-2 form-control" name="itemDiscount" placeholder="상품할인가">
        <input type="text" class="gap-2 form-control" name="itemStock" placeholder="수량">
        <input type="file" class="gap-2 form-control" name="itemImageFile1" placeholder="상품사진">
        <input type="file" class="gap-2 form-control" name="itemImageFile2" placeholder="상품설명사진">
        <input type="file" class="gap-2 form-control" name="itemImageFile3" placeholder="상품설명사진">
        <input type="text" class="gap-2 form-control" name="itemExp" placeholder="유통기한">
        <input type="text" class="gap-2 form-control" name="itemDelivery" placeholder="배송비">
        <input type="submit" class="d-grid mx-auto" value="상품등록">
</form>
</div>
</body>
</html>
