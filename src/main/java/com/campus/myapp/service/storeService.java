package com.campus.myapp.service;

import java.util.List;
import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.storeVO;

public interface storeService {
	//글등록
	public int storeInsert(storeVO vo);
	
	//글목록
	public List<storeVO> storeList(PagingVO pVO);
	
	//총레코드수
	public int totalRecord(PagingVO pVO);
	
	//글 1개 선택
	public storeVO storeSelect(int no);
	
	//글수정
	public int storeUpdate(storeVO vo);
	
	//글삭제
	public int storeDelete(int no, String userid);
	
	//여러 레코드 삭제
	public int storeMultiDelete(storeVO vo);
}
