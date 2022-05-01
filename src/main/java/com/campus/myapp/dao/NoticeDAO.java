package com.campus.myapp.dao;

import java.util.List;

import com.campus.myapp.vo.NoticeVO;
import com.campus.myapp.vo.NoticePagingVO;

public interface NoticeDAO {
	//글등록
	public int NoticeInsert(NoticeVO vo);
	
	//글목록
	public List<NoticeVO> NoticeList(NoticePagingVO pvo);
	
	//총레코드수
	public int totalRecord(NoticePagingVO pVO);
	
	//글 1개 선택
	public NoticeVO NoticeSelect(int no);
	
	//조회수 증가
	public void hitCount(int no);
	
	//글수정
	public int NoticeUpdate(NoticeVO vo);
	//						수정할 정보가 vo 안에들어가 있음
	
	//글삭제
	public int NoticeDelete(int no, String userid);
	
	//여러 레코드 삭제
	public int NoticeMultiDelete(NoticeVO vo);
}
