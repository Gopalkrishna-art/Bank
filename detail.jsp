<%@page import="p2.Acc"%>
<%@page import="java.sql.*"%>
<%@page errorPage="catch.jsp"%>
<%
String name=request.getParameter("name");
String pwd=request.getParameter("pwd");
int bal=0;
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:xe";
String un="kamal",pw="123";
Connection c=DriverManager.getConnection(url,un,pw);
String k="select name from bank where name='"+name+"'";
ResultSet rs=c.createStatement().executeQuery(k);
if(rs.next()){
out.print("Account name already exist");
}
else
{
Acc ss=new Acc();
String accnum=ss.show();
String q="insert into bank values(?,?,?,?)";
PreparedStatement ps=c.prepareStatement(q);
ps.setString(1,accnum);
ps.setString(2,name);
ps.setString(3,pwd);
ps.setInt(4,bal);
ps.execute();
out.print("Bank account created successfully");
}
%>
<br>
<a href='lo.html'>login to ur account</a><br>

<a href='detail.html'>Create with new Account name</a>