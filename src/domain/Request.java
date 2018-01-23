package domain;

import javax.persistence.Entity;
import javax.persistence.Table;

import domain.parent.RequestParent;

@Entity
@Table(name = "request")
public class Request extends RequestParent {
	
}
