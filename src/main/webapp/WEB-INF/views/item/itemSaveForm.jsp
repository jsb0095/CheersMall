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
    <title>상품입고</title>
</head>
<body>
<jsp:include page="../../../resources/layout/header.jsp" flush="false"></jsp:include>

<div class="position-absolute top-50 start-50 translate-middle d-grid mx-auto">
<form method="post" action="/item/saveResult" enctype="multipart/form-data">
        <input type="text" class="gap-2 form-control" name="itemName" placeholder="상품명"><br>
        <select class="form-control" name="itemCategory">
                <option value="none">카테고리</option>
                <option value="1">BEST</option>
                <option value="2">육류</option>
                <option value="3">야식류</option>
                <option value="4">해산물</option>
                <option value="5">밀키트</option>
        </select>
        <br>
        <input type="text" class="gap-2 form-control" name="itemPrice" placeholder="상품가격"><br>
        <input type="text" class="gap-2 form-control" name="itemDiscount" placeholder="상품할인가"><br>
        <input type="text" class="gap-2 form-control" name="itemStock" placeholder="수량"><br>
        <input type="file" class="gap-2 form-control" name="itemImageFile1" placeholder="상품사진"><br>
        <input type="file" class="gap-2 form-control" name="itemImageFile2" placeholder="상품설명사진"><br>
        <input type="file" class="gap-2 form-control" name="itemImageFile3" placeholder="상품설명사진"><br>
        <input type="text" class="gap-2 form-control" name="itemExp" placeholder="유통기한"><br>
        <input type="text" class="gap-2 form-control" name="itemDelivery" placeholder="배송비"><br>
        <input type="submit" class="d-grid mx-auto btn btn-warning" value="상품등록">
</form>
</div>
</body>
</html>
