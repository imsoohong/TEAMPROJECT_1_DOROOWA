<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
						<div class="list-group">
							<c:forEach var="chapter" items="${chapterList }">
								<div class="accordion accordion-flush"
									id="accordionFlushExample">
									<div class="accordion-item">
										<h2 class="accordion-header"
											id="flush-heading${chapter.chapter_id }">
											<button class="accordion-button  collapse show" type="button"
												data-bs-toggle="collapse"
												data-bs-target="#flush-collapse${chapter.chapter_id }"
												aria-expanded="false"
												aria-controls="flush-collapse${chapter.chapter_id }">
												${chapter.chapter_title }</button>
										</h2>
										<div id="flush-collapse${chapter.chapter_id }"
											class="accordion-collapse collapse"
											aria-labelledby="flush-heading${chapter.chapter_id }"
											data-bs-parent="#accordionFlushExample">
											<div class="accordion-body">
												<c:forEach var="curriculum" items="${curriculum }">
													<c:if test="${chapter.chapter_id == curriculum.chapter_id}">

														<a
															href="${contextPath }/teacher/studio/${chapter.lecture_title}/vid/${curriculum.video_id}"
															class="curriculum__text">
															<div>
																<i class="far fa-play-circle"></i> ${curriculum.title }
															</div>
														</a>
														<hr />
													</c:if>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>