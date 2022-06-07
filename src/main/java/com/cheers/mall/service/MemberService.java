package com.cheers.mall.service;

import com.cheers.mall.dto.MemberDTO;
import com.cheers.mall.dto.OderDTO;
import com.cheers.mall.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {
    @Autowired private MemberRepository memberRepository;
    public void save(MemberDTO memberDTO) {
        memberRepository.save(memberDTO);
    }

    public MemberDTO login(MemberDTO memberDTO) {
      MemberDTO loginResult=  memberRepository.login(memberDTO);

      if(loginResult!=null){

      } return loginResult;
    }

    public String duplicateCheck(String memberId) {
       MemberDTO memberDTO= memberRepository.duplicateCheck(memberId);

       if(memberDTO!=null)
       {
           return "no";
       }else {
           return "yes";
       }

    }

    public List<OderDTO> myPage(Long cheersMemberId) {
     List<OderDTO> oderDTOList=  memberRepository.myPage(cheersMemberId);
        return oderDTOList;
    }

    public MemberDTO findById(Long cheersMemberId) {
      return   memberRepository.findById(cheersMemberId);
    }

    public boolean update(MemberDTO memberDTO) {
        int updateResult =memberRepository.update(memberDTO);
        if(updateResult>0){
            return true;

        }else {
            return false;
        }
    }

    public void delete(Long cheersMemberId) {
        memberRepository.delete(cheersMemberId);
    }
}
