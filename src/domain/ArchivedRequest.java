package domain;

import javax.persistence.Entity;
import javax.persistence.Table;

import util.PersianCalendare;
import domain.parent.RequestParent;
import exceptions.InvalidDate;

@Entity
@Table(name = "request_archive")
public class ArchivedRequest extends RequestParent{
	private long archiveDate;
	
	public ArchivedRequest(){super();}
	public ArchivedRequest(Request request){
		super();
		try {this.setArchiveDate(PersianCalendare.getCurrentShamsiDateInLong());} catch (InvalidDate e) {}
		this.setCreationDate(request.getCreationDate());
		this.setIsCancelledBySource(request.getIsCancelledBySource());
		this.setSourceDetail(request.getSourceDetail());
		this.setSourceID(request.getSourceID());
		this.setSourceStatus(request.getSourceStatus());
		this.setSourceType(request.getSourceType());
		this.setStatus(request.getStatus());
		this.setTargetDetail(request.getTargetDetail());
		this.setTargetID(request.getTargetID());
		this.setTargetStatus(request.getTargetStatus());
		this.setTargetType(request.getTargetType());
		this.setTitle(request.getTitle());
		this.setUpdationDate(request.getUpdationDate());
	}
	
	public long getArchiveDate() {
		return archiveDate;
	}
	public void setArchiveDate(long archiveDate) {
		this.archiveDate = archiveDate;
	}
}
