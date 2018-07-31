package kosta.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hundred")
public class HundredServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HundredServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int total = 0;
		for(int i = 0 ; i < 101 ; i++) {
			total += i;
		}
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		out.println("<html><head>");
		out.println("<title>Hundred Servlet</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("1 + 2 + 3 + ... + = "+total);
		out.println("</body></html>");
		out.close();
		
		
	}
}
