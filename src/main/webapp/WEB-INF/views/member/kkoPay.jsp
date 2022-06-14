<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-06-06
  Time: 오후 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script src="../../../resources/js/jquery.js"></script>
</head>
<body>
<script>
    var IMP= window.IMP;
    IMP.init('imp87611393');
    IMP.request_pay({
        pg:"kakaopay",
        pay_method:'card',
        merchant_uid:'merchant_'+new Date().getTime(),
        name:'결제',
        amount: '${cartDTO.itemDiscount}',
        buyer_email:'${memberDTO.memberEmail}',
        buyer_name:'${memberDTO.memberName}',
        buyer_tel:'${memberDTO.memberMobile}',
        buyer_addr:'${memberDTO.memberAddress1}'+'${memberDTO.memberAddress2}'+'${memberDTO.memberAddress3}',
        buyer_postcode:'redirect:/item/userCart?cheersMemberId='+${memberDTO.cheersMemberId},
    }, function (rsp){
        if(rsp.success){
            var msg='결제가 완료되었습니다.';
            alert(msg);
        }else{
            var msg='결제에 실패하였습니다.';
            alert(msg);
        }

    });
</script>
</body>
</html>
