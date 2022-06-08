package com.cheers.mall.repository;

import com.cheers.mall.dto.ItemDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ItemRepository {
    @Autowired private SqlSessionTemplate sql;


    public void itemSave(ItemDTO itemDTO) {
        sql.insert("Item.itemSave",itemDTO);
    }

    public List<ItemDTO> itemList() {
      return   sql.selectList("Item.itemList");
    }

    public List<ItemDTO> pagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Item.pagingList",pagingParam);
    }

    public int boardCount() {
        return sql.selectOne("Item.count");
    }

    public List<ItemDTO> search(String q) {
     return    sql.selectList("Item.search",q);
    }

    public ItemDTO findItemId(Long findId) {
       return sql.selectOne("Item.findItemId",findId);
    }
}
