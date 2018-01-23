package domain.parent;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import domain.Project;

@Entity
@Table(name = "project_post")
@PrimaryKeyJoinColumn(name="post_id")
public class ProjectPost  extends Post{
	private Project  relatedProject;

	@ManyToOne(fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	public Project getRelatedProject() {
		return relatedProject;
	}

	public void setRelatedProject(Project relatedProject) {
		this.relatedProject = relatedProject;
	}

	
}
