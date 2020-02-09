<%@page import="java.sql.*"%>
<%@page errorPage="catch.jsp"%>
<%
String us=request.getParameter("acno");
int bal=Integer.parseInt(request.getParameter("bal"));
String acno=session.getAttribute("acno").toString();
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:xe";
String un="kamal",pw="123";
Connection c=DriverManager.getConnection(url,un,pw);
String k="select acno,bal from bank where acno="+acno;
ResultSet rs=c.createStatement().executeQuery(k);
String r="";
if(rs.next()){
if(rs.getInt(2)>bal){
r="update bank set bal=? where acno=?";
PreparedStatement p=c.prepareStatement(r);
p.setString(2,acno);
p.setInt(1,rs.getInt(2)-bal);
p.execute();
out.print("Amount transwered");
String i="select acno,bal from bank where acno="+us;
ResultSet rr=c.createStatement().executeQuery(i);
String l="";
if(rr.next()){
l="update bank set bal=? where acno=?";
PreparedStatement pk=c.prepareStatement(l);
pk.setString(2,us);
pk.setInt(1,rr.getInt(2)+bal);
pk.execute();
out.print("Amount received");
}
}
else
out.print("insufficient amount");
}
else{
out.print("amount not avaliable");
}
%>
<br>
<a href='eve.html'>back</a>