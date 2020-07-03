package com.bjsxt.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bjsxt.bean.Area;
import com.bjsxt.dao.AreaMapper;
import com.bjsxt.service.AreaService;
import com.bjsxt.util.MyBatisUtil;

public class AreaServiceImpl implements AreaService {

	@Override
	public List<Area> select(int pid) {
		SqlSession session = MyBatisUtil.getSqlsession();
		AreaMapper mapper = session.getMapper(AreaMapper.class);
		return mapper.select(pid);
	}

}
