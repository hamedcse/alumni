<%
	if((session.getAttribute("UID")==null) 
			|| (session.getAttribute("TYPE")==null) 
				|| (session.getAttribute("TYPE")!="Admin")) 
	{
		response.sendRedirect("login.jsp");
	}
%>