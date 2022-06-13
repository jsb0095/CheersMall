<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-06-08
  Time: 오후 4:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>${itemDTO.itemName}</title>
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
            <img style="margin-left: auto" width="300px" height="300px" src="${pageContext.request.contextPath}/upload/${itemDTO.itemImageName1}">
        </span>
    </span>
</div>


    <div style="margin:50px 0; width: 550px; height: 650px;flex: 1;">
     <table>
         <tr style="width: 300px;font-size: 30px;padding-bottom: 20px">
             <td>상품명:</td><td>${itemDTO.itemName}</td>
         </tr>

         <tr style="width: 300px;font-size: 30px;padding-bottom: 20px">
            <td>소비자가격: </td><td style="color: red"><del>${itemDTO.itemPrice}원</del></td>
        </tr>
         <tr></tr>
         <tr style="width: 300px;font-size: 30px;padding-bottom: 20px">
             <td>할인판매가: </td><td><b>${itemDTO.itemDiscount}원</b></td>
         </tr>
         <tr></tr>
         <tr style="width: 300px;font-size: 30px;padding-bottom: 20px">
             <td>재고량: </td><td>${itemDTO.itemStock}개</td>
         </tr>
         <tr></tr>
         <tr style="width: 300px;font-size: 30px;padding-bottom: 20px">
             <td>유통기한: </td><td>${itemDTO.itemExp}</td>
         </tr>
         <tr></tr>
         <tr style="width: 300px;font-size: 30px;padding-bottom: 20px">
             <td>배송비: </td><td>${itemDTO.itemDelivery}원</td>
         </tr>
             <td style="width: 300px;font-size: 30px;padding-bottom: 20px"><button class="btn-outline-light bg-warning" style="color: white"  onclick="itemBuy()">상품구매</button></td>
             <td style="width: 300px;font-size: 30px;padding-bottom: 20px"><button class="btn-outline-light bg-warning"  style="color: white"   onclick="cartAdd()">장바구니추가</button></td>
         <c:if test="${sessionScope.getMemberId eq 'admin'}">
             <td style="width: 300px;font-size: 30px;padding-bottom: 20px"><button class="btn-outline-light bg-warning" style="color: white"   onclick="itemUpdate()">상품수정</button></td>
             <td style="width: 300px;font-size: 30px;padding-bottom: 20px"><button class="btn-outline-light bg-warning" style="color: white"   onclick="itemDelete()">상품삭제</button></td>
         </c:if>
     </table>
    </div>
</div>
<div>
    <img class="container" style="margin-left: 350px; width: 1000px;" src="${pageContext.request.contextPath}/upload/${itemDTO.itemImageName2}">
    <c:if test="${itemDTO.itemImageName3 ne null}">
        <img class="container" style="margin-left: 200px"  src="${pageContext.request.contextPath}/upload/${itemDTO.itemImageName3}">
    </c:if>
        <c:if test="${sessionScope.getId!=null}">
    </div><br><br><br><br>
    <div class="container">
        <div id="comment-writeSave" class="input-group mb-3">
            <input type="text" id="commentWriter" class="form-control" value="${sessionScope.getMemberId}" hidden>
            <input type="text" id="commentContents"  class="form-control" placeholder="내용"><br>
            <button id="comment-write-btn"  class="btn btn-warning" onclick="commentSave()" >댓글작성</button>
        </div>
    </div>
    </c:if>


    <div id="comment-list" class="container" >
        <table class="table">
            <tr>
                <th>작성자</th>
                <th>내용</th>
                <th>작성시간</th>
                <th>댓글수정</th>
                <th>댓글삭제</th>
            </tr>
            <c:forEach items="${commentList}" var="comment">
                <tr>
                    <td>${comment.commentWriter}</td>
                    <td id="contents${comment.commentId}">${comment.commentContents}</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
                                        value="${comment.commentDate}"></fmt:formatDate></td>
                    <td><button onclick="commentUpdate(${comment.commentId})">댓글수정</button></td>
                    <td><button onclick="commentDelete()">댓글삭제</button></td>
                </tr>
            </c:forEach>

</body>
<script>
function commentUpdate(commentId){
location.href="/comment/update?commentId="+commentId;
}

    function itemUpdate(){
        location.href="/item/updateForm?itemId=${itemDTO.itemId}"

    }
    function itemDelete(){
        location.href="/item/itemDelete?itemId=${itemDTO.itemId}"
    }
    function cartAdd(){
        alert("징비구니에 상품이 추가되었습니다.")
        $.ajax({
        type:"post",
            url:"/item/cartDuplicate",
            data:{"itemId":'${itemDTO.itemId}',"cheersMemberId":'${sessionScope.getId}'},
                 dataType:"text",
            success: function (result){
                if(result=="ok"){
                 location.href="/item/cartCount?itemId=${itemDTO.itemId}&itemDiscount=${itemDTO.itemDiscount}&itemName=${itemDTO.itemName}&itemImageName1=${itemDTO.itemImageName1}&cheersMemberId=${sessionScope.getId}"
                }else{
                    location.href="/item/itemCart?itemId=${itemDTO.itemId}&itemDiscount=${itemDTO.itemDiscount}&itemName=${itemDTO.itemName}&itemImageName1=${itemDTO.itemImageName1}&cheersMemberId=${sessionScope.getId}"
                }
            },

        })

    }
    function commentSave(){
    const commentContents =document.getElementById("commentContents").value;
    const itemId='${itemDTO.itemId}';
    const commentWriter =document.getElementById("commentWriter").value;
    $.ajax({
        type:"post",
        url:"/comment/save",
        data:{"commentWriter":commentWriter,"commentContents":commentContents,"itemId":itemId},
        dataType:"json",
        success:function (commentDTOList){
            let output = "<table class='table'>";
            output += "<tr><th>댓글번호</th>";
            output += "<th>작성자</th>";
            output += "<th>내용</th>";
            output += "<th>작성시간</th></tr>";

            for (let i in commentDTOList){
                output += "<tr>";
                output += "<td>" + commentDTOList[i].commentId + "</td>";
                output += "<td>" + commentDTOList[i].commentWriter + "</td>";
                output += "<td>" + commentDTOList[i].commentContents + "</td>";
                output += "<td>" + moment(commentDTOList[i].commentDate).format("YYYY-MM-DD HH:mm:ss") + "</td>";
                output += "</tr>";//moment 순간
            }
            output += "</table>";
            document.getElementById('comment-list').innerHTML = output;
            document.getElementById('commentContents').value = '';//입력받은 내용 입력한값을 공백값으로 바꿔준다
        },
        error: function () {
            console.log("x")
        }
    });
    }
</script>
<style>

</style>
</html>
