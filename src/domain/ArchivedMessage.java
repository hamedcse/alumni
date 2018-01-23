package domain;

import javax.persistence.Entity;
import javax.persistence.Table;

import domain.parent.MessageParent;

@Entity
@Table(name = "message_archive")
public class ArchivedMessage extends MessageParent {
	private long archiveDate;
	
	public long getArchiveDate() {
		return archiveDate;
	}

	public void setArchiveDate(long archiveDate) {
		this.archiveDate = archiveDate;
	}

}
