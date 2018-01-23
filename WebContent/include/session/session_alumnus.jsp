<%
	if((session.getAttribute("UID")==null) 
			|| (session.getAttribute("TYPE")==null) 
				|| (session.getAttribute("TYPE")!="Alumnus")) 
	{
		response.sendRedirect("login.jsp");
	}
%>