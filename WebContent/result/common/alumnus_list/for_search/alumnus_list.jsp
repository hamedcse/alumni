<%@page import="hibernate.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="database.DataBase"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Collection"%>
<%@page import="domain.Alumnus"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String searchTerm=request.getParameter("term");

if (searchTerm.length()>1) {	
	Session session2 = null;
	try {
		session2 = HibernateUtil.getSession();
		session2.beginTransaction();
		Map<Long,Alumnus> alumnusList = new HashMap<Long, Alumnus>();
	  	Map httpSession = (Map) ActionContext.getContext().get("session");
		long uid =  (Long) httpSession.get("UID");
	  	
	  	alumnusList = DataBase.getAlumnusListForSentMessage(searchTerm);
		
		JSONObject responcedata=new JSONObject();
	    net.sf.json.JSONArray alumnusArray=new net.sf.json.JSONArray();
		net.sf.json.JSONObject alumnusObj=new net.sf.json.JSONObject();
		
		for (Entry<Long, Alumnus> e : alumnusList.entrySet()) {
		    Long key = e.getKey();
		    Alumnus a = e.getValue();
		    alumnusObj.put("username",a.getUsername());
		    alumnusArray.add(alumnusObj);
		}
		
	   	out.println(alumnusArray);
	   	
	   	//System.out.println("\n\nOK\n\n");
	   	session2.getTransaction().commit();
	} catch (Exception e) {
		if (session2 != null && session2.isOpen())
			session2.getTransaction().rollback();
	} finally {
		if (session2 != null && session2.isOpen()){
			session2.getTransaction().rollback();
		}
	}
}
%>