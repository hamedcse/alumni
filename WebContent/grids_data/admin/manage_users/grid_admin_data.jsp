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
	GridsDatabaseBridge dbBridge = new GridsDatabaseBridge("id, name, family, username, isActive, type, deleted, privilegeLevel "," admin ", passedParamsList, false, filters, doSearch);		/*CHANGE*/
	
	int count = dbBridge.getCount();
	//--

	int pageval=0;
	pageval=(count/Integer.parseInt(rows));
	int limitstart=0;
	limitstart=(Integer.parseInt(rows)*Integer.parseInt(pageno))-Integer.parseInt(rows);
	int total=count/Integer.parseInt(rows);
	String totalrow=String.valueOf(total+1);


	/*--Query and Data Provider(query comes from custom Java classes)*/
	ResultSet rs = null;
	PreparedStatement query = null;

	try{
		//--
		query = dbBridge.getQueryWithPaging(sidx, sord, limitstart, rows);
		rs = query.executeQuery();
		//--

		JSONObject responcedata=new JSONObject();
		net.sf.json.JSONArray cellarray=new net.sf.json.JSONArray();

		responcedata.put("total",totalrow);
		responcedata.put("page",cpage);
		responcedata.put("records",count);

		net.sf.json.JSONArray cell=new net.sf.json.JSONArray();
		net.sf.json.JSONObject cellobj=new net.sf.json.JSONObject();

		while(rs.next())			/*CHANGE*/
		{
			cellobj.put("id",rs.getString(1));
			cell.add(rs.getString(1));
			cell.add(rs.getString(2));
			cell.add(rs.getString(3));
			cell.add(rs.getString(4));
			cell.add(rs.getString(5));
			cell.add(rs.getString(6));
			cell.add(rs.getString(7));
			cell.add(rs.getString(8));
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
		if(query!=null)
			query.close();
		dbBridge.closeConnection();
	}
%>