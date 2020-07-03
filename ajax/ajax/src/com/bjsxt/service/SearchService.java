package com.bjsxt.service;

import java.util.List;

import com.bjsxt.bean.Word;

public interface SearchService {

	List<Word> select(String title);

}
