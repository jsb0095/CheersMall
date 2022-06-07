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
    <style>
        .a2{
            display: flex;
            width: 1100px;
            margin: auto;
        }
        .card{
            flex: 1;
            width: 275px;
            height: 325px;
        }

        .card img{
            width: 275px;
            height: 275px;
        }
        .card-text{
            width: 140px;

        }
    </style>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="/resources/js/jquery.js"></script>
    <title>cheers🍺</title>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
회원아이디:${sessionScope.getMemberId}<br>
회원번호:${sessionScope.getId}<br>

    <div class="a2">
        <div class="card" style="width: 18rem;">
            <img src="../../../resources/jpg/닭발.jpg" class="card-img-top" alt="...">
            <div class="card-body">
                <p class="card-text">숯불에 직접구운 불향가득 불닭발
                가격:9900원</p>
            </div>
        </div>
    </div>
<%--        <div class="card" style="width: 18rem;">--%>
<%--            <img src="../../../resources/jpg/떡볶이.jpg" class="card-img-top" alt="...">--%>
<%--            <div class="card-body">--%>
<%--                <p class="card-text">학교 앞 추억의  매콤 달콤 떡볶이--%>
<%--                    가격:3900원</p>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="card" style="width: 18rem;">--%>
<%--            <img src="../../../resources/jpg/목살.jpg" class="card-img-top" alt="...">--%>
<%--            <div class="card-body">--%>
<%--                <p class="card-text">제주도 흑돼지 목살 500g--%>
<%--                    가격:15000원</p>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="card" style="width: 18rem;">--%>
<%--            <img src="../../../resources/jpg/순대.jpg" class="card-img-top" alt="...">--%>
<%--            <div class="card-body">--%>
<%--                <p class="card-text">전주에서 유명한 피순대--%>
<%--                    가격:6900원</p>--%>
<%--            </div>--%>
<%--        </div>--%>






<%--<a href="/member/myPage?cheersMemberId=${sessionScope.getId}"><input type="image" src="/resources/jpg/myPageIcon.jpg"width="100" height=100"></a><br>--%>
<%--<a href="/member/kkoPay">결제하기</a>--%>
</body>

</html>
