package Initializing;

import hibernate.HibernateUtil;

import org.hibernate.Session;

import domain.Admin;
import domain.Alumnus;
import domain.Project;
import domain.ProjectManager;



public class Users {

	public static void main(String[] args) {
		Session session = null;
		try{
			session = HibernateUtil.getSession();
			session.beginTransaction();
			Alumnus alumnus = new Alumnus();
			alumnus.setIsActive(true);
			alumnus.setDeleted(false);
			alumnus.setUsername("hamed");
			alumnus.setPassword("03015100fe467a977a9f4cd613f6b2796c323a33");
			alumnus.setName("حامد");
			alumnus.setFamily("قزلباش");
			session.save(alumnus);
			Admin admin = new Admin();
			admin.setIsActive(true);
			admin.setDeleted(false);
			admin.setUsername("admin");
			admin.setPassword("03015100fe467a977a9f4cd613f6b2796c323a33");
			admin.setName("مدیر");
			admin.setFamily("سامانه");
			session.save(admin);
			ProjectManager projectManager = new ProjectManager();
			projectManager.setIsActive(true);
			projectManager.setDeleted(false);
			projectManager.setName("name");
			projectManager.setFamily("family");
			projectManager.setAboutMe("about me");
			Project project = new Project();	
			project.setDescription("description");
			project.setProjectManager(projectManager);
			project.setIsCompleted(false);
			project.setIsDeleted(false);
			project.setTitle("title");
			session.save(projectManager);
			session.save(project);
			session.getTransaction().commit();
		}catch(Exception e){
			e.printStackTrace();
		} finally{
			if (session != null)
				if (session.isOpen())
					session.getTransaction().rollback();
		}
	}

}
