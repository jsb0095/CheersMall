package com.cheers.mall.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

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
    private MultipartFile itemImageFile;

}
