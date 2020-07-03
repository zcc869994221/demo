package com.bjsxt.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bjsxt.bean.Area;
import com.bjsxt.service.AreaService;
import com.bjsxt.serviceImpl.AreaServiceImpl;
import com.google.gson.Gson;

/**
 * Servlet implementation class AreaServlet
 */
@WebServlet("/AreaServlet")
public class AreaServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	public void select (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pid = Integer.parseInt(req.getParameter("pid"));
		System.out.println(pid);
		
		AreaService as = new AreaServiceImpl();
		List<Area> list = as.select(pid);
		
		resp.getWriter().write(new Gson().toJson(list));
	}
	
}
