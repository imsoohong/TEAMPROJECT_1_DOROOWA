<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
					<div class="popup_panel">
						<div class="popup_bg"></div>
						<div class="popup_contents">
							<div id="container">
								<div class="form-wrap">
									<h1>수강후기</h1>
									<form id="reviewForm" action="${contextPath }/lecture/review"
										method="post">
										<input type="hidden" type="number" id="rating" name="rating" />
										<input type="hidden" name="lecture_title"
											value="${lectureVO.lecture_title }" /> <input type="hidden"
											name="member_id" value="${sessionScope.member.member_id }" />
										<!-- <%-- <input type="hidden" name="lecture_title" value="${sessionScope.lecture.lecture_title }" /> --%> -->
										<div class="star-group">
											<p>별점 선택</p>
											<p id="star_grade">
												<a href="#" class="star">★</a> <a href="#" class="star">★</a>
												<a href="#" class="star">★</a> <a href="#" class="star">★</a>
												<a href="#" class="star">★</a>
											</p>
										</div>
										<div class="form-group">
											<label for="textarea">코멘트</label>
											<textarea name="rcontent" id="textarea" cols="50" rows="8"
												placeholder="최소 3자 이상 최대 400자 이상 입력이 가능합니다."></textarea>
										</div>
										<button type="submit" class="submitBtn">등록</button>
										<button type="cancel" class="btn" aria-label="Close"
											id="btn_popup_close">취소</button>
									</form>
								</div>
							</div>
						</div>
					</div>