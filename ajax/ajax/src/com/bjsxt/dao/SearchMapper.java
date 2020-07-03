package com.bjsxt.dao;

import java.util.List;

import com.bjsxt.bean.Word;

public interface SearchMapper {

	List<Word> select(String title);

}
