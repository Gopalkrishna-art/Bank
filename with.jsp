<%@page import="java.sql.*"%>
<%@page errorPage="catch.jsp"%>
<%
int bal=Integer.parseInt(request.getParameter("bal"));
String acno=session.getAttribute("acno").toString();
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:xe";
String un="kamal",pw="123";
Connection c=DriverManager.getConnection(url,un,pw);
String k="select acno,bal from bank where acno='"+acno+"'";
ResultSet rs=c.createStatement().executeQuery(k);
String r="";
if(rs.next())
{
if(rs.getInt(2)>bal){
r="update bank set bal=? where acno=?";
PreparedStatement p=c.prepareStatement(r);
p.setString(2,acno);
p.setInt(1,rs.getInt(2)-bal);
p.execute();
out.print("Amount withdrawed");
}
else
out.print("insuicffient bal");
}
else{
out.print("account not avaliable");
}
%>
<br>
<a href='eve.html'>back</a>