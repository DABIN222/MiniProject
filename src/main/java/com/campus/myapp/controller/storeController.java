package com.campus.myapp.controller;

import java.nio.charset.Charset;
import java.util.List;

import javax.inject.Inject;
import javax.security.auth.Subject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.BoardService;
import com.campus.myapp.service.storeService;
import com.campus.myapp.vo.BoardVO;
import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.storeVO;

@RestController // @Controller + @ResponseBody 합친것
@RequestMapping(value="/store/", method= {RequestMethod.GET, RequestMethod.POST})
public class storeController {
	@Inject
	storeService service;

	// 글목록
	@GetMapping("storeList")
	public ModelAndView storeList(PagingVO pVO) {
		ModelAndView mav = new ModelAndView();

		// 총 레코드 수
		pVO.setTotalRecord(service.totalRecord(pVO));

		// db처리
		mav.addObject("list", service.storeList(pVO));
		mav.addObject("pVO", pVO);
		mav.setViewName("store/storeList"); // WEB-INF/views/board/boardList.jsp
		return mav;
	}

	// 글등록 폼
	@GetMapping("storeWrite")
	public ModelAndView name() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("store/storeWrite");
		return mav;
	}

	// 글등록
	@PostMapping("storeWriteOk")
	public ResponseEntity<String> storeWriteOk(storeVO vo, HttpServletRequest request) {
		// 글쓴이-session로그인 아이디를 구한다.
		vo.setUserid((String)request.getSession().getAttribute("logId"));
		// DB작업
		ResponseEntity<String> entity = null; // 데이터와 처리상태를 가진다.

		HttpHeaders headers = new HttpHeaders();

		headers.add("Content-Type", "text/html; charset=utf-8");
//        headers.setContentType(new MediaType("text", "html", Charset.forName("utf-8")));
		try {
			service.storeInsert(vo);
			String msg = "<script>";
			msg += "alert('글이 등록되었습니다');";
			msg += "location.href='/myapp/store/storeList';";
			msg += "</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();

			// 등록안됨
			String msg = "<script>";
			msg += "alert('글등록이 실패하였습니다');";
			msg += "history.back();";
			msg += "</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 4. 글 내용 보기
	@GetMapping("storeView")
	public ModelAndView storeView(int no) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("vo", service.storeSelect(no));
		mav.setViewName("store/storeView");

		return mav;
	}

	// 글수정 폼
	@GetMapping("storeEdit")
	public ModelAndView storeEdit(int no) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("vo", service.storeSelect(no));
		mav.setViewName("store/storeEdit");

		return mav;
	}

	// 글수정 (DB)
	@PostMapping("storeEditOk")
	public ResponseEntity<String> storeEditOk(storeVO vo, HttpSession session) {
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("utf-8")));

		vo.setUserid((String) session.getAttribute("logId"));

		try {
			int result = service.storeUpdate(vo);
			if (result > 0) {// 수정 성공
				entity = new ResponseEntity<String>(getEditSuccessMessage(vo.getNo()), headers, HttpStatus.OK);
			} else {// 수정 못함
				entity = new ResponseEntity<String>(getEditFailMessage(), headers, HttpStatus.BAD_REQUEST);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// 수정 실패
			entity = new ResponseEntity<String>(getEditFailMessage(), headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 글 삭제
	@GetMapping("storeDel")
	public ModelAndView storeDel(int no, HttpSession session) {
		String userid = (String)session.getAttribute("logId");
		
		int result = service.storeDelete(no, userid);
		
		ModelAndView mav = new ModelAndView();
		if(result>0) {	//삭제
			mav.setViewName("redirect:storeList");	// list로 이동한 컨트롤러를 호출
		}else {	//삭제실패
			mav.addObject("no", no);
			mav.setViewName("redirect:storeView");
		}
		return mav;
	}
	
	// 글 수정 메소드
	public String getEditFailMessage() {
		String msg = "<script>";
		msg += "alert('글수정 실패하였습니다.\\n수정폼으로 이동합니다.');";
		msg += "history.back();";
		msg += "</script>";
		return msg;
	}

	// 글 수정 메소드
	public String getEditSuccessMessage(int no) {
		String msg = "<script>";
		msg += "alert('글 수정이 완료되였습니다.\\n글 내용으로 이동합니다.');";
		msg += "location.href='/myapp/store/storeView?no=" + no + "';";
		msg += "</script>";
		return msg;
	}
	
	// 여러개 레코드 삭제
	@PostMapping("multiDel")
	public ModelAndView storemultiDelete(storeVO vo, HttpSession session) {
		vo.setUserid((String)session.getAttribute("logId"));
		
		ModelAndView mav = new ModelAndView();
		
		service.storeMultiDelete(vo);
		
		mav.setViewName("redirect:storeList");
		return mav;
		
	}
}