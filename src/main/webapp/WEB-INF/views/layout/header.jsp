<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-05-23
  Time: 오후 3:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="/resources/css/headers.css"></script>
<style>
    button{
        text-align: center;
    }
    image{
        display: block;
        vertical-align:bottom
    }
</style>
</head>
<body>
<header class="p-3 bg-white text-white" >
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/member/cheersMain" class="d-flex align-items-center mb-2 mb-lg-0  text-decoration-none"><input type="image" style="display: block  ;vertical-align:bottom" src="/resources/jpg/logo4.jpg" width="300" height=70">
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <c:if test="${sessionScope.getId eq null}">
                <li><a href="/member/saveForm" class="nav-link px-2 text-black">회원가입</a></li>
                </c:if>
                <c:if test="${sessionScope.getId ne null}">
                <li><a href="/member/myPage?cheersMemberId=${sessionScope.getId}" class="nav-link px-2 text-black">마이페이지</a></li>
                </c:if>
                <c:if test="${sessionScope.getId ne null}">
                <li><a href="/member/updateForm?cheersMemberId=${sessionScope.getId}" class="nav-link px-2 text-black">회원정보수정</a></li>
                </c:if>
                <c:if test="${sessionScope.getId ne null}">
                <li><a href="member/cart" class="nav-link px-2 text-black">장바구니</a></li>
                </c:if>
            </ul>
            <div class="text-end">
                <c:if test="${sessionScope.getId eq null}">
                    <button type="button" class="btn btn-outline-dark me-2" onclick="loginForm()">로그인</button>
                </c:if>
                <c:if test="${sessionScope.getId ne null}">
                    <button type="button"  class="btn btn-outline-dark" onclick="logout()">로그아웃</button>
                </c:if>

            </div>
            <form class="container input-group" method="post" action="/item/search">
               <input type="search" class="form-control form-control-dark btn-outline-dark text-dark bg-white" placeholder="Search..." aria-label="Search">
                <input type="button" name="q" class="btn-outline-dark btn" value="검색">
            </form>


        </div>
    </div>
</header>


</body>
<script>
    function logout(){
        location.href="/member/logout"
                }

function loginForm(){
    location.href="/member/loginForm"
}
</script>
</html>
