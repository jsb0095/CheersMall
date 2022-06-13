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

<div>
        <ul class="pagination justify-content-center">
            <c:choose>
                <c:when test="${paging.page<=1}">
                    <li class="page-item disabled">
                        <a class="page-link" style="color: gray">[이전]</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item link-dark">
                        <a class="page-link link-dark" href="/member/cheersMain?page=${paging.page-1}">[이전]</a>
                    </li>
                </c:otherwise>
            </c:choose>
            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                <c:choose>
                    <c:when test="${i eq paging.page}">
                        <li class="page-item active link-dark">
                            <a class="page-link link-dark" style="border-color: black; background-color:gray" >${i}</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item link-dark">
                            <a class="page-link link-dark" href="/member/cheersMain?page=${i}">${i}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:choose>
                <c:when test="${paging.page>=paging.maxPage}">
                    <li class="page-item disabled">
                        <a class="page-link" style="color: gray">[다음]</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item link-dark">
                        <a class="page-link link-dark" href="/member/cheersMain?page=${paging.page+1}">[다음]</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
</div>
</body>
<script>
    function detail(itemID){
        location.href="/item/itemDetail?itemId="+itemID;
    }
</script>
</html>
