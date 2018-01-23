package domain.parent;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class MessageParent {
	private long id;
	private long senderID;
	private String senderDetail;
	private String senderUsername;
	private long reciverID;
	private String reciverDetail;
	private String reciverUsername;
	private String title;
	private String body;
	private long date;
	private String time;
	private Boolean isRead = false;
	
	@Id
	@GeneratedValue()
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getSenderID() {
		return senderID;
	}

	public void setSenderID(long senderID) {
		this.senderID = senderID;
	}

	public String getSenderDetail() {
		return senderDetail;
	}

	public void setSenderDetail(String senderDetail) {
		this.senderDetail = senderDetail;
	}

	public String getSenderUsername() {
		return senderUsername;
	}

	public void setSenderUsername(String senderUsername) {
		this.senderUsername = senderUsername;
	}

	public long getReciverID() {
		return reciverID;
	}

	public void setReciverID(long reciverID) {
		this.reciverID = reciverID;
	}

	public String getReciverDetail() {
		return reciverDetail;
	}

	public void setReciverDetail(String reciverDetail) {
		this.reciverDetail = reciverDetail;
	}

	public String getReciverUsername() {
		return reciverUsername;
	}

	public void setReciverUsername(String reciverUsername) {
		this.reciverUsername = reciverUsername;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public long getDate() {
		return date;
	}

	public void setDate(long date) {
		this.date = date;
	}

	public Boolean getIsRead() {
		return isRead;
	}

	public void setIsRead(Boolean isRead) {
		this.isRead = isRead;
	}
		
}
