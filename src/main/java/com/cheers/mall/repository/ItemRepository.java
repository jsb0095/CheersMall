package com.cheers.mall.repository;

import com.cheers.mall.dto.CartDTO;
import com.cheers.mall.dto.ItemDTO;
import com.cheers.mall.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
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



    public List<ItemDTO> search(String q) {
     return    sql.selectList("Item.search",q);
    }

    public ItemDTO findItemId(Long itemId) {
       return sql.selectOne("Item.findItemId",itemId);
    }

    public void itemUpdate(ItemDTO itemDTO) {
        sql.update("Item.itemUpdate",itemDTO);
    }

    public void itemDelete(Long itemId) {
        sql.delete("Item.itemDelete",itemId);
    }

    public void saveCart(CartDTO cartDTO) {

        sql.insert("Item.saveCart",cartDTO);

    }

    public List<ItemDTO> cartList() {

        return  sql.selectList("Item.cartList");


    }

    public CartDTO  itemDuplicate(CartDTO cartDTO) {
       return sql.selectOne("Item.itemDuplicate",cartDTO);
    }

    public void cartCount(CartDTO cartDTO) {
        sql.update("Item.cartCount",cartDTO);
    }

    public List<CartDTO> cartFindList(Long itemId) {
      return   sql.selectList("Item.cartFindList",itemId);
    }

    public int plus(Long cartId) {
        return sql.update("Item.plus",cartId);
    }

    public int minus(Long cartId) { return sql.update("Item.minus",cartId);
    }

    public int dropItem(CartDTO cartDTO) {

        int dropResult = sql.delete("Item.dropItem",cartDTO);
        return dropResult;
    }

    public List<ItemDTO> itemRankingList() {
      return   sql.selectList("Item.itemRankingList");
    }

    public void rankinAdd(ItemDTO itemDTO) {

        sql.update("Item.rankingAdd",itemDTO);
    }


    public CartDTO findByCartId(Long cartId) {
      return   sql.selectOne("Item.findByCartId",cartId);
    }
    public void simpleBuy(Long itemId) {
        sql.update("Item.simpleBuy",itemId);
    }

    public int kkoPayCount(CartDTO cartDTO) {
      return   sql.update("Item.kkoPayCount",cartDTO);
    }

    public List<ItemDTO> bestPagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Item.bestPagingList",pagingParam);
    }

    public int bestItemCount() {
        return sql.selectOne("Item.bestCount");
    }
    public List<ItemDTO> meatPagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Item.meatPagingList",pagingParam);
    }

    public int meatItemCount() {
        return sql.selectOne("Item.meatItemCount");
    }

    public List<ItemDTO> seaFoodPagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Item.seaFoodPagingList",pagingParam);
    }

    public int seaFoodItemCount() {
        return sql.selectOne("Item.seaFoodItemCount");
    }

    public List<ItemDTO> nightMealPagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Item.nightMealPagingList",pagingParam);
    }

    public int nightMealItemCount() {
        return sql.selectOne("Item.nightMealItemCount");
    }

    public List<ItemDTO> mealKitPagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Item.mealKitPagingList",pagingParam);
    }

    public int mealKitItemCount() {
        return sql.selectOne("Item.mealKitItemCount");
    }
}
