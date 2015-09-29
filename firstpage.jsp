<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SubmitPage</title>
<style>
	.heading, .line {
		font-size: 30px;
	}
	input{
	font-size:29px;
	}
	.table{
	position:relative;
	align:center;
	}
	.profilepic{
	position:relative;
	left:500px;}
	.edit{
	font-size:15px;}
</style>


</head>
<body>
	<%@ page import="java.sql.*,java.io.*,javax.servlet.http.HttpServlet"%>

	<%
	if(session!=null){
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Login", "root", "root");
			String query = "select * from credentials where emp_id=?";
			PreparedStatement stmt = conn.prepareStatement(query);
			ServletContext context = this.getServletContext();
			String emp_ID = (String) context.getAttribute("emp_ID");
			stmt.setString(1, emp_ID);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
	%>

	<div class="container" >
		<div class="profilepic">
	<img src="<%=emp_ID%>.jpg" height="200" width="190"/>
		</div>
		<table align="center">
			<div class="static" >
			<tr><td>	<label class="heading">Name:</label></td>
			<td><span id="line1" class="line"><%=rs.getString("emp_name")%></span></td>
			</tr></div>
		
		
			<div class="static" >
				<tr><td><label class="heading">Employee ID:</label></td>
				<td><span id="line2" class="line"><%=rs.getString("emp_id")%></span></td>
			</tr></div>
		
		
		<div class="static">
		<tr><td><label class="heading">Department:</label></td>
		<td><span id="line3" class="line"><%=rs.getString("department")%></span></td>
		</tr></div>
		
		
		<div class="static">
		<tr><td><label class="heading">Project Manager:</label></td> 
		<td><span id="line4" class="line"><%=rs.getString("project_Manager")%></span></td>
		</tr></div>
		
		
		<div class="static">
		<tr><td><label class="heading">Location:</label></td>
		<td><span id="line5" class="line"><%=rs.getString("location")%></span></td>
		</tr></div>
		
		<div class="static">
		<tr><td><label class="heading">Col_1:</label></td>
		<td><span id="line6" class="line"><%=rs.getString("col_1")%></span></td>
		</tr></div>
		
		<div class="static">
		<tr><td><label class="heading">Col_2:</label></td>
		<td><span id="line7" class="line"><%=rs.getString("col_2")%></span></td>
		</tr></div>
		
		<div class="static">
		<tr><td><label class="heading">Col_3:</label></td>
		<td><span id="line8" class="line"><%=rs.getString("col_3")%></span></td>
		</tr></div>
		
		<div class="static">
		<tr><td><label class="heading">Col_4:</label></td>
		<td><span id="line9" class="line"><%=rs.getString("col_4")%></span></td>
		</tr></div></table>
		
		
		<div class="edit" align="center">
		<table>
				<tr>
					<td><form method="post" action="secondpage.jsp"><input type="submit" value="edit"/></form>		
		
		</table></div>
		
		<div class="Logout" align="center">
				<table>
						<tr>
							<td><form method="post" action="index.html"><input type="submit" value="Logout"/></form>		
				
				</table></div>
		

	</div>
	<%
		}
		} catch (Exception e) {
			System.err.print(e);
		} finally {
			conn.close();
		}
	}
	else{
		request.getRequestDispatcher("index.html").include(request,response);
	}
	%>






</body>
</html>
