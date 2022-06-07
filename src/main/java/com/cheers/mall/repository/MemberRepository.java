package com.cheers.mall.repository;

import com.cheers.mall.dto.MemberDTO;
import com.cheers.mall.dto.OderDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public void save(MemberDTO memberDTO) {
        sql.insert("member.save",memberDTO);

    }

    public MemberDTO login(MemberDTO memberDTO) {
      return sql.selectOne("member.login",memberDTO);
    }

    public MemberDTO duplicateCheck(String memberId) {
      return   sql.selectOne("member.duplicateCheck",memberId);
    }

    public List<OderDTO> myPage(Long cheersMemberId) {
      MemberDTO memberDTO= sql.selectOne("member.myPage",cheersMemberId);
      return sql.selectList("Oder.myPage",memberDTO);
    }

    public MemberDTO findById(Long cheersMemberId) {
       return sql.selectOne("member.findById",cheersMemberId);
    }

    public int update(MemberDTO memberDTO) {
     int updateResult =  sql.update("member.update",memberDTO);
      return   updateResult;
    }

    public void delete(Long cheersMemberId) {
        sql.delete("member.delete",cheersMemberId);
    }

    public List<MemberDTO> userFindAll() {
       return sql.selectList("member.userFindAll");
    }
}
