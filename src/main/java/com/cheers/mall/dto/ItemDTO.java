package com.cheers.mall.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class ItemDTO {
   private Long itemId;
   private String itemName;
   private int itemPrice;
   private int itemDiscount;
   private int itemStock;
   private MultipartFile itemImageFile1;
   private String itemImageName1;
   private MultipartFile itemImageFile2;
   private String itemImageName2;
   private MultipartFile itemImageFile3;
   private String itemImageName3;
   private String itemExp;
   private int itemSell;
   private int itemDelivery;
}
