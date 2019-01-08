package com.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.project.common.model.Criteria;
import com.project.common.model.PageMaker;
import com.project.dto.QnaReplyDto;
import com.project.service.QnaReplyService;

@RestController
@RequestMapping("/qnareply")
public class QnaReplyController {

	@Inject
	private QnaReplyService qnaReplyService;
	
	//게시물 등록
	@RequestMapping(value="", method= RequestMethod.POST)
	public ResponseEntity<String> write(@RequestBody QnaReplyDto qnaReplyDto) {
		ResponseEntity<String> entity = null;
		try {
			System.out.println("qnareply의 게시물 등록입니다.");
			qnaReplyService.create(qnaReplyDto);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//리스트보기
	@RequestMapping(value = "/all/{qna_no}", method = RequestMethod.GET)
	  public ResponseEntity<List<QnaReplyDto>> list(@PathVariable("qna_no") Integer qna_no) {

	    ResponseEntity<List<QnaReplyDto>> entity = null;
	    try {
	    	System.out.println("qnareply의 게시물 리스트입니다.");
	      entity = new ResponseEntity<>(qnaReplyService.list(qna_no), HttpStatus.OK);

	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	  }
	
	//게시물 수정
	 @RequestMapping(value = "/{rno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	  public ResponseEntity<String> update(@PathVariable("rno") Integer rno, @RequestBody QnaReplyDto qnaReplyDto) {

	    ResponseEntity<String> entity = null;
	    try {
	    	System.out.println("qna_reply의 수정 안입니다.");
	    	qnaReplyDto.setRno(rno);
	    	qnaReplyService.update(qnaReplyDto);
	      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	  }
	
	//게시물 삭제
	 @RequestMapping(value = "/{rno}", method = RequestMethod.DELETE)
	  public ResponseEntity<String> remove(@PathVariable("rno") Integer rno) {

	    ResponseEntity<String> entity = null;
	    try {
	    	System.out.println("qna_reply delete 안입니다.");
	    	qnaReplyService.delete(rno);
	      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	  }
	 
	 //페이징처리된 리스트
	 @RequestMapping(value = "/{qna_no}/{page}", method = RequestMethod.GET)
	  public ResponseEntity<Map<String, Object>> listPage(
	      @PathVariable("qna_no") Integer qna_no,  @PathVariable("page") Integer page) {
		 System.out.println("ReplyContoller.listPage().no:" + qna_no + ",page:" + page);
	    ResponseEntity<Map<String, Object>> entity = null;
	    
	    try {
	    	System.out.println("qna_reply 페이징 처리 안입니다.");
	      Criteria cri = new Criteria();
	      cri.setPage(page);

	      PageMaker pageMaker = new PageMaker();
	      pageMaker.setCri(cri);

	      Map<String, Object> map = new HashMap<String, Object>();
	      List<QnaReplyDto> list = qnaReplyService.listPage(qna_no, cri);

	      map.put("list", list);

	      int replyCount = qnaReplyService.count(qna_no);
	      pageMaker.setTotalCount(replyCount);

	      map.put("pageMaker", pageMaker);

	      entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	  }

	 
}
