<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:choose>
						<c:when test="${lectureVO.rating>=4.5}">
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
						</c:when>
						<c:when test="${lectureVO.rating<4.5 && lectureVO.rating>=3.5}">
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
						</c:when>
						<c:when test="${lectureVO.rating<3.5 && lectureVO.rating>=2.5}">
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
						</c:when>
						<c:when test="${lectureVO.rating<2.5 && lectureVO.rating>=1.5}">
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
						</c:when>
						<c:when test="${lectureVO.rating<1.5 &&lectureVO.rating>=0.5}">
							<i class="fas fa-star"></i>
						</c:when>
					</c:choose>
					
					