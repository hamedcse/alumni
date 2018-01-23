package domain;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "skill")
public class Skill {
	private long id;
	private String title;
	private String category;
	private String level;
	private Alumnus relatedAlumnus ;
	
	
	@Id
	@GeneratedValue()
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	public Alumnus getRelatedAlumnus() {
		return relatedAlumnus;
	}
	public void setRelatedAlumnus(Alumnus relatedAlumnus) {
		this.relatedAlumnus = relatedAlumnus;
	}
	
}
