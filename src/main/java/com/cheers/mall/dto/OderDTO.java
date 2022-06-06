package com.cheers.mall.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class OderDTO {
   long oderId;
    String memberId;
    Timestamp oderDate;
    String oderName;
    String oderMobile;
    String oderAddress1;
    String oderAddress2;
    String oderAddress3;
    int oderAmount;
    int oderPayment;
    int oderInvoice;
    int oderDelivarry;
}
