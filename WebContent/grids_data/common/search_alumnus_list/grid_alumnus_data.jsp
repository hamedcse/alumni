<%@ page contentType="text/html; charset=utf-8"  language="java" import="java.sql.*,net.sf.json.*,grids.database.bridge.*,exceptions.SqlInjectionThreat,java.util.ArrayList" %>
<%
	//--variables initializer
	String rows=request.getParameter("rows");
	String pageno=request.getParameter("page");
	String sidx=request.getParameter("sidx");
	String sord=request.getParameter("sord");
	String filters=request.getParameter("filters");
	boolean doSearch=Boolean.parseBoolean(request.getParameter("_search"));

	String UID="";
	//UID = (String) session.getAttribute("UID");

	/* Encoding Converter */
	 if (filters != null)
		filters = new String(filters.getBytes("8859_1"),"UTF-8");
	/* Encoding Converter */

	String cpage=pageno;
	if(sidx.equals(""))
		sidx = "1";


	//--Open a link to DB Table, Count of Records Calculator(from custom Java classes)
	//----NEW-SECURE-QUERY-----
	PassedParametersListToQuery passedParamsList = new PassedParametersListToQuery();
	//passedParamsList.getParametersList().add(new String(UID));
	//----NEW-SECURE-QUERY-----
	GridsDatabaseBridge dbBridge1 = new GridsDatabaseBridge("id, username, name, family, yearOfGraduation, field, college, city, educationLevel "," alumnus ", passedParamsList, false, filters, doSearch);		/*CHANGE*/
	GridsDatabaseBridge dbBridge2 = new GridsDatabaseBridge("id, username, name, family, yearOfGraduation, field, college, city, educationLevel "," alumnus_archive ", passedParamsList, false, filters, doSearch);		/*CHANGE*/
	
	int count1 = dbBridge1.getCount();
	int count2 = dbBridge2.getCount();
	int count = count1 + count2;
	//--

	int pageval=0;
	pageval=(count/Integer.parseInt(rows));
	int limitstart=0;
	limitstart=(Integer.parseInt(rows)*Integer.parseInt(pageno))-Integer.parseInt(rows);
	int total=count/Integer.parseInt(rows);
	String totalrow=String.valueOf(total+1);


	/*--Query and Data Provider(query comes from custom Java classes)*/
	ResultSet rs1 = null;
	PreparedStatement query1 = null;
	ResultSet rs2 = null;
	PreparedStatement query2 = null;
	try{
		//--
		query1 = dbBridge1.getQueryWithPaging(sidx, sord, limitstart, rows);
		rs1 = query1.executeQuery();
		query2 = dbBridge2.getQueryWithPaging(sidx, sord, limitstart, rows);
		rs2 = query2.executeQuery();
		//--

		JSONObject responcedata=new JSONObject();
		net.sf.json.JSONArray cellarray=new net.sf.json.JSONArray();

		responcedata.put("total",totalrow);
		responcedata.put("page",cpage);
		responcedata.put("records",count);

		net.sf.json.JSONArray cell=new net.sf.json.JSONArray();
		net.sf.json.JSONObject cellobj=new net.sf.json.JSONObject();

		while(rs1.next())			/*CHANGE*/
		{
			cellobj.put("id",rs1.getString(1));
			cell.add(rs1.getString(1));
			cell.add(rs1.getString(2));
			cell.add(rs1.getString(3));
			cell.add(rs1.getString(4));
			cell.add(rs1.getString(5));
			cell.add(rs1.getString(6));
			cell.add(rs1.getString(7));
			cell.add(rs1.getString(8));
			cell.add(rs1.getString(9));
			cell.add(" ");

			cellobj.put("cell",cell);
			cell.clear();
			cellarray.add(cellobj);
		}
		while(rs2.next())			/*CHANGE*/
		{
			cellobj.put("id",rs2.getString(1));
			cell.add(rs2.getString(1));
			cell.add(rs2.getString(2));
			cell.add(rs2.getString(3));
			cell.add(rs2.getString(4));
			cell.add(rs2.getString(5));
			cell.add(rs2.getString(6));
			cell.add(rs2.getString(7));
			cell.add(rs2.getString(8));
			cell.add(rs2.getString(9));
			cell.add(" ");

			cellobj.put("cell",cell);
			cell.clear();
			cellarray.add(cellobj);
		}

		responcedata.put("rows",cellarray);
		out.println(responcedata);
	} catch(SqlInjectionThreat e){
		System.out.println("!!! SqlInjectionThreat !!!");
	} catch (SQLException e) {
		//nothing;
	} finally{
		if(query1!=null)
			query1.close();
		if(query2!=null)
			query2.close();
		dbBridge1.closeConnection();
		dbBridge2.closeConnection();
	}
%>