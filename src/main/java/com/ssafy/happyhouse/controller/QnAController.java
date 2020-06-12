package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.dto.Member;
import com.ssafy.happyhouse.dto.QnA;
import com.ssafy.happyhouse.service.QnAService;

import io.swagger.annotations.ApiOperation;

//http://localhost:9000/happyhouse/swagger-ui.html
@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/api/qna")
public class QnAController {

	private static final Logger logger = LoggerFactory.getLogger(QnAController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";

	@Autowired
	private QnAService qnaService;
	
    @ApiOperation(value = "모든 QnA 정보를 반환한다.", response = List.class)
	@GetMapping
	public ResponseEntity<List<QnA>> retrieveBoard() throws Exception {
		logger.debug("retrieveQnA - 호출");
		return new ResponseEntity<List<QnA>>(qnaService.retrieveQnA(), HttpStatus.OK);
	}
    @ApiOperation(value="로그인 정보 반환 ", response=List.class)
    @GetMapping("userinfo")
    public ResponseEntity<Member> returnUserinfo(HttpSession session) throws Exception{
    	logger.debug("returnUserInfo - 호출");
    	return new ResponseEntity<Member>((Member)session.getAttribute("userinfo"),HttpStatus.OK);
    }
    @ApiOperation(value = "글번호에 해당하는 QnA 정보를 반환한다.", response = QnA.class)    
	@GetMapping("{qnaNo}")
	public ResponseEntity<QnA> selectQnAByNo(@PathVariable int qnaNo) {
		logger.debug("selectQnA - 호출");
		return new ResponseEntity<QnA>(qnaService.selectQnAByNo(qnaNo), HttpStatus.OK);
	}

    @ApiOperation(value = "새로운  QnA 정보를 입력한다. 그리고 DB입력 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@PostMapping
	public ResponseEntity<String> insertQnA(@RequestBody QnA qna,HttpSession session) {
		logger.debug("insertQnA - 호출");
		Member member = (Member) session.getAttribute("userinfo");
		qna.setQna_userid(member.getUserid());
		if (qnaService.insertQnA(qna)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

    @ApiOperation(value = "글번호에 해당하는 QnA 정보를 수정한다. 그리고 DB수정 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@PutMapping("{qnaNo}")
	public ResponseEntity<String> updateQnA(@RequestBody QnA qna) {
		logger.debug("updateQnA - 호출");
		logger.debug("" + qna);
//		System.out.println(qna.toString());
//		System.out.println("----------------------");
//		System.out.println(qnaService.updateQnA(qna));
		if (qnaService.updateQnA(qna)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

    @ApiOperation(value = "글번호에 해당하는 QnA 정보를 삭제한다. 그리고 DB삭제 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@DeleteMapping("{qnaNo}")
	public ResponseEntity<String> deleteQnA(@PathVariable int qnaNo) {
		logger.debug("deleteQnA - 호출");
		if (qnaService.deleteQnA(qnaNo)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
}