package domain.shadow;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import domain.parent.UserParent;

@Entity
@Table(name = "teacher")
public class Teacher extends UserParent{
	
	private String attribute;

	@Column(name="name_in_db" , nullable=true)
	public String getAttribute() {
		return attribute;
	}
	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}
	
}
