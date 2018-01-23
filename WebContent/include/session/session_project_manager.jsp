<%
	if((session.getAttribute("UID")==null) 
			|| (session.getAttribute("TYPE")==null) 
				|| (session.getAttribute("TYPE")!="ProjectManager")) 
	{
		response.sendRedirect("login.jsp");
	}
%>