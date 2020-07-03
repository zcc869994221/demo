package com.bjsxt.test;

import java.util.List;

import org.junit.Test;

import com.bjsxt.bean.Area;
import com.bjsxt.bean.Word;
import com.bjsxt.service.SearchService;
import com.bjsxt.serviceImpl.SearchServiceImpl;

public class TestUser {
	@Test
	public void testSelect() {
		SearchService as = new SearchServiceImpl();
		List<Word> list = as.select("ab");
		for (Word word : list) {
			System.out.println(word);			
		}
	}
}

