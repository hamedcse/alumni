package grids.database.bridge;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

public class WhereClauseProducer {

	public static String generateWhereClause(String filters) {
		String whereClause = "";

		System.out.println("whereGenerator, filters= " + filters);

		JSONObject jsonFilter = (JSONObject) JSONSerializer.toJSON(filters);
		String groupOp = jsonFilter.getString("groupOp");
		JSONArray rules = jsonFilter.getJSONArray("rules");
		int rulesCount = JSONArray.getDimensions(rules)[0];

		whereClause = whereClause + " where";
		for (int i = 0; i < rulesCount; i++) {
			JSONObject rule = rules.getJSONObject(i);

			whereClause = whereClause + " " + rule.getString("field") + " like " + "?";
			if ((rulesCount > 1) && (i < rulesCount - 1))
				whereClause = whereClause + groupOp;
		}

		return whereClause;
	}

	public static String generateWhereClauseWithoutWhere(String filters) {
		String whereClause = "";

		System.out.println("whereGenerator, filters= " + filters);

		JSONObject jsonFilter = (JSONObject) JSONSerializer.toJSON(filters);
		String groupOp = jsonFilter.getString("groupOp");
		JSONArray rules = jsonFilter.getJSONArray("rules");
		int rulesCount = JSONArray.getDimensions(rules)[0];

		whereClause = whereClause + " AND";
		for (int i = 0; i < rulesCount; i++) {
			JSONObject rule = rules.getJSONObject(i);

			whereClause = whereClause + " " + rule.getString("field") + " like " + "?";
			if ((rulesCount > 1) && (i < rulesCount - 1))
				whereClause = whereClause + " " + groupOp;
		}

		return whereClause;
	}

}
