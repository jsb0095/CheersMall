<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-06-06
  Time: 오후 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script src="../../../resources/js/jquery.js"></script>
</head>
<body>
<script>
    var IMP = window.IMP;
    IMP.init('imp87611393');
    IMP.request_pay({
        pg: "kakaopay",
        pay_method: 'card',
        merchant_uid: 'merchant_' + new Date().getTime(),
        name: '결제',
        amount: '${cartDTO.itemDiscount*cartDTO.cartQTY}',
        buyer_email: '${memberDTO.memberEmail}',
        buyer_name: '${memberDTO.memberName}',
        buyer_tel: '${memberDTO.memberMobile}',
        buyer_addr: '${memberDTO.memberAddress1}',
        buyer_postcode: '${memberDTO.memberAddress2}'
    }, function (rsp) {
        if (rsp.success) {
            const cartId = "${cartDTO.cartId}";
            $.ajax({
                type: "post",
                url: "/item/cartItemDrop",
                async: false,
                data: {"cartId":cartId},
                dataType: "json",
                success: function (dropResult) {
                    if (dropResult) {
                        location.href = "/item/cartList?cheersMemberId=${sessionScope.getId}"
                        var msg = '결제가 완료되었습니다.';
                        alert(msg);
                        alert("구매하신 상품은 자동으로 삭제됩니다!");
                    } else {

                    }
                }
            });
            const sellQTY = "${cartDTO.cartQTY}";
            const sellItem = "${cartDTO.itemId}";
            console.log(sellItem);
            $.ajax({

                type: "post",
                url: "/item/kkoPayCount",
                async: false,
                data: {"sellQTY":sellQTY,"sellItem":sellItem} ,
                dataType: "text",
                success: function (result) {
                    console.log(result)
                    if(result==="yes"){alert("카운트 성공!");
                    }else {
                        alert("실패")
                    }
                }
            });
        }

    });
</script>
</body>
</html>
