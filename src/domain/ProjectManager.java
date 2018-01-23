package domain;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import domain.parent.UserParent;

@Entity
@Table(name = "project_manager")
public class ProjectManager extends UserParent {
	private String aboutMe;
	private Map<Long,Project>  projects = new HashMap<Long,Project>();
	private Map<Long,InboxMessage> inbox = new HashMap<Long,InboxMessage>();
	private Map<Long,SentMessage> sentbox = new HashMap<Long,SentMessage>();
	private Map<Long,ArchivedMessage> trash = new HashMap<Long,ArchivedMessage>();

	public String getAboutMe() {
		return aboutMe;
	}
	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}
	@OneToMany(fetch = FetchType.LAZY)
	@JoinTable(
			name = "project_manager__rel__inbox", 
			joinColumns = { @JoinColumn(name = "project_manager_id", referencedColumnName = "id") }, 
			inverseJoinColumns = { @JoinColumn(name = "inbox_id", referencedColumnName = "id") }
	)
	public Map<Long, InboxMessage> getInbox() {
		return inbox;
	}
	public void setInbox(Map<Long, InboxMessage> inbox) {
		this.inbox = inbox;
	}
	@OneToMany(fetch = FetchType.LAZY)
	@JoinTable(
			name = "project_manager__rel__sentbox", 
			joinColumns = { @JoinColumn(name = "project_manager_id", referencedColumnName = "id") }, 
			inverseJoinColumns = { @JoinColumn(name = "sentbox_id", referencedColumnName = "id") }
	)
	public Map<Long, SentMessage> getSentbox() {
		return sentbox;
	}
	public void setSentbox(Map<Long, SentMessage> sentbox) {
		this.sentbox = sentbox;
	}
	@OneToMany(fetch = FetchType.LAZY)
	@JoinTable(
			name = "project_manager__rel__trashbox", 
			joinColumns = { @JoinColumn(name = "project_manager_id", referencedColumnName = "id") }, 
			inverseJoinColumns = { @JoinColumn(name = "trashbox_id", referencedColumnName = "id") }
	)
	public Map<Long, ArchivedMessage> getTrash() {
		return trash;
	}
	public void setTrash(Map<Long, ArchivedMessage> trash) {
		this.trash = trash;
	}
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "projectManager")
	public Map<Long,Project> getProjects() {
		return projects;
	}
	public void setProjects(Map<Long,Project> projects) {
		this.projects = projects;
	}
}
