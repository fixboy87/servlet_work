package kosta.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/form")
public class FormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FormServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String num1 = request.getParameter("num1"); //name(키값)하고 같아야 전달이 된다.
		String num2 = request.getParameter("num2");
//		System.out.println(num1);

		int result = Integer.parseInt(num1)+Integer.parseInt(num2);
//		int result = 100;
		request.setAttribute("result", result);
		
		RequestDispatcher re =
				request.getRequestDispatcher("/jsp/result.jsp");
		
		re.forward(request, response);
		
		
		
	}

}
