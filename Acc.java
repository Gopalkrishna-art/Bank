package p2;
import java.util.*;
import java.sql.*;
public class Acc{
public String show()throws Exception
{
Calendar c=Calendar.getInstance();
String yr=c.get(Calendar.YEAR)%100+"";
String mt=(c.get(Calendar.MONTH)+1)+"";
String dt=c.get(Calendar.DATE)+"";
String q="select num from countacc where dt='"+dt+"-"+mt+"-"+yr+"'";
Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","kamal","123");
ResultSet rs=cn.createStatement().executeQuery(q);
int n=1;
if(rs.next()){
n=rs.getInt(1);
n++;
PreparedStatement ps=cn.prepareStatement("update countacc set num=? where dt=?");
ps.setInt(1,n);
ps.setString(2,dt+"-"+mt+"-"+yr);
ps.execute();
}
else{
PreparedStatement ps=cn.prepareStatement("insert into countacc values(?,?)");
ps.setInt(2,n);
ps.setString(1,dt+"-"+mt+"-"+yr);
ps.execute();
}
if(Integer.parseInt(yr)<10)
yr="0"+yr;
if(Integer.parseInt(mt)<10)
mt="0"+mt;
if(Integer.parseInt(dt)<10)
dt="0"+dt;
String sn=n+"";
if(n<10)
sn="00"+sn;
else if(n>=10 && n<100)
sn="0"+sn;
String accnum=yr+mt+dt+sn;
return accnum;
}
}

