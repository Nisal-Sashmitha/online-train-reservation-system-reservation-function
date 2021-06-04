package com.searchResults;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get details from search forma and send serch result object
		String	from = request.getParameter("from");
		String to = request.getParameter("to");
		String date = request.getParameter("date");
		System.out.println(from);
		System.out.println(to);
		List<SearchResult> searchResults=null;
		
		try {
			
			List<String> stations =SearchDBUtill.getStations();
			request.setAttribute("stations", stations);
			
			searchResults= SearchDBUtill.search(from, to);
			request.setAttribute("searchResults", searchResults);
			
			request.setAttribute("date", date);
			request.setAttribute("from", from);
			request.setAttribute("to", to);
			
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("in here..............");
		}
		
		
		RequestDispatcher dis = request.getRequestDispatcher("searchResults.jsp");
		dis.forward(request, response);
	
	}
	
	

}
