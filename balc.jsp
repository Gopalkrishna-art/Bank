<%@page import="java.sql.*"%>
<%@page errorPage="catch.jsp"%>
<%
String acno=session.getAttribute("acno").toString();
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:xe";
String un="kamal",pw="123";
Connection c=DriverManager.getConnection(url,un,pw);
String k="select bal from bank where acno='"+acno+"'";
ResultSet rs=c.createStatement().executeQuery(k);
while(rs.next())
out.print(rs.getInt(1)+"<br>");
%>
<br>
<a href='eve.html'>back</a>