package domain.parent;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import domain.ArchivedMessage;
import domain.ArchivedRequest;
import domain.InboxMessage;
import domain.Project;
import domain.Request;
import domain.Resume;
import domain.SentMessage;
import domain.Skill;

@Entity
@Table(name = "alumnus_archive")
public class ArchivedAlumnus{
	private long id;
	private String username;
	private String password;
	private String name;
	private String family;
	private long registerDate;
	private long deletionDate;
	private String email;
	private Boolean deleted;
	private Boolean isActive;
	private String field;
	private String college;
	private	long yearOfGraduation;
	private String city;
	private String state;
	private long birthDate;
	private String gender;
	private String educationLevel;
	private String average;
	private String cellNumber;
	private String married;
	private String aboutMe;
	private Resume resume;
	private Map<Long,Skill> skills = new  HashMap<Long,Skill>();
	private Map<Long,ArchivedRequest> archivedRequests = new HashMap<Long,ArchivedRequest>();
	private Map<Long,InboxMessage> inbox = new HashMap<Long,InboxMessage>();
	private Map<Long,SentMessage> sentbox = new HashMap<Long,SentMessage>();
	private Map<Long,ArchivedMessage> trash = new HashMap<Long,ArchivedMessage>();
	private Map<Long,Project> projects = new HashMap<Long,Project>();
	//private Map<Long,ArchivedAlumnus> classmates = new HashMap<Long,ArchivedAlumnus>();
	private long archiveDate;
	private Map<Long,Request> recivedRequests = new HashMap<Long,Request>();
	private Map<Long,Request> sentRequests = new HashMap<Long,Request>();
	
	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Boolean getDeleted() {
		return deleted;
	}
	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
	}
	public Boolean getIsActive() {
		return isActive;
	}
	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
	public long getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(long registerDate) {
		this.registerDate = registerDate;
	}
	public long getDeletionDate() {
		return deletionDate;
	}
	public void setDeletionDate(long deletionDate) {
		this.deletionDate = deletionDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFamily() {
		return family;
	}
	public void setFamily(String family) {
		this.family = family;
	}
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEducationLevel() {
		return educationLevel;
	}
	public void setEducationLevel(String educationLevel) {
		this.educationLevel = educationLevel;
	}
	public String getCellNumber() {
		return cellNumber;
	}
	public void setCellNumber(String cellNumber) {
		this.cellNumber = cellNumber;
	}
	public String getMarried() {
		return married;
	}
	public void setMarried(String married) {
		this.married = married;
	}

	public String getField() {
		return field;
	}


	public void setField(String field) {
		this.field = field;
	}


	public String getCollege() {
		return college;
	}


	public void setCollege(String college) {
		this.college = college;
	}
	
	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public String getAverage() {
		return average;
	}


	public void setAverage(String average) {
		this.average = average;
	}

	public String getAboutMe() {
		return aboutMe;
	}

	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}

	public long getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(long birthDate) {
		this.birthDate = birthDate;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "relatedAlumnus")
	public Map<Long, Skill> getSkills() {
		return skills;
	}

	public void setSkills(Map<Long, Skill> skills) {
		this.skills = skills;
	}

	@OneToMany(fetch = FetchType.LAZY)
	@JoinTable()
	public Map<Long, ArchivedRequest> getArchivedRequests() {
		return archivedRequests;
	}

	public void setArchivedRequests(Map<Long, ArchivedRequest> archivedRequests) {
		this.archivedRequests = archivedRequests;
	}
	
	@OneToMany(fetch = FetchType.LAZY)
	@JoinTable()
	public Map<Long, InboxMessage> getInbox() {
		return inbox;
	}

	public void setInbox(Map<Long, InboxMessage> inbox) {
		this.inbox = inbox;
	}

	@OneToMany(fetch = FetchType.LAZY)
	@JoinTable()
	public Map<Long, SentMessage> getSentbox() {
		return sentbox;
	}

	public void setSentbox(Map<Long, SentMessage> sentbox) {
		this.sentbox = sentbox;
	}

	@OneToMany(fetch = FetchType.LAZY)
	@JoinTable()
	public Map<Long, ArchivedMessage> getTrash() {
		return trash;
	}

	public void setTrash(Map<Long, ArchivedMessage> trash) {
		this.trash = trash;
	}

	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(name = "alumnus_rel_project", joinColumns = { 
			@JoinColumn(name = "alumnus_id", nullable = false, updatable = false) }, 
			inverseJoinColumns = { @JoinColumn(name = "project_id", nullable = false, updatable = false) }
	)
	public Map<Long, Project> getProjects() {
		return projects;
	}

	public void setProjects(Map<Long, Project> projects) {
		this.projects = projects;
	}

	@OneToOne(mappedBy="alumnus",fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	public Resume getResume() {
		return resume;
	}

	public void setResume(Resume resume) {
		this.resume = resume;
	}

	public long getYearOfGraduation() {
		return yearOfGraduation;
	}

	public void setYearOfGraduation(long yearOfGraduation) {
		this.yearOfGraduation = yearOfGraduation;
	}
	@OneToMany(fetch = FetchType.LAZY)
	@JoinTable(
			name = "alumnus_archive__rel__recived_request", 
			joinColumns = { @JoinColumn(name = "alumnus_archive_id", referencedColumnName = "id") }, 
			inverseJoinColumns = { @JoinColumn(name = "recived_request_id", referencedColumnName = "id") }
	)
	public Map<Long, Request> getRecivedRequests() {
		return recivedRequests;
	}
	public void setRecivedRequests(Map<Long, Request> recivedRequests) {
		this.recivedRequests = recivedRequests;
	}
	@OneToMany(fetch = FetchType.LAZY)
	@JoinTable(
			name = "alumnus_archive__rel__sent_request", 
			joinColumns = { @JoinColumn(name = "alumnus_archive_id", referencedColumnName = "id") }, 
			inverseJoinColumns = { @JoinColumn(name = "sent_request_id", referencedColumnName = "id") }
	)
	public Map<Long, Request> getSentRequests() {
		return sentRequests;
	}
	public void setSentRequests(Map<Long, Request> sentRequests) {
		this.sentRequests = sentRequests;
	}
	public long getArchiveDate() {
		return archiveDate;
	}
	public void setArchiveDate(long archiveDate) {
		this.archiveDate = archiveDate;
	}
	
}
