package com.cheers.mall.dto;

import lombok.Data;

@Data
public class CartDTO {
    Long cartId;
    Long cheersMemberId;
    Long itemId;
    int cartQTY=1;
    String itemName;
    String itemImageName1;
    int itemDiscount;
}
