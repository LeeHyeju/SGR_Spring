package com.project.common.model;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

	private int totalCount; // 전체 데이터의 갯수 ********* // 2번으로 입력한다.-cri먼저
	private int startPage; // 화면 하단 페이지 표시부분의 시작 페이지
	private int endPage; // 화면 하단 페이지 표시부분의 끝 페이지 .
	private boolean prev; // 시작 페이지의 이전 페이지를 계산한다.
	private boolean next; // 끝 페이지의 다음 페이지를 계산한다.

	private int displayPageNum = 10; // 하단 부분에 보여줄 페이지의 갯수

	// 해당 페이지에 해당되는 시작 끝이 들어 있는 객체 *********
	// 1번째으로 입력한다. setter 이용.
	private Criteria cri;

	// 화면에 보여줄 시작 페이지와 끝 페이지 구하기
	private void calcData() {
		// 끝 페이지 구하기
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
		// 시작페이지 구하기
		startPage = (endPage - displayPageNum) + 1;
		// 끝페이지 전체 페이지(totalPage) 보다 크지 못한다.
		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));

		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		// 이전 다음 계산해서 넣는다. setter는 만들지 않는다.
		// 처음 페이지가 1이면 앞에 페이지는 없다.
		prev = startPage == 1 ? false : true;
		// 끝 페이지가 전체페이지와 같으면 뒤에 페이지는 없다.
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}

	// // uri 뒤에 붙여서 넘겨야 하는 데이터 처리 - page를 넘겨 받아서 처리
	public String makeQuery(int page) {

		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance()
		// .path(path) - uri가 계속 달라지므로 jsp에서 처리 : ?k=v&k=v... 가 남는다.
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum()).build();

		return uriComponents.toUriString();
	}
	//페이징 처리에 필요한 데이터를 생성
	 public String makeSearch(int page) {
	 UriComponents uriComponents
	 = UriComponentsBuilder.newInstance()
	 .queryParam("page", page)
	 .queryParam("perPageNum", cri.getPerPageNum())
	 .queryParam("searchType", ((SearchCriteria) cri).getSearchType())
	 .queryParam("keyword", encoding(((SearchCriteria) cri).getKeyword()))
	 .build();
	 return uriComponents.toUriString();
	 }
	 
		private String encoding(String keyword) {

			if (keyword == null || keyword.trim().length() == 0) {
				return "";
			}

			try {
				return URLEncoder.encode(keyword, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				return "";
			}
		}
	 

	// getter & setter
	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		calcData();
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + "]";
	}
}
