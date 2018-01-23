package domain;

import javax.persistence.Entity;
import javax.persistence.Table;

import domain.parent.MessageParent;

@Entity
@Table(name = "inbox")
public class InboxMessage extends MessageParent {

}
