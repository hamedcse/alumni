package domain;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "resume")
public class Resume {
	private long id;
	private String educationHistory;
	private String languageSkills;
	private String researchActivities;
	private String businessActivities;
	private String other;
	
	private Alumnus alumnus;
	
	public Resume(){}
	
	@Id
	@GeneratedValue()
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}

	@OneToOne(fetch=FetchType.LAZY)
	@PrimaryKeyJoinColumn
	public Alumnus getAlumnus() {
		return alumnus;
	}

	public void setAlumnus(Alumnus alumnus) {
		this.alumnus = alumnus;
	}

	public String getEducationHistory() {
		return educationHistory;
	}

	public void setEducationHistory(String educationHistory) {
		this.educationHistory = educationHistory;
	}

	public String getLanguageSkills() {
		return languageSkills;
	}

	public void setLanguageSkills(String languageSkills) {
		this.languageSkills = languageSkills;
	}
	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public String getResearchActivities() {
		return researchActivities;
	}

	public void setResearchActivities(String researchActivities) {
		this.researchActivities = researchActivities;
	}

	public String getBusinessActivities() {
		return businessActivities;
	}

	public void setBusinessActivities(String businessActivities) {
		this.businessActivities = businessActivities;
	}
}
