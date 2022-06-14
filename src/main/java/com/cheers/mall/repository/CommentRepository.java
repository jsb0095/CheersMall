package com.cheers.mall.repository;

import com.cheers.mall.dto.CommentDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public void commentSave(CommentDTO commentDTO) {
        sql.insert("COMMENT.commentSave",commentDTO);
    }

    public List<CommentDTO> findAll(Long itemId) {
        return sql.selectList("COMMENT.findAll",itemId);
    }

    public void commentDelete(Long commentId) {
        sql.delete("COMMENT.commentDelete",commentId);
    }

    public void commentUpdate(CommentDTO commentDTO) {
        sql.update("COMMENT.commentUpdate",commentDTO);
    }


}
