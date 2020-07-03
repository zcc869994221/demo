package com.bjsxt.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MyServlet
 */
@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	//设置请求编码格式
    	req.setCharacterEncoding("utf-8");
    	//设置响应编码格式
    	resp.setContentType("text/html;charset=utf-8");
    	
    	resp.getWriter().write("ajax学习");
    	}

}
