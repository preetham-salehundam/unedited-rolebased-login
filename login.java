package com.igate.assignment;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//request.getRequestDispatcher("index.html").forward(request,response);//we can include req-dispatcher in do get(), we can use sendRedirect()
	//}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext context=this.getServletContext();
		 String emp_id= request.getParameter("emp_id");
		 context.setAttribute("emp_ID",emp_id);//putting emp_id entered in form to context object
		 

		
		 Connection conn=null;
		 ArrayList<String> al1=null;
		 ArrayList<String> al2=null;
		 String uname=null;
		 String upwd=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");//load driver
			conn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Login","root","root");
			String query="select * from credentials";
			PreparedStatement stmt=conn.prepareStatement(query);
			ResultSet rs= stmt.executeQuery();
			al1=new ArrayList<String>();
			al2=new ArrayList<String>();
			while(rs.next()){
				
				uname=rs.getString("emp_id");
				upwd=rs.getString("pwd");
				al1.add(uname);
				al2.add(upwd);
				
			}
		}
			catch(Exception e){
				System.out.println(e.getMessage());
			
			}
finally{
			
			try {
				conn.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
		//---------------authentication-----------------//	
			String name=request.getParameter("emp_id");
			String passcode=request.getParameter("pwd");
			int i=0;//index variable
			int j=0;//count variable
			
			Iterator<String> it=al1.iterator();
	         
	         while(it.hasNext()){
	         

	                if(name.equals(it.next())){

	                      i=j;        

	                }else{

	                      j++;

	                }

	         }
			
	         String password=al2.get(i);   //retrieves the password for the corresponding username

	         String username = al1.get(i);
	         
	         PrintWriter out=response.getWriter();

	                 if(name.equals(username)){

	                        if(passcode.equals(password)){			
	                        	HttpSession session=request.getSession();
	                        	session.setAttribute("id", emp_id);
	                   		
	                   		 session.setMaxInactiveInterval(900);//15 mins expiry time      		
				             request.getRequestDispatcher("firstpage.jsp").include(request,response); 
				                   					  
				                   				  }
	                        else{

	                              out.print("<html><body><h2 style='color:red;'>Authentication failed</h1></body></html>"); 

	                        }

	                      					}
	                 else{

	                              out.print("<html><body><h2 style='color:green;'>invalid username</h2></body></html>");

	                        }

	        	}
	
				
				
			}
			
		
		
			
			
		}

	


			
		
	
			
			
			
			
		
		
		
		 
		 
		
		
		
	


