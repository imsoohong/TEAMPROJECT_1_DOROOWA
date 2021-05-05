package com.kh.portfolio.orders.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.portfolio.orders.svc.OrdersSVC;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

//ajax의 Json과 Jsp의 Model의 요청 데이터를 같이 처리하는 Controller, ajax 사용시에는 클래스 개별로 @ResponseBody를 이용해서 처리할 것
//Controller 클래스에 @ResponseBody 선언 금지 또는 @RestController로 교체 금지

@Controller
@RequestMapping("/order")
@Slf4j
@RequiredArgsConstructor
public class OrdersController {
	
	private final OrdersSVC ordersSVC;
	
	/**
	 * 강의 주문
	 * @param list
	 * @param session
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="/order", 
							 consumes = "application/json", 
							 produces = "application/json")
	public ResponseEntity<Map<String,String>> order(@RequestBody List<String> list, HttpSession session) {
		
		ResponseEntity<Map<String,String>> result = null;

		String resultMessage = ordersSVC.orders(list,session);
		
		Map<String,String> map = new HashMap<>();
		
		map.put("resultMessage",resultMessage);
		
		result = new ResponseEntity<Map<String,String>>(map,HttpStatus.OK);
		
//		MemberVO memberVO = (MemberVO)session.getAttribute("member");
//		List<OrdersVO> orders = new ArrayList<>();
//		log.info(memberVO.getMember_id());		
//		for(int i = 0; i < list.size(); i++) {
//			OrdersVO ordersVO = new OrdersVO();
//			 ordersVO.setLecture_title(list.get(i));
//			 ordersVO.setMember_id(memberVO.getMember_id());
//			 orders.add(ordersVO);
//			 log.info("ordersVO: "+ ordersVO);
//		}	
//		ordersSVC.orders(orders);
		
//		if (result == true) {
//			url = "/order/complate";
//		}else {
//			url = "/order/failed";
//		}
		
		return result;
	}

}
