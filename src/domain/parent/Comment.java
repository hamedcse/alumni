package domain.parent;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;


@Entity
@Table(name = "comment")
public class Comment {
	private long id;
	private String writerDetail;
	private long writerID;
	private String text;
	private long creationDate;
	private Post post;
	
	@Id
	@GeneratedValue()
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getWriterDetail() {
		return writerDetail;
	}
	public void setWriterDetail(String writerDetail) {
		this.writerDetail = writerDetail;
	}
	public long getWriterID() {
		return writerID;
	}
	public void setWriterID(long writerID) {
		this.writerID = writerID;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public long getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(long creationDate) {
		this.creationDate = creationDate;
	}
	
	
}
