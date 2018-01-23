package domain.parent;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class RequestParent {
	private long id;
	private String title;
	private long sourceID;
	private String sourceType;
	private String sourceStatus;
	private String sourceDetail;
	private long targetID;
	private String targetType;
	private String targetStatus;
	private String targetDetail;
	private int status; // 0 = pending, -1 = rejected, 1 = confirmed , 2 = deleted , 3 = cancel by source
	private long creationDate;
	private long updationDate;
	private Boolean isCancelledBySource;
	
	@Id
	@GeneratedValue()
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getSourceID() {
		return sourceID;
	}
	public void setSourceID(long sourceID) {
		this.sourceID = sourceID;
	}
	public String getSourceType() {
		return sourceType;
	}
	public void setSourceType(String sourceType) {
		this.sourceType = sourceType;
	}
	public String getSourceStatus() {
		return sourceStatus;
	}
	public void setSourceStatus(String sourceStatus) {
		this.sourceStatus = sourceStatus;
	}
	public String getSourceDetail() {
		return sourceDetail;
	}
	public void setSourceDetail(String sourceDetail) {
		this.sourceDetail = sourceDetail;
	}
	public long getTargetID() {
		return targetID;
	}
	public void setTargetID(long targetID) {
		this.targetID = targetID;
	}
	public String getTargetType() {
		return targetType;
	}
	public void setTargetType(String targetType) {
		this.targetType = targetType;
	}
	public String getTargetStatus() {
		return targetStatus;
	}
	public void setTargetStatus(String targetStatus) {
		this.targetStatus = targetStatus;
	}
	public String getTargetDetail() {
		return targetDetail;
	}
	public void setTargetDetail(String targetDetail) {
		this.targetDetail = targetDetail;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Boolean getIsCancelledBySource() {
		return isCancelledBySource;
	}
	public void setIsCancelledBySource(Boolean isCancelledBySource) {
		this.isCancelledBySource = isCancelledBySource;
	}
	public long getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(long creationDate) {
		this.creationDate = creationDate;
	}
	public long getUpdationDate() {
		return updationDate;
	}
	public void setUpdationDate(long updationDate) {
		this.updationDate = updationDate;
	}
}
