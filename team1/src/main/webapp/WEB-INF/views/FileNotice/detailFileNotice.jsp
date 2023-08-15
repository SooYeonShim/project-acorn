<%@ page 
		language="java" 
		contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>	


<link href="/resources/css/fileNotice/detailFileNotice.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.1.0/jquery-migrate.min.js"></script>
<script src="/resources/js/fileNotice/detailFileNotice.js"></script>

<% String result = request.getParameter("result");%>
<%@ include file="../header.jsp" %>
<%@ include file="../chat.jsp" %>

<c:set var="result" value="<%=result%>"></c:set>

<input type="hidden" id="notice_result" value="${result}">

		<div class="add_outList">
			<div class="add_button">
			<!------------------------------등록 취소 버튼------------------------------->
				<form id="form" >
					<!-- 해당 게시글을 찾을 수 있는 키 -->
					<input type="hidden" name = "id"  id= "id" value="${ read.id }">
					
					<!--  버튼 -->
				 <c:if test="${login.job_id eq '1' || login.job_id eq '0' || login.job_id eq '2'}">
					<button class="click_bo" type="button" id="reviseBtn">수정</button>
				</c:if>
					<button class="click_bo" type="button" id="cancelBtn">목록</button>
				<c:if test="${login.job_id eq '1' || login.job_id eq '0' || login.job_id eq '2'}">
					<button class="click_bo" type="button"  id="deleteBtn">삭제</button>
				</c:if>
				
					<!-- 검색 유지를 위한 값들 -->
					<input type="hidden" name="page" id="page"value="${cri.page }">
					<input type="hidden" name="scourse_code" id="scourse_code" value="${cri.scourse_code }">
					<input type="hidden" name="scategorize" id="scategorize" value="${cri.scategorize}">
					<input type="hidden" name="cstate" id="cstate" value="${cri.cstate}">
					<input type="hidden" name="searchType" id="searchType" value="${cri.searchType }">
					<input type="hidden" name="keyword" id="keyword" value="${cri.keyword }">
				</form>	<!-- end form :: action : detailNotice :: method : poast -->
			</div>	 <!-- end div :: class = add_button -->
		</div>	 <!-- end div :: class = add_outList -->

		<!------------------------------게시글 ------------------------------->
		<div class="write_form">
			<p class="list_num"  >글번호: ${read.id }</p>
			<p class="list_num">조회수: ${read.hits }</p>
			<p class="list_date">작성일: <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${read.upload_date }"/></p>
			<p class="list_date">수정일: <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${read.update_date }"/></p>
			
			<table class="boardtable">
			
		<!---------------------------------제 목------------------------------------------------->
				<tr>	<!--subject-->
					<th>제목</th>
					<td colspan="3">${read.subject }</td>
				</tr>		<!-- end tr :: subject-->
				
		<!---------------------------------분 류------------------------------------------------->
				<tr>	<!--categorize-->
					<th>분류</th>
					<td colspan="3">${read.categorize }</td>
				</tr>	<!-- end tr :: categorize-->

		<!---------------------------------반 목록------------------------------------------------->
				<tr>	<!--course_name-->
					<th>반 목록</th>
					<td colspan="3">${read.course_name }</td>
				</tr>		<!-- end tr :: course_name  -->
		
		<!---------------------------------작성자----------------------------------------------->
				<tr>		<!--admin_id-->
					<th>작성자</th>
					<td colspan="3">${read.name }</td>
				</tr>		<!-- end tr :: admin_id-->
	
		</table>	<!--end table :: class=table-->
		
		<!---------------------------------파일 업로드-------------------------------------------->
			<label class="board_label">첨부 파일</label>
			<div id="filebox">
				<table class="file_table">
				
				 	<colgroup>
	                    <col style="width: 80px"/>
	                    <col style="width: 800px"/>
	                    <col style="width: 120px"/>
		            </colgroup>
		            
					<tr>
						<td></td>
						<th class="filebox_td">
							제 목
						</th>
						<th>
							파일 크기
						</th>
					</tr>
					
					<c:forEach var="list" items="${read.files }">
						<tr>
							<td class="fileDiv">
									<input type="hidden" class="file_name" value="${list.name}">
									<img class="file_icon" src="">
							</td>
							<td class="filebox_td">
								<a href="/FileNotice/fileDownload?file_id=${list.id}" >${list.name}</a>
							</td>
							<td class="file_sizeDiv">
								${list.size }
							</td>
						</tr>
					</c:forEach>
					
				</table>
		    </div>

			<!------------------------------textarea----------------------------------------->
			<div class="content">
				<label class="board_label">내용</label>	<!--textarea label-->
				<textarea class="text_area" readonly>${read.context }</textarea>
			</div>	<!--end textarea label :: class = content--> 
		
	</div>	 <!-- end div :: class = write_form -->
		
<%@ include file="../footer.jsp"%>