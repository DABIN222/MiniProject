package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.storeDAO;
import com.campus.myapp.vo.storeVO;
import com.campus.myapp.vo.PagingVO;

@Service
public class storeServiceImpl implements storeService {
   @Inject
   storeDAO dao;
   
   @Override
   public int storeInsert(storeVO vo) {
      return dao.storeInsert(vo);
   }

   @Override
   public List<storeVO> storeList(PagingVO pVO) {
	   return dao.storeList(pVO);
   }

   @Override
   public int totalRecord(PagingVO pVO) {
      return dao.totalRecord(pVO);
   }

	@Override
	public storeVO storeSelect(int no) {
		return dao.storeSelect(no);
	}

	@Override
	public int storeUpdate(storeVO vo) {
		return dao.storeUpdate(vo);
	}

	@Override
	public int storeDelete(int no, String userid) {
		return dao.storeDelete(no, userid);
	}

	@Override
	public int storeMultiDelete(storeVO vo) {
		return dao.storeMultiDelete(vo);
	}

}
