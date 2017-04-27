import java.io.*;
import java.text.*;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.*;
import javax.servlet.http.*;

import sdsu.*;
/*Sehgal,Priyanka Account:jadrn045
CS645, Spring 2017
Project 2 */


public class Merchandise_out extends HttpServlet { 
          
    public void doPost(HttpServletRequest request,
              HttpServletResponse response)
                        throws IOException, ServletException  {
        processRequest(request, response);         
        }

    public void doGet(HttpServletRequest request,
              HttpServletResponse response)
                        throws IOException, ServletException  { 
        processRequest(request, response);
        } 
        
    private void processRequest(HttpServletRequest request,
              HttpServletResponse response) 
                        throws IOException, ServletException {
    	
    	HttpSession session = request.getSession(false);
        if(session == null) {    
            ServletContext context = getServletContext();       
            RequestDispatcher dispatcher 
                = request.getRequestDispatcher("/WEB-INF/jsp_proj2/login_err.jsp");   
            dispatcher.forward(request, response);              
        }    
        
        String toDo;
        if(!request.getMethod().equals("POST")) {
            response.sendRedirect("/jadrn045/login_err.jsp");
            return;
        }    
        String sku = (String)request.getParameter("product_sku1");
		request.setAttribute("product_sku",sku);
        int quantity = Integer.parseInt(request.getParameter("quantity1"));
    	String dateString = (String)request.getParameter("datepicker1");
	    String tableName = request.getParameter("action");
        int flag=0;
        //new changes
        int q = DBHelper.getOnHandQuantity(sku);
        boolean dbResult = false;
        if(tableName.equals("merchandise_in")){ 
    	            dbResult = DBHelper.runUpdateQuery("INSERT INTO "+tableName
        		      + " values('"+sku+"',STR_TO_DATE('"+dateString+"','%m/%d/%Y'),"+quantity+");");
    	}
        else
        {
            if(q!=-9999){

                 if(q>=quantity){
                 dbResult = DBHelper.runUpdateQuery("INSERT INTO "+tableName
                      + " values('"+sku+"',STR_TO_DATE('"+dateString+"','%m/%d/%Y'),"+quantity+");");
             }
             else{
                dbResult = false;
                flag = -1;
            }
        
            }
            else
                dbResult = false;

        }
        Date currDate = new Date();
        boolean success = false;
        if(dbResult){
        	int on_hand_quantity = DBHelper.getOnHandQuantity(sku);
        	int new_quantity = 0;
        	if(on_hand_quantity != -9999){
        		
        		new_quantity = (tableName.equals("merchandise_in")) 
        				? (on_hand_quantity+quantity): (on_hand_quantity-quantity);

        		//System.out.println("In update"+new_quantity);
        		success = DBHelper.runUpdateQuery("UPDATE on_hand SET last_date_modified=CURDATE(),"
        				+ "on_hand_quantity="+new_quantity+" WHERE sku='"+sku+"';");
        	    request.setAttribute("on_hand",  (success) ? new_quantity : on_hand_quantity);
        	}
        	else
        	{	//System.out.println("In insert"+quantity);
        		success = DBHelper.runUpdateQuery("INSERT INTO on_hand "
        				+ "values('"+sku+"',CURDATE(),"+quantity+");");
        		request.setAttribute("on_hand", (success) ? quantity : 0 );
        	}
        	
    		request.setAttribute("status", (success) ? "success" : "error");

    		RequestDispatcher dispatcher =
                    request.getServletContext().getRequestDispatcher("/WEB-INF/jsp_proj2/confirmation_out.jsp");
            dispatcher.forward(request, response);
        }
        else
        {
            if(flag != -1){
                request.setAttribute("on_hand", (success) ? quantity : 0 );
                request.setAttribute("status", (success) ? "success" : "error");

            }
            else {
                request.setAttribute("on_hand", q );
                // request.setAttribute("status", "insufficient");
                 request.setAttribute("status", (success) ? "success" : "insufficient");

                
            }
            RequestDispatcher dispatcher =
                    request.getServletContext().getRequestDispatcher("/WEB-INF/jsp_proj2/confirmation_out.jsp");
            dispatcher.forward(request, response);
        }
       
     }
}


