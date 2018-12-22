package com.project.common.model;

public class AdminCriteria {
	
		// 현재 페이지
		private int page;
		// 한페이지에 보여줄 데이터의 갯수
		private int perPageNum;

		// 기본 값을 셋팅하는 생성자
		public AdminCriteria() {
			this.page = 1; // 1페이지
			this.perPageNum = 10; // 한페이지에 10개의 데이터를 표시한다.
		}

		public int getPage() {
			return page;
		}

		public void setPage(int page) {
			if(page <=0) {
				this.page=1; // 최소 페이지보다 작은 숫자가 들어오면 1로 한다.
				return;
			}
			this.page = page;
		}


		public void setPerPageNum(int perPageNum) {
			// 한 페이지에 보여 줄수 있는 데이터의 개수를 최소 0개부터 최대 100개까지로 설정
			// 범위에 들어 있는 숫자가 아닌 경우는 기본 숫자=10로 셋팅해 준다.
			if(perPageNum<=0 || perPageNum >100 ) {
				this.perPageNum = 10;
				return;
			}
			  this.perPageNum = perPageNum;
		}

		//method for mybatis Sql Mapper
		public int getPageStart(){
			return (this.page -1 ) * perPageNum;
		}
		
		//method for mybatis Sql Mapper
		public int getPerPageNum() {
			return perPageNum;
		}
		
		@Override
		public String toString() {
			return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
		}


}
