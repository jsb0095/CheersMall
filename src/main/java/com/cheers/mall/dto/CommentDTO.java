package com.cheers.mall.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

@Data
public class CommentDTO {
    private Long commentId;
    private Long oderId;
    private Long itemId;
    private String commentWriter;
    private String commentTitle;
    private String commentContents;
    private MultipartFile commentFile;
    private String commentFileName;
    private Timestamp commentDate;

}
