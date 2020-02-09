<%@page import="java.sql.*"%>
<%@page errorPage="catch.jsp"%>
<%
String acno=request.getParameter("acno");
session.setAttribute("acno",acno);
String ps=request.getParameter("pwd");
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:xe";
String dbun="kamal",dbps="123";
Connection c=DriverManager.getConnection(url,dbun,dbps);
String q="select pwd from bank where acno='"+acno+"'";
ResultSet rs=c.createStatement().executeQuery(q);
String ps1=null;
if(rs.next()){
ps1=rs.getString(1);
if(ps.equals(ps1)){
out.print("U have logedin successully");
%>
<a href="eve.html">Account details</a><br>
<%
}
else {
out.print("wrong password login failed");
%>
<a href="lo.html">Login account</a>
<%
}
}
else{
out.print("account number doesn't not exist");
}
%>
<br>



