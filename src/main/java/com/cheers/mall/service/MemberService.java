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
        System.out.println(loginResult);
      if(loginResult!=null){

      } return loginResult;
    }

    public String duplicateCheck(String memberId) {
       MemberDTO memberDTO= memberRepository.duplicateCheck(memberId);
        System.out.println("memberDTO = " + memberDTO);
       if(memberDTO!=null)
       {
           return "no";
       }else {
           return "yes";
       }

    }

    public List<OderDTO> findById(Long cheersMemberId) {
     List<OderDTO> oderDTOList=  memberRepository.findById(cheersMemberId);
        return oderDTOList;
    }
}
