package com.cheers.mall.service;

import com.cheers.mall.dto.CartDTO;
import com.cheers.mall.dto.ItemDTO;
import com.cheers.mall.dto.MemberDTO;
import com.cheers.mall.dto.PageDTO;
import com.cheers.mall.repository.ItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ItemService {
    @Autowired private ItemRepository itemRepository;


    public void itemSave(ItemDTO itemDTO) throws IOException {
        MultipartFile boardFile1 = itemDTO.getItemImageFile1();
        String boardFileName1 = boardFile1.getOriginalFilename();
        boardFileName1 = System.currentTimeMillis() + "-" + boardFileName1;
        String savePath1 = "C:\\spring_img\\" + boardFileName1;

        if (!boardFile1.isEmpty()) {
            itemDTO.setItemImageName1(boardFileName1);
            boardFile1.transferTo(new File(savePath1));
        }
        MultipartFile boardFile2 = itemDTO.getItemImageFile2();
        String boardFileName2 = boardFile2.getOriginalFilename();
        boardFileName2 = System.currentTimeMillis() + "-" + boardFileName2;
        String savePath2 = "C:\\spring_img\\" + boardFileName2;

        if (!boardFile2.isEmpty()) {
            itemDTO.setItemImageName2(boardFileName2);
            boardFile2.transferTo(new File(savePath2));
        }
        MultipartFile boardFile3 = itemDTO.getItemImageFile3();
        String boardFileName3 = boardFile3.getOriginalFilename();
        boardFileName3 = System.currentTimeMillis() + "-" + boardFileName3;
        String savePath3 = "C:\\spring_img\\" + boardFileName3;

        if (!boardFile3.isEmpty()) {
            itemDTO.setItemImageName3(boardFileName3);
            boardFile3.transferTo(new File(savePath3));
        }

        itemRepository.itemSave(itemDTO);
    }



    public List<ItemDTO> search(String q) {
       return itemRepository.search(q);
    }

    public ItemDTO findItemId(Long itemId) {
       return itemRepository.findItemId(itemId);
    }

    public void itemUpdate(ItemDTO itemDTO) throws IOException {
        MultipartFile boardFile1 = itemDTO.getItemImageFile1();
        String boardFileName1 = boardFile1.getOriginalFilename();
        boardFileName1 = System.currentTimeMillis() + "-" + boardFileName1;
        String savePath1 = "C:\\spring_img\\" + boardFileName1;

        if (!boardFile1.isEmpty()) {
            itemDTO.setItemImageName1(boardFileName1);
            boardFile1.transferTo(new File(savePath1));
        }
        MultipartFile boardFile2 = itemDTO.getItemImageFile2();
        String boardFileName2 = boardFile2.getOriginalFilename();
        boardFileName2 = System.currentTimeMillis() + "-" + boardFileName2;
        String savePath2 = "C:\\spring_img\\" + boardFileName2;

        if (!boardFile2.isEmpty()) {
            itemDTO.setItemImageName2(boardFileName2);
            boardFile2.transferTo(new File(savePath2));
        }
        MultipartFile boardFile3 = itemDTO.getItemImageFile3();
        String boardFileName3 = boardFile3.getOriginalFilename();
        boardFileName3 = System.currentTimeMillis() + "-" + boardFileName3;
        String savePath3 = "C:\\spring_img\\" + boardFileName3;

        if (!boardFile3.isEmpty()) {
            itemDTO.setItemImageName3(boardFileName3);
            boardFile3.transferTo(new File(savePath3));
        }

        itemRepository.itemUpdate(itemDTO);
    }

    public void itemDelete(Long itemId) {
        itemRepository.itemDelete(itemId);
    }

    public void saveCart(CartDTO cartDTO) {
        itemRepository.saveCart(cartDTO);
    }

    public List<ItemDTO> cartList() {

       List<ItemDTO> itemDTOList=itemRepository.cartList();
        return itemDTOList;
    }

    public CartDTO itemDuplicate(CartDTO cartDTO) {
      return  itemRepository.itemDuplicate(cartDTO);
    }


    public void cartCount(CartDTO cartDTO) {
        itemRepository.cartCount(cartDTO);
    }

    public List<CartDTO> cartFindList(Long itemId) {
       return itemRepository.cartFindList(itemId);
    }

    public boolean plus(Long cartId) {
      int plusResult = itemRepository.plus(cartId);
      if(plusResult>0){
          return true;
      }else {
          return false;
      }
    }

    public boolean minus(Long cartId) {
        int minusResult = itemRepository.minus(cartId);
        if(minusResult>0){
            return true;
        }else{
            return false;
        }
    }

    public boolean dropItem(CartDTO cartDTO) {
      int dropResult=itemRepository.dropItem(cartDTO);
      if(dropResult==1){
        return true;
      }else {
          return false;
      }
    }

    public List<ItemDTO> itemRankingList() {
      return   itemRepository.itemRankingList();
    }

    public void rankingAdd(ItemDTO itemDTO) {
        itemRepository.rankinAdd(itemDTO);

    }


    public CartDTO findByCartId(Long cartId) {
       return itemRepository.findByCartId(cartId);
    }
    public void simpleBuy(Long itemId) {
        itemRepository.simpleBuy(itemId);
    }

    public String kkoPayCount(CartDTO cartDTO) {
      int countResult =  itemRepository.kkoPayCount(cartDTO);
        if(countResult>0){
            return "yes";
        }else {
            return "no";
        }
    }
    public List<ItemDTO> itemList() {
        return itemRepository.itemList();
    }
    private static final int PAGE_LIMIT=4;
    private static final int BLOCK_LIMIT=4;
    public List<ItemDTO> bestPagingList(int page) {
        int bestPagingStart=(page-1)* PAGE_LIMIT;
        Map<String, Integer> pagingParam= new HashMap<>();
        pagingParam.put("start",bestPagingStart);
        pagingParam.put("limit",PAGE_LIMIT);
        List<ItemDTO> pagingList = itemRepository.bestPagingList(pagingParam);
        return pagingList;

    }

    public PageDTO bestPaging(int page) {
        int bestItemCount = itemRepository.bestItemCount();
        int maxPage=(int) (Math.ceil((double)bestItemCount/PAGE_LIMIT));
        int startPage = (((int) (Math.ceil((double)page/BLOCK_LIMIT)))-1)*BLOCK_LIMIT+1;
        int endPage= startPage + BLOCK_LIMIT-1;
        if(endPage>maxPage){
            endPage=maxPage;
        }
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;

    }
    public List<ItemDTO> meatPagingList(int page) {
        int meatPagingStart=(page-1)* PAGE_LIMIT;
        Map<String, Integer> pagingParam= new HashMap<>();
        pagingParam.put("start",meatPagingStart);
        pagingParam.put("limit",PAGE_LIMIT);
        List<ItemDTO> pagingList = itemRepository.meatPagingList(pagingParam);
        return pagingList;
    }

    public PageDTO meatPaging(int page) {
        int meatItemCount = itemRepository.meatItemCount();
        int maxPage=(int) (Math.ceil((double)meatItemCount/PAGE_LIMIT));
        int startPage = (((int) (Math.ceil((double)page/BLOCK_LIMIT)))-1)*BLOCK_LIMIT+1;
        int endPage= startPage + BLOCK_LIMIT-1;
        if(endPage>maxPage){
            endPage=maxPage;
        }
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;
    }

    public List<ItemDTO> seaFoodPagingList(int page) {
        int seaFoodPagingStart=(page-1)* PAGE_LIMIT;
        Map<String, Integer> pagingParam= new HashMap<>();
        pagingParam.put("start",seaFoodPagingStart);
        pagingParam.put("limit",PAGE_LIMIT);
        List<ItemDTO> pagingList = itemRepository.seaFoodPagingList(pagingParam);
        return pagingList;
    }

    public PageDTO seaFoodPaging(int page) {
        int seaFoodItemCount = itemRepository.seaFoodItemCount();
        int maxPage=(int) (Math.ceil((double)seaFoodItemCount/PAGE_LIMIT));
        int startPage = (((int) (Math.ceil((double)page/BLOCK_LIMIT)))-1)*BLOCK_LIMIT+1;
        int endPage= startPage + BLOCK_LIMIT-1;
        if(endPage>maxPage){
            endPage=maxPage;
        }
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;
    }

    public List<ItemDTO> nightMealPagingList(int page) {
        int nightMealPagingStart=(page-1)* PAGE_LIMIT;
        Map<String, Integer> pagingParam= new HashMap<>();
        pagingParam.put("start",nightMealPagingStart);
        pagingParam.put("limit",PAGE_LIMIT);
        List<ItemDTO> pagingList = itemRepository.nightMealPagingList(pagingParam);
        return pagingList;
    }

    public PageDTO nightMealPaging(int page) {
        int nightItemCount = itemRepository.nightMealItemCount();
        int maxPage=(int) (Math.ceil((double)nightItemCount/PAGE_LIMIT));
        int startPage = (((int) (Math.ceil((double)page/BLOCK_LIMIT)))-1)*BLOCK_LIMIT+1;
        int endPage= startPage + BLOCK_LIMIT-1;
        if(endPage>maxPage){
            endPage=maxPage;
        }
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;
    }

    public List<ItemDTO> mealKitPagingList(int page) {
        int mealKitPagingStart=(page-1)* PAGE_LIMIT;
        Map<String, Integer> pagingParam= new HashMap<>();
        pagingParam.put("start",mealKitPagingStart);
        pagingParam.put("limit",PAGE_LIMIT);
        List<ItemDTO> pagingList = itemRepository.mealKitPagingList(pagingParam);
        return pagingList;
    }

    public PageDTO mealKitPaging(int page) {
        int mealKitItemCount = itemRepository.mealKitItemCount();
        int maxPage=(int) (Math.ceil((double)mealKitItemCount/PAGE_LIMIT));
        int startPage = (((int) (Math.ceil((double)page/BLOCK_LIMIT)))-1)*BLOCK_LIMIT+1;
        int endPage= startPage + BLOCK_LIMIT-1;
        if(endPage>maxPage){
            endPage=maxPage;
        }
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;
    }
}
