<%
String opt=request.getParameter("opt");
if(opt.equals("d"))
response.sendRedirect("dep.html");
else if(opt.equals("w"))
response.sendRedirect("with.html");
else if(opt.equals("a"))
response.sendRedirect("actac.html");
else
response.sendRedirect("balc.jsp");
%>