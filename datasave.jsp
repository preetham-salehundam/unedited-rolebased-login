<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DataSave</title>
</head>


<body>
<%@ page import="java.sql.*,java.io.*,javax.servlet.http.HttpServlet"%>

<%String Col_1=(String)request.getParameter("col_1");
  String Col_2=(String)request.getParameter("col_2");
  String Col_3=(String)request.getParameter("col_3");
  String Col_4=(String)request.getParameter("col_4");
  
 
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/Login", "root", "root");
		String query = "update credentials set col_1=?,col_2=?,col_3=?,col_4=? where emp_id=?";
		PreparedStatement stmt = conn.prepareStatement(query);
		ServletContext context = this.getServletContext();
		String emp_ID = (String) context.getAttribute("emp_ID");
		stmt.setString(1,Col_1);
		stmt.setString(2,Col_2);
		stmt.setString(3,Col_3);
		stmt.setString(4,Col_4);
		stmt.setString(5,emp_ID);
		int rs=0;
		rs= stmt.executeUpdate();
		if(rs>0){ 
			response.sendRedirect("firstpage.jsp");
		//request.getRequestDispatcher("firstpage.jsp").forward(request,response);				
		
			}
		conn.close();
		
	} catch (Exception e) {
		System.err.print(e);
	}
	
	
%>







</body>
</html>
