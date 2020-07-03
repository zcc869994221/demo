package com.bjsxt.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bjsxt.bean.Word;
import com.bjsxt.dao.SearchMapper;
import com.bjsxt.service.SearchService;
import com.bjsxt.util.MyBatisUtil;

public class SearchServiceImpl implements SearchService {

	@Override
	public List<Word> select(String title) {
		SqlSession session = MyBatisUtil.getSqlsession();
		SearchMapper sd = session.getMapper(SearchMapper.class);
		return sd.select(title+'%');
	}

}
