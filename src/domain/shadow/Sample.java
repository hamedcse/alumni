package domain.shadow;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "sample")
public class Sample {
	private long id;
	private String attr;
	
	@Id
	@GeneratedValue()
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
}
