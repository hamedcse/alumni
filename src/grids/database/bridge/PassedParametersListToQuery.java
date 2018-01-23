package grids.database.bridge;

import java.util.ArrayList;

public class PassedParametersListToQuery {
	private ArrayList<Object> parametersList = new ArrayList<Object>();

	public PassedParametersListToQuery() {

	}

	public ArrayList<Object> getParametersList() {
		return parametersList;
	}

	public void setParametersList(ArrayList<Object> parametersList) {
		this.parametersList = parametersList;
	}

}
