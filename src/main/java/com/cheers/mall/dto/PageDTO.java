package com.cheers.mall.dto;

import lombok.Data;

@Data
public class PageDTO {
    private  int page;
    private  int maxPage;
    private  int startPage;
    private  int endPage;

}
