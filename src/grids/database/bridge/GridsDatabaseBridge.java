package grids.database.bridge;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import exceptions.SqlInjectionThreat;
import util.Validator;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

public class GridsDatabaseBridge {

	private String table = "";
	private String fieldsName = "";
	private PassedParametersListToQuery passedParamsListToQuery = null;
	private String filters = "";
	private boolean doSearch = false;
	private Connection connection = null;
	private String whereClause = "";
	private boolean withoutWhere = false;
	private int paramsNo;
	private String groupBy = "";

	public GridsDatabaseBridge(String fieldsNames, String table, PassedParametersListToQuery passedParamsListToQuery, boolean withoutWhere, String filters, boolean doSearch) {
		this.table = table;
		this.fieldsName = fieldsNames;
		this.passedParamsListToQuery = passedParamsListToQuery;
		this.filters = filters;
		this.doSearch = doSearch;
		this.withoutWhere = withoutWhere;

		if(passedParamsListToQuery==null)
			this.paramsNo = 0;
		else
			this.paramsNo = passedParamsListToQuery.getParametersList().size();
	}
	public GridsDatabaseBridge(String fieldsNames, String table, PassedParametersListToQuery passedParamsListToQuery, boolean withoutWhere, String filters, boolean doSearch, String groupBy) {
		this.table = table;
		this.fieldsName = fieldsNames;
		this.passedParamsListToQuery = passedParamsListToQuery;
		this.filters = filters;
		this.doSearch = doSearch;
		this.withoutWhere = withoutWhere;

		if(passedParamsListToQuery==null)
			this.paramsNo = 0;
		else
			this.paramsNo = passedParamsListToQuery.getParametersList().size();
		this.groupBy = groupBy;
	}

	public int getCount() throws SqlInjectionThreat {

		PreparedStatement statement = null;
		ResultSet rs = null;
		int count = 0;

		try {
			connection = ConnectionManager.connectToMYSQL();

			if (doSearch)
				if (withoutWhere)
					whereClause = WhereClauseProducer.generateWhereClauseWithoutWhere(filters);
				else
					whereClause = WhereClauseProducer.generateWhereClause(filters);

			// System.out.println(whereClause);

			statement = (PreparedStatement) connection.prepareStatement("SELECT COUNT(*) AS rowcount FROM " + this.table
					+ whereClause  + ";");

			if (doSearch) {
				JSONObject jsonFilter = (JSONObject) JSONSerializer.toJSON(filters);
				JSONArray rules = jsonFilter.getJSONArray("rules");
				int rulesCount = JSONArray.getDimensions(rules)[0];

				for (int i = 0; i < rulesCount; i++) {
					JSONObject rule = rules.getJSONObject(i);

					String conditionData = rule.getString("data");
					Validator.validateSQLInjectionFreeQuery(conditionData);
					if (conditionData.charAt(0) != '=')
						conditionData = "%" + conditionData + "%";
					else
						conditionData = conditionData.substring(1, conditionData.length());
					statement.setString(i + 1, conditionData);
				}
			}

			//----NEW-SECURE-QUERY----
			if(passedParamsListToQuery!=null){
				int i=1;
				for(Object param:passedParamsListToQuery.getParametersList()) {
					if(param instanceof String)
						statement.setString(i, (String) param);
					else if(param instanceof Long)
						statement.setLong(i, (Long) param);
					else if(param instanceof Integer)
						statement.setLong(i, (Integer) param);
					i++;
				}
			}
			//----NEW-SECURE-QUERY----

			rs = statement.executeQuery();
			rs.next();
			count = rs.getInt("rowcount");
			rs.close();

			System.out.println("getCount last query= " + statement);

		} catch (SqlInjectionThreat e) {

		} catch (SQLException e) {
			e.printStackTrace();
		}/*
		 * finally{ closeConnection(); }
		 */

		return count;

	}
	public int getCountIncludeGroupBy() throws SqlInjectionThreat {

		PreparedStatement statement = null;
		ResultSet rs = null;
		int count = 0;

		try {
			connection = ConnectionManager.connectToMYSQL();

			if (doSearch)
				if (withoutWhere)
					whereClause = WhereClauseProducer.generateWhereClauseWithoutWhere(filters);
				else
					whereClause = WhereClauseProducer.generateWhereClause(filters);

			// System.out.println(whereClause);

			statement = (PreparedStatement) connection.prepareStatement("SELECT COUNT(*) as rowcount from ( SELECT COUNT(*) AS rowcount FROM " + this.table
					+ whereClause + groupBy  + " ) as __alias ;");

			if (doSearch) {
				JSONObject jsonFilter = (JSONObject) JSONSerializer.toJSON(filters);
				JSONArray rules = jsonFilter.getJSONArray("rules");
				int rulesCount = JSONArray.getDimensions(rules)[0];

				for (int i = 0; i < rulesCount; i++) {
					JSONObject rule = rules.getJSONObject(i);

					String conditionData = rule.getString("data");
					Validator.validateSQLInjectionFreeQuery(conditionData);
					if (conditionData.charAt(0) != '=')
						conditionData = "%" + conditionData + "%";
					else
						conditionData = conditionData.substring(1, conditionData.length());
					statement.setString(i + 1, conditionData);
				}
			}

			//----NEW-SECURE-QUERY----
			if(passedParamsListToQuery!=null){
				int i=1;
				for(Object param:passedParamsListToQuery.getParametersList()) {
					if(param instanceof String)
						statement.setString(i, (String) param);
					else if(param instanceof Long)
						statement.setLong(i, (Long) param);
					else if(param instanceof Integer)
						statement.setLong(i, (Integer) param);
					i++;
				}
			}
			//----NEW-SECURE-QUERY----

			rs = statement.executeQuery();
			rs.next();
			count = rs.getInt("rowcount");
			rs.close();

			System.out.println("getCount last query= " + statement);

		} catch (SqlInjectionThreat e) {

		} catch (SQLException e) {
			e.printStackTrace();
		}/*
		 * finally{ closeConnection(); }
		 */

		return count;

	}

	public PreparedStatement getQueryWithPaging(String sidx, String sord, int limitstart, String rows) throws SqlInjectionThreat {
		PreparedStatement statement = null; // (sort index, sort order, start of limit, records per page/load)

		try {
			// connection = ConnectionManager.connectToMYSQL();
			if (doSearch)
				if (withoutWhere)
					whereClause = WhereClauseProducer.generateWhereClauseWithoutWhere(filters);
				else
					whereClause = WhereClauseProducer.generateWhereClause(filters);

			/*statement = (PreparedStatement) connection.prepareStatement("SELECT " + this.fieldsName + " FROM " + this.table
					+ whereClause + " ORDER BY " + sidx + " " + sord + " limit " + limitstart + "," + rows + ";");*/



			if(sord.equalsIgnoreCase("desc") )
				sord="desc";
			else if((sord.equalsIgnoreCase("asc")))
					sord="asc";
			else
				sord="";


			//----NEW-SECURE-QUERY----
			statement = (PreparedStatement) connection.prepareStatement("SELECT " + this.fieldsName + " FROM " + this.table
					+ whereClause + groupBy + " ORDER BY ? "+sord+" limit ?,?;");
			//----NEW-SECURE-QUERY----

			System.out.println("statement1= " + statement);
			System.out.println("doFilters: " + doSearch);

			int i=0;
			if (doSearch) {
				JSONObject jsonFilter = (JSONObject) JSONSerializer.toJSON(filters);
				JSONArray rules = jsonFilter.getJSONArray("rules");
				int rulesCount = JSONArray.getDimensions(rules)[0];

				for (i = 0; i < rulesCount; i++) {
					JSONObject rule = rules.getJSONObject(i);
					String conditionData = rule.getString("data");
					Validator.validateSQLInjectionFreeQuery(conditionData);

					if (conditionData.charAt(0) != '=')
						conditionData = "%" + conditionData + "%";
					else
						conditionData = conditionData.substring(1, conditionData.length());
					statement.setString(i+paramsNo+1, conditionData.toString());
				}
			}

			//----NEW-SECURE-QUERY----
			int j=1;
			if(passedParamsListToQuery!=null){
				for(Object param:passedParamsListToQuery.getParametersList()) {
					if(param instanceof String)
						statement.setString(j, (String) param);
					else if(param instanceof Long)
						statement.setLong(j, (Long) param);
					else if(param instanceof Integer)
						statement.setLong(j, (Integer) param);
					j++;
				}
			}
				//---Now th3 Last 4 parameters(?s)
				i=i+j;
				statement.setInt(i, Integer.parseInt(sidx));				//1st : sidx
				//statement.setString(i + 1, sord);			//2nd : sord
				statement.setInt(i + 1, limitstart);		//3rd : limitstart
				statement.setInt(i + 2, new Integer(rows)); //4th : rows
				//---
			System.out.println("LAST AND THE LAST= " + statement);
			//----NEW-SECURE-QUERY----

		} catch (SqlInjectionThreat e) {
			e.setMessage(e.getMessage() + " ,FULL QUERY= " + statement);
			throw e;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return statement;

	}

	public PreparedStatement getAFreeQuery(String freeQuery) throws SqlInjectionThreat {
		PreparedStatement statement = null;

		try {
			// connection = ConnectionManager.connectToMYSQL();

			statement = (PreparedStatement) connection.prepareStatement(freeQuery);
			System.out.println("free Query= " + statement);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return statement;

	}

	public void closeConnection() {
		try {
			if (connection != null) {
				ConnectionManager.disconnectFromMYSQL(connection);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() {
		return connection;
	}

}
