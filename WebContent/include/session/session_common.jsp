<%
if((session.getAttribute("UID")==null)  || (session.getAttribute("TYPE")==null)) {
	response.sendRedirect("login.jsp");
}
%>