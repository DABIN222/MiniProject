package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.NoticeVO;
import com.campus.myapp.vo.NoticePagingVO;

public interface NoticeService {
	//글등록
	public int NoticeInsert(NoticeVO vo);
	
	//글목록
	public List<NoticeVO> NoticeList(NoticePagingVO pVO);
	
	//총레코드수
	public int totalRecord(NoticePagingVO pVO);
	
	//글 1개 선택
	public NoticeVO NoticeSelect(int no);
	
	//조회수 증가
	public void hitCount(int no);

	//글수정
	public int NoticeUpdate(NoticeVO vo);
	
	//글삭제
	public int NoticeDelete(int no, String userid);
	
	//여러 레코드 삭제
	public int NoticeMultiDelete(NoticeVO vo);
}
