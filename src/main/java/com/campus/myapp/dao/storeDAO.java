package com.campus.myapp.dao;

import java.util.List;

import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.storeVO;

public interface storeDAO {
	//글등록
	public int storeInsert(storeVO vo);
	
	//글목록
	public List<storeVO> storeList(PagingVO pvo);
	
	//총레코드수
	public int totalRecord(PagingVO pVO);
	
	//글 1개 선택
	public storeVO storeSelect(int no);
	
	//글수정
	public int storeUpdate(storeVO vo);
	//						수정할 정보가 vo 안에들어가 있음
	
	//글삭제
	public int storeDelete(int no, String userid);
	
	//여러 레코드 삭제
	public int storeMultiDelete(storeVO vo);
}
