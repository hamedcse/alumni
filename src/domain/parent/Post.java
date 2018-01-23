package domain.parent;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="post")
@Inheritance(strategy=InheritanceType.JOINED)
public class Post {
	private long id;
	private String title;
	private String text;
	private String authorDetail;
	private long authorID;
	private long creationDate;
	private long deletionDate;
	private Boolean deleted = false; 
	private Map<String, Comment> comments = new HashMap<String, Comment>();
	
	@Id
	@GeneratedValue()
	@Column(name="post_id")
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "post")
	public Map<String, Comment> getComments() {
		return comments;
	}
	public void setComments(Map<String, Comment> comments) {
		this.comments = comments;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getAuthorDetail() {
		return authorDetail;
	}
	public void setAuthorDetail(String authorDetail) {
		this.authorDetail = authorDetail;
	}
	public long getAuthorID() {
		return authorID;
	}
	public void setAuthorID(long authorID) {
		this.authorID = authorID;
	}
	public long getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(long creationDate) {
		this.creationDate = creationDate;
	}
	public Boolean getDeleted() {
		return deleted;
	}
	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
	}
	public long getDeletionDate() {
		return deletionDate;
	}
	public void setDeletionDate(long deletionDate) {
		this.deletionDate = deletionDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
}
