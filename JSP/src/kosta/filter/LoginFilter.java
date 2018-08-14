package kosta.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/session/main/*")
//@WebFilter(urlPatterns= {
	//"/session/main.jsp
	//"/session/logout.jsp
public class LoginFilter implements Filter {

    public LoginFilter() { }

	public void destroy() { }

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		HttpSession session = req.getSession();
		
		String name = (String)session.getAttribute("name");
		if(((String)session.getAttribute("name"))== null) {
			res.sendRedirect("../loginForm.jsp");
		}
		req.setAttribute("name", name);
		
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException { }

}
