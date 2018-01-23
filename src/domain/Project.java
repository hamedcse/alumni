package domain;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.MapKey;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "project")
public class Project {
	private long id;
	private String title;
	private String description;
	private String projectCondition;
	private String genderType;
	private String salary;
	private String duration;
	private String place;
	private String category;
	private String field;
	private String college;
	private ProjectManager projectManager;
	private Map<Long,Alumnus> members = new  HashMap<Long,Alumnus>();
	private Map<Long,ArchivedRequest> archivedRequests = new HashMap<Long,ArchivedRequest>();
	/*private Map<Long,JobPost> posts = new HashMap<Long, JobPost>();*/
	private Boolean isDeleted;
	private Boolean isCompleted;
	private long creationDate;
	private long deletionDate;
	private String state;// @Transient
	private long stateID;//@Transient
	private String projectManagerDetail;//@Transient
	private Map<Long,Request> recivedRequests = new HashMap<Long,Request>();
	private Map<Long,Request> sentRequests = new HashMap<Long,Request>();

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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getGenderType() {
		return genderType;
	}
	public void setGenderType(String genderType) {
		this.genderType = genderType;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	
	public Boolean getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(Boolean isDeleted) {
		this.isDeleted = isDeleted;
	}
	public Boolean getIsCompleted() {
		return isCompleted;
	}
	public void setIsCompleted(Boolean isCompleted) {
		this.isCompleted = isCompleted;
	}
	public void setCreationDate(long creationDate) {
		this.creationDate = creationDate;
	}
	public void setDeletionDate(long deletionDate) {
		this.deletionDate = deletionDate;
	}
	public long getCreationDate() {
		return creationDate;
	}
	public long getDeletionDate() {
		return deletionDate;
	}
	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "projects")
	@MapKey
	public Map<Long, Alumnus> getMembers() {
		return members;
	}
	public void setMembers(Map<Long, Alumnus> members) {
		this.members = members;
	}
	@OneToMany(fetch = FetchType.LAZY)
	@JoinTable()
	public Map<Long, ArchivedRequest> getArchivedRequests() {
		return archivedRequests;
	}
	public void setArchivedRequests(Map<Long, ArchivedRequest> archivedRequests) {
		this.archivedRequests = archivedRequests;
	}
	/*@OneToMany(fetch = FetchType.LAZY, mappedBy = "relatedJob")
	public Map<Long,JobPost> getPosts() {
		return posts;
	}
	public void setPosts(Map<Long,JobPost> posts) {
		this.posts = posts;
	}*/
	@OneToMany(fetch = FetchType.LAZY)
	@JoinTable(
			name = "project__rel__recived_request", 
			joinColumns = { @JoinColumn(name = "project_id", referencedColumnName = "id") }, 
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
			name = "project__rel__sent_request", 
			joinColumns = { @JoinColumn(name = "project_id", referencedColumnName = "id") }, 
			inverseJoinColumns = { @JoinColumn(name = "sent_request_id", referencedColumnName = "id") }
	)
	public Map<Long, Request> getSentRequests() {
		return sentRequests;
	}
	public void setSentRequests(Map<Long, Request> sentRequests) {
		this.sentRequests = sentRequests;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	public ProjectManager getProjectManager() {
		return projectManager;
	}
	public void setProjectManager(ProjectManager projectManager) {
		this.projectManager = projectManager;
	}
	@Transient
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Transient
	public long getStateID() {
		return stateID;
	}
	public void setStateID(long stateID) {
		this.stateID = stateID;
	}
	@Transient
	public String getProjectManagerDetail() {
		return projectManagerDetail;
	}
	public void setProjectManagerDetail(String projectManagerDetail) {
		this.projectManagerDetail = projectManagerDetail;
	}
	public String getProjectCondition() {
		return projectCondition;
	}
	public void setProjectCondition(String projectCondition) {
		this.projectCondition = projectCondition;
	}
}
