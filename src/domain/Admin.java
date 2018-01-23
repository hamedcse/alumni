package domain;

import javax.persistence.Entity;
import javax.persistence.Table;

import domain.parent.UserParent;

@Entity
@Table(name = "admin")
public class Admin extends UserParent{
	
	private String type;
	private int privilegeLevel;
	
	public Admin() {
		this.setIsActive(true);
		this.setDeleted(false);
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPrivilegeLevel() {
		return privilegeLevel;
	}
	public void setPrivilegeLevel(int privilegeLevel) {
		this.privilegeLevel = privilegeLevel;
	}

}
