package com.cheers.mall.dto;

import lombok.Data;

@Data
public class MemberDTO {
    private Long cheersMemberId;
    private String memberId;
    private String memberPassword;
    private String memberName;
    private String memberBirthDay;
    private String memberEmail;
    private String memberMobile;
    private String memberAddress1;
    private String memberAddress2;
    private String memberAddress3;
    int memberBuy;

}
