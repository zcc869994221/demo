package com.bjsxt.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bjsxt.bean.Word;
import com.bjsxt.service.SearchService;
import com.bjsxt.serviceImpl.SearchServiceImpl;
import com.google.gson.Gson;


@WebServlet("/SearchServlet")
public class SearchServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	public void select (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title = req.getParameter("title");
		System.out.println(title);
		SearchService ss = new SearchServiceImpl();
		List<Word> list = ss.select(title);
		
		resp.getWriter().write(new Gson().toJson(list));
	}
	
}
