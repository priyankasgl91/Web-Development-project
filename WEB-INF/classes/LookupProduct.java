import java.io.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import sdsu.*;

/*Sehgal,Priyanka Account:jadrn045
CS645, Spring 2017
Project 2 */
public class LookupProduct extends HttpServlet {


    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
        throws IOException, ServletException
    {
	    HttpSession session = request.getSession(false);
	    if(session == null) {    
	        ServletContext context = getServletContext();       
	        RequestDispatcher dispatcher 
	            = request.getRequestDispatcher("/WEB-INF/jadrn045/login_err.jsp");   
	        dispatcher.forward(request, response);              
	        }    
	
	    HashMap<String,Product> productsHash = (HashMap<String,Product>)session.getAttribute("products");
	    Product product = productsHash.get(request.getParameter("sku"));
	    
	    response.setContentType("text/plain"); 
        response.setCharacterEncoding("UTF-8");
        
	    if(product != null){
	    	session.setAttribute("product",product);
	        response.getWriter().write(product.toString()); 
	    }
	    else{
	    	response.getWriter().write("ERROR"); 	
	    }
	}
		
	public void doPost(HttpServletRequest request,HttpServletResponse response)
			throws IOException, ServletException{
		doGet(request, response);
	}  
}



