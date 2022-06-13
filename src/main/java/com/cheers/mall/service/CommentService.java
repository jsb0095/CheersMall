package com.cheers.mall.service;


import com.cheers.mall.dto.CommentDTO;
import com.cheers.mall.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class CommentService {
    @Autowired private CommentRepository commentRepository;
    public void commentSave(CommentDTO commentDTO) {
        commentRepository.commentSave(commentDTO);
    }
    public List<CommentDTO> findAll(Long itemId) {
        return   commentRepository.findAll(itemId);
    }

    public void commentDelete(Long commentId) {
        commentRepository.commentDelete(commentId);
    }

    public void commentUpdate(CommentDTO commentDTO) {
        commentRepository.commentUpdate(commentDTO);
    }

    public void simpleBuy(Long itemId) {
        commentRepository.simpleBuy(itemId);
    }
}