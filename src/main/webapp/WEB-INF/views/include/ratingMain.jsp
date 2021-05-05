<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
									<c:choose>
										<c:when test="${rec.rating>=4.5}">
											<li><i class="fas fa-star"></i><i class="fas fa-star"></i><i
												class="fas fa-star"></i><i class="fas fa-star"></i><i
												class="fas fa-star"></i></li>
										</c:when>
										<c:when test="${rec.rating<4.5 && rec.rating>=3.5}">
											<li><i class="fas fa-star"></i><i class="fas fa-star"></i><i
												class="fas fa-star"></i><i class="fas fa-star"></i></li>
										</c:when>
										<c:when test="${rec.rating<3.5 && rec.rating>=2.5}">
											<li><i class="fas fa-star"></i><i class="fas fa-star"></i><i
												class="fas fa-star"></i></li>
										</c:when>
										<c:when test="${rec.rating<2.5 && rec.rating>=1.5}">
											<li><i class="fas fa-star"></i><i class="fas fa-star"></i></li>
										</c:when>
										<c:when test="${rec.rating<1.5 &&rec.rating>=0.5}">
											<li><i class="fas fa-star"></i></li>
										</c:when>

									</c:choose>
					
					