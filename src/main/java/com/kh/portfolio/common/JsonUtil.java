package com.kh.portfolio.common;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;

public class JsonUtil {
	
	private static XmlMapper XML_MAPPER = new XmlMapper();
	private static ObjectMapper JSON_MAPPER = new ObjectMapper();
	
	public static XmlMapper getXML_MAPPER() {
		return XML_MAPPER;
	}
	public static ObjectMapper getJSON_MAPPER() {
		return JSON_MAPPER;
	}
	public static String xmlToJson(String xml) {
		String result = "";
		try {
			result = getJSON_MAPPER().writeValueAsString(getXML_MAPPER().readTree(xml));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return result;
	}
	public static String jsonToXml(String json) {
		String result = "";
		try {
			result = getXML_MAPPER().writeValueAsString(getJSON_MAPPER().readTree(json));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return result;
	}
}
