package com.project.common.model;

public class SearchCriteria extends Criteria {

	private String searchType; // 검색의 항목 저장
	private String keyword; // 검색 데이터 저장

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	// 제목으로 검색
	public boolean isTitleType() { // boolean type은 메서드 앞에 is 붙여준다.
		if (searchType.indexOf("t") < 0)
			return false; // 없는 경우
		// 글자 중에 t가 포함된 게 1보다 큰 경우(존재하는 경우)를 확인
		else
			return true; // 있는 경우
	}

	// 내용으로 검색
	public boolean isContentType() {
		if (searchType.indexOf("c") < 0)
			return false; // 없는 경우
		else
			return true; // 있는 경우
	}

	// 작성자로 검색
	public boolean isWriterType() {
		if (searchType.indexOf("w") < 0)
			return false; // 없는 경우
		else
			return true; // 있는 경우
	}

	// 작성자(id)로 검색
	public boolean isIdType() {
		if (searchType.indexOf("i") < 0)
			return false; // 없는 경우
		else
			return true; // 있는 경우
	}

	// 상품이름 검색
	public boolean isTitle() {
		if (searchType.indexOf("g") < 0)
			return false; // 없는 경우
		else
			return true; // 있는 경우
	}

	//관리자
	//이름으로 검색
		public boolean isNameType() {
			if(searchType.indexOf("n")<0) return false; // 없는 경우
			else return true; // 있는 경우
		}
		//성별로 검색
		public boolean isSexType() {
			if(searchType.indexOf("s")<0) return false; // 없는 경우
			else return true; // 있는 경우
		}
		//등급으로 검색
		public boolean isTypeType() {
			if(searchType.indexOf("g")<0) return false; // 없는 경우
			else return true; // 있는 경우
		}
	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + "]+," + super.toString();
	}

}
