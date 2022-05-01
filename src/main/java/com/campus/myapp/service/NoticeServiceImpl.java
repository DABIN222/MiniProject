package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.NoticeDAO;
import com.campus.myapp.vo.NoticeVO;
import com.campus.myapp.vo.NoticePagingVO;

@Service
public class NoticeServiceImpl implements NoticeService {
   @Inject
   NoticeDAO dao;
   
   @Override
   public int NoticeInsert(NoticeVO vo) {
      return dao.NoticeInsert(vo);
   }

   @Override
   public List<NoticeVO> NoticeList(NoticePagingVO pVO) {
      return dao.NoticeList(pVO);
   }

   @Override
   public int totalRecord(NoticePagingVO pVO) {
      return dao.totalRecord(pVO);
   }

	@Override
	public NoticeVO NoticeSelect(int no) {
		return dao.NoticeSelect(no);
	}

	@Override
	public void hitCount(int no) {
		dao.hitCount(no);
	}

	@Override
	public int NoticeUpdate(NoticeVO vo) {
		return dao.NoticeUpdate(vo);
	}

	@Override
	public int NoticeDelete(int no, String userid) {
		return dao.NoticeDelete(no, userid);
	}

	@Override
	public int NoticeMultiDelete(NoticeVO vo) {
		return dao.NoticeMultiDelete(vo);
	}

}