package database;

import hibernate.HibernateUtil;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import org.hibernate.Criteria;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import domain.Admin;
import domain.Alumnus;
import domain.ArchivedMessage;
import domain.ArchivedRequest;
import domain.Category;
import domain.College;
import domain.Field;
import domain.InboxMessage;
import domain.Project;
import domain.ProjectManager;
import domain.Request;
import domain.Resume;
import domain.SentMessage;
import domain.Skill;
import exceptions.NoSuchCategory;
import exceptions.NoSuchCollege;
import exceptions.NoSuchField;
import exceptions.NoSuchMessage;
import exceptions.NoSuchProject;
import exceptions.NoSuchRequest;
import exceptions.NoSuchResume;
import exceptions.NoSuchSkill;
import exceptions.NoSuchUser;


public class DataBase {
//-----------------------------------------------------------------------------------------------------//
// Start Loads:
	public synchronized static Alumnus getAlumnusByUsername(String username) throws Exception,NoSuchUser{
		Session session = null;
			session = HibernateUtil.getSession();
			
			Query query = session.createQuery("FROM Alumnus a WHERE a.username=:usr AND a.deleted = false");
			query.setParameter("usr", username);
			Alumnus result = 	(Alumnus) query.setMaxResults(1).uniqueResult();
			
			if(result == null){
				throw new NoSuchUser();
			}
			return result;
	}
	
	public synchronized static Alumnus getAlumnusByID(long uid) throws Exception,NoSuchUser{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
				Query query = session.createQuery("FROM Alumnus a WHERE a.id=:id AND a.deleted = false");
				query.setParameter("id", uid);
				Alumnus result = 	(Alumnus) query.setMaxResults(1).uniqueResult();
			
			if(result == null){
				throw new NoSuchUser();
			}
			return result;
		
	}
	
	public synchronized static Collection<Alumnus> getAlumnusListBySearchParam
		(String name, String family, String yearOfGraduation, String field, String college, String city, String state, String educationLevel) 
			throws Exception,NoSuchUser{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
				String queryString = "FROM Alumnus a WHERE ( " +
										"a.name "+((name.equalsIgnoreCase("") || name == null) ? " not like" : " like " )+" '%"+name+"%' OR " +
										"a.family "+((family.equalsIgnoreCase("") || family == null) ? " not like" : " like " )+" '%"+family+"%' OR " +
										"a.yearOfGraduation "+((yearOfGraduation.equalsIgnoreCase("") || yearOfGraduation == null) ? " not like" : " like " )+" '%"+yearOfGraduation+"%' OR " +
										"a.field "+((field.equalsIgnoreCase("") || field == null) ? " not like" : " like " )+" '%"+field+"%' OR " +
										"a.college "+((college.equalsIgnoreCase("") || college == null) ? " not like" : " like " )+" '%"+college+"%' OR " +
										"a.city "+((city.equalsIgnoreCase("") || city == null) ? " not like" : " like " )+" '%"+city+"%' OR " +
										"a.state "+((state.equalsIgnoreCase("") || state == null) ? " not like" : " like " )+" '%"+state+"%' OR " +
										"a.educationLevel "+((educationLevel.equalsIgnoreCase("") || educationLevel == null) ? " not like" : " like " )+" '%"+educationLevel+"%' ) ";
				Query query = session.createQuery(queryString);
				Collection<Alumnus> result =  query.list();
			
			if(result == null || result.size() == 0){
				throw new NoSuchUser();
			}
			return result;
		
	}
	
	public synchronized static Collection<Alumnus> getAllAlumnusList() throws Exception,NoSuchUser{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
				Query query = session.createQuery("FROM Alumnus a WHERE a.deleted=false");
				Collection<Alumnus> result =  query.list();
			
			if(result == null || result.size() == 0){
				throw new NoSuchUser();
			}
			return result;
		
	}
	
	/*public synchronized static Collection<ArchivedAlumnus> getArchivedAlumnusListBySearchParam
	(String name, String family, String yearOfGraduation, String field, String college, String city, String state, String educationLevel) 
		throws Exception,NoSuchUser{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
				String queryString = "FROM ArchivedAlumnus ar WHERE ( " +
										"ar.name "+((name.equalsIgnoreCase("") || name == null) ? " not like" : " like " )+" '%"+name+"%' OR " +
										"ar.family "+((family.equalsIgnoreCase("") || family == null) ? " not like" : " like " )+" '%"+family+"%' OR " +
										"ar.yearOfGraduation "+((yearOfGraduation.equalsIgnoreCase("") || yearOfGraduation == null) ? " not like" : " like " )+" '%"+yearOfGraduation+"%' OR " +
										"ar.field "+((field.equalsIgnoreCase("") || field == null) ? " not like" : " like " )+" '%"+field+"%' OR " +
										"ar.college "+((college.equalsIgnoreCase("") || college == null) ? " not like" : " like " )+" '%"+college+"%' OR " +
										"ar.city "+((city.equalsIgnoreCase("") || city == null) ? " not like" : " like " )+" '%"+city+"%' OR " +
										"ar.state "+((state.equalsIgnoreCase("") || state == null) ? " not like" : " like " )+" '%"+state+"%' OR " +
										"ar.educationLevel "+((educationLevel.equalsIgnoreCase("") || educationLevel == null) ? " not like" : " like " )+" '%"+educationLevel+"%' ) ";
				Query query = session.createQuery(queryString);
				Collection<ArchivedAlumnus> result =  query.list();
			
			if(result == null || result.size() == 0){
				throw new NoSuchUser();
			}
			return result;
		
	}*/
	

	
	/*public synchronized static Collection<ArchivedAlumnus> getAllArchivedAlumnusList() throws Exception,NoSuchUser{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
				Query query = session.createQuery("FROM ArchivedAlumnus ar WHERE ar.deleted=false");
				Collection<ArchivedAlumnus> result =  query.list();
			
			if(result == null || result.size() == 0){
				throw new NoSuchUser();
			}
			return result;
		
	}*/
	
	public synchronized static Map<Long, Alumnus> getAlumnusListForSentMessage(String searchTerm) throws Exception,NoSuchUser{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
				String newSearchTerm = new String(searchTerm);
				String queryString = "FROM Alumnus a WHERE ( " +
											"a.username like '%"+newSearchTerm+"%' OR " +
											"a.name like '%"+newSearchTerm+"%' OR " +
											"a.family like '%"+newSearchTerm+"%' ) AND" +
													"  a.deleted = false";
				Query query = session.createQuery(queryString);
				Collection<Alumnus> resultCollection =  query.list();
				Map<Long, Alumnus> result = new HashMap<Long, Alumnus>();
				for (Alumnus a : resultCollection) {
					result.put(a.getId(), a);
				}
			
			if(result == null || result.size() == 0){
				throw new NoSuchUser();
			}
			return result;
		
	}
	
	public synchronized static Admin getAdminByUsername(String username) throws Exception,NoSuchUser{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
				Query query = session.createQuery("FROM Admin a WHERE a.username=:usr AND a.deleted = false");
				query.setParameter("usr", username);
				Admin result = 	(Admin) query.setMaxResults(1).uniqueResult();
			
			if(result == null){
				throw new NoSuchUser();
			}
			return result;
		
	}
	
	public synchronized static Admin getAdminByID(long aid) throws Exception,NoSuchUser{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
				Query query = session.createQuery("FROM Admin a WHERE a.id=:aid AND a.deleted = false");
				query.setParameter("aid", aid);
				Admin result = 	(Admin) query.setMaxResults(1).uniqueResult();
			
			if(result == null){
				throw new NoSuchUser();
			}
			return result;
		
	}
	
	public synchronized static ProjectManager getProjectManagerByUsername(String username) throws Exception,NoSuchUser{
		Session session = null;		
			session = HibernateUtil.getSession();
				Query query = session.createQuery("FROM ProjectManager pm WHERE pm.username=:usr AND pm.deleted = false");
				query.setParameter("usr", username);
				ProjectManager result = 	(ProjectManager) query.setMaxResults(1).uniqueResult();
			if(result == null){
				throw new NoSuchUser();
			}
			return result;
		
	}
	
	public synchronized static ProjectManager getProjectManagerByID(long pmid) throws Exception,NoSuchUser{
		Session session = null;		
			session = HibernateUtil.getSession();
				Query query = session.createQuery("FROM ProjectManager pm WHERE pm.id=:pmid AND pm.deleted = false");
				query.setParameter("pmid", pmid);
				ProjectManager result = 	(ProjectManager) query.setMaxResults(1).uniqueResult();
			if(result == null){
				throw new NoSuchUser();
			}
			return result;
		
	}
	
	public synchronized static SentMessage getSentMessageByID(long sid) throws Exception,NoSuchMessage{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
				Query query = session.createQuery("FROM SentMessage s WHERE s.id=:sid");
				query.setParameter("sid", sid);
				SentMessage result = 	(SentMessage) query.setMaxResults(1).uniqueResult();
			
			if(result == null){
				throw new NoSuchMessage();
			}
			return result;
		
		
	}
	
	public synchronized static InboxMessage getInboxMessageByID(long iid) throws Exception,NoSuchMessage{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
				Query query = session.createQuery("FROM InboxMessage i WHERE i.id=:iid");
				query.setParameter("iid", iid);
				InboxMessage result = 	(InboxMessage) query.setMaxResults(1).uniqueResult();
			
			if(result == null){
				throw new NoSuchMessage();
			}
			return result;
		
	}
	
	public synchronized static Collection<InboxMessage> getInboxMessagesOfAlumnusByParameter(long aid,String titleAndBody,String sender, String reciver)
			throws Exception,NoSuchMessage{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
				if (reciver.equalsIgnoreCase("")) reciver = "_not_defined_";
				if (sender.equalsIgnoreCase("")) sender = "_not_defined_";
				if (titleAndBody.equalsIgnoreCase("")) titleAndBody = "_not_defined_";
				String queryString = "FROM InboxMessage i WHERE " +
									  " i.reciverID = "+aid+" AND ( " +
									  " i.senderUsername like '%"+sender+"%' OR  i.reciverUsername like '%"+reciver+"%' OR  " +
									  " i.title like '%"+titleAndBody+"%' OR  i.body like '%"+titleAndBody+"%' ) ";
				Query query = session.createQuery(queryString);
				 Collection<InboxMessage> result = query.list();
			
			if(result == null || result.size() == 0){
				throw new NoSuchMessage();
			}
			return result;
		
	}
	
	public synchronized static Collection<SentMessage> getSentMessagesOfAlumnusByParameter(long aid,String titleAndBody,String sender, String reciver)
			throws Exception,NoSuchMessage{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
				if (reciver.equalsIgnoreCase("")) reciver = "_not_defined_";
				if (sender.equalsIgnoreCase("")) sender = "_not_defined_";
				if (titleAndBody.equalsIgnoreCase("")) titleAndBody = "_not_defined_";
				String queryString = "FROM SentMessage s WHERE " +
						 			  " s.senderID = "+aid+" AND ( " +
									  " s.senderUsername like '%"+sender+"%' OR  s.reciverUsername like '%"+reciver+"%' OR  " +
									  " s.title like '%"+titleAndBody+"%' OR  s.body like '%"+titleAndBody+"%' ) ";
				Query query = session.createQuery(queryString);
				 Collection<SentMessage> result = query.list();
			
			if(result == null || result.size() == 0){
				throw new NoSuchMessage();
			}
			return result;
		
	}
	
	public synchronized static Collection<ArchivedMessage> getArchivedMessagesOfAlumnusByParameter(long aid,String titleAndBody,String sender, String reciver)
			throws Exception,NoSuchMessage{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
				Collection<ArchivedMessage> result = new ArrayList<ArchivedMessage>();
				Map<Long, ArchivedMessage> alumnusTrash = new HashMap<Long, ArchivedMessage>();
				Query query = session.createQuery("FROM Alumnus a WHERE a.id=:id AND a.deleted = false");
				query.setParameter("id", aid);
				Alumnus alumnus = (Alumnus) query.setMaxResults(1).uniqueResult();
				alumnusTrash = alumnus.getTrash();
				for (Entry<Long, ArchivedMessage> tr : alumnusTrash.entrySet()) {
					//Long key = tr.getKey();
				    ArchivedMessage m = tr.getValue();
				    if (!titleAndBody.equalsIgnoreCase("") && m.getTitle().contains(titleAndBody)) {
						result.add(m);
					}
				    else if (!titleAndBody.equalsIgnoreCase("") && m.getBody().contains(titleAndBody)) {
						result.add(m);
					}
				    else if (m.getSenderUsername().equalsIgnoreCase(sender)) {
						result.add(m);
					}
				    else if (m.getReciverUsername().equalsIgnoreCase(reciver)) {
						result.add(m);
					}
				}
			
			if(result == null || result.size() == 0){
				throw new NoSuchMessage();
			}
			return result;
		
	}
	
	public synchronized static ArchivedMessage getArchivedMessageByID(long aid) throws Exception,NoSuchMessage{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
				Query query = session.createQuery("FROM ArchivedMessage a WHERE a.id=:aid");
				query.setParameter("aid", aid);
				ArchivedMessage result = 	(ArchivedMessage) query.setMaxResults(1).uniqueResult();
			
			if(result == null){
				throw new NoSuchMessage();
			}
			return result;
		
	}
	
	public synchronized static Request getRequestByID(long rid) throws Exception,NoSuchRequest{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
				Query query = session.createQuery("FROM Request r WHERE r.id=:rid");
				query.setParameter("rid", rid);
				Request result = 	(Request) query.setMaxResults(1).uniqueResult();
			
			if(result == null){
				throw new NoSuchRequest();
			}
			return result;
		
	}
	
	public synchronized static Request getRequestIfExist(long sourcID,long targetID, String title) throws Exception{
		Session session = null;
		session = HibernateUtil.getSession();
		Query query = session.createQuery("FROM Request r WHERE r.sourceID=:sourcID AND r.targetID=:targetID AND r.title=:title  ");
		query.setParameter("sourcID", sourcID);
		query.setParameter("targetID", targetID);
		query.setParameter("title", title);
		Request result = (Request) query.setMaxResults(1).uniqueResult();
		return result;
	}
	
	public synchronized static Collection<Request> getRequestsOfAlumnusByParameter(long aid, String title, String sourceDetail, String targetDetail) 
			throws Exception,NoSuchRequest{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
				Collection<Request> result = new ArrayList<Request>();
				Query query = session.createQuery("FROM Alumnus a WHERE a.id =:aid");
				query.setParameter("aid", aid);
				Alumnus alumnus =  (Alumnus) query.setMaxResults(1).uniqueResult();
				alumnus.getSentRequests().values().size();
				for (Request r : alumnus.getSentRequests().values()) {
					if (!title.equalsIgnoreCase("") && r.getTitle().contains(title)) {
						result.add(r);
					}else if (!sourceDetail.equalsIgnoreCase("") && r.getSourceDetail().contains(sourceDetail)) {
						result.add(r);
					}else if (!targetDetail.equalsIgnoreCase("") && r.getTargetDetail().contains(targetDetail)) {
						result.add(r);
					}
				}
			
			if(result == null || result.size() == 0){
				throw new NoSuchRequest();
			}
			return result;
		
	}
	
	public synchronized static Collection<ArchivedRequest> getArchivedRequestsOfAlumnusByParameter(long aid, String title, String sourceDetail, String targetDetail) 
			throws Exception,NoSuchRequest{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
				Collection<ArchivedRequest> result = new ArrayList<ArchivedRequest>();
				Query query = session.createQuery("FROM Alumnus a WHERE a.id =:aid");
				query.setParameter("aid", aid);
				Alumnus alumnus =  (Alumnus) query.setMaxResults(1).uniqueResult();
				alumnus.getArchivedRequests().values().size();
				for (ArchivedRequest r : alumnus.getArchivedRequests().values()) {
					if (!title.equalsIgnoreCase("") && r.getTitle().contains(title)) {
						result.add(r);
					}else if (!sourceDetail.equalsIgnoreCase("") && r.getSourceDetail().contains(sourceDetail)) {
						result.add(r);
					}else if (!targetDetail.equalsIgnoreCase("") && r.getTargetDetail().contains(targetDetail)) {
						result.add(r);
					}
				}
			
			if(result == null || result.size() == 0){
				throw new NoSuchRequest();
			}
			return result;
		
	}
	
	public synchronized static Resume getResumeByAlumnusID(long uid) throws Exception,NoSuchResume{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
				Query query = session.createQuery("FROM Resume r WHERE r.alumnus.id=:uid");
				query.setParameter("uid", uid);
				Resume result = 	(Resume) query.setMaxResults(1).uniqueResult();
			
			if(result == null){
				throw new NoSuchResume();
			}
			return result;
		
	}
	
	public synchronized static Collection<Skill> getSkillsOfAlumnusByAlumnusID(long uid) throws Exception,NoSuchSkill{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
				Query query = session.createQuery("FROM Skill s WHERE s.relatedAlumnus.id=:uid");
				query.setParameter("uid", uid);
				Collection<Skill> result =  query.list();
			
			if(result == null || result.size() == 0){
				throw new NoSuchSkill();
			}
			return result;
		
	}
	
	public synchronized static Skill getSkillsByID(long sid) throws Exception,NoSuchSkill{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
				Query query = session.createQuery("FROM Skill s WHERE s.id=:sid");
				query.setParameter("sid", sid);
				Skill result =  (Skill) query.setMaxResults(1).uniqueResult();
			
			if(result == null ){
				throw new NoSuchSkill();
			}
			return result;
		
	}
	
	public synchronized static Map<Long, Project> getProjectsByParameters(String title,String field,String category) throws Exception,NoSuchProject{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
			String queryString = "FROM Project j WHERE j.isDeleted = false AND " +
					" ( j.title like '%"+title+"%' OR j.field like  '%"+field+"%' OR  j.category like '%"+category+"%' ) ";
			
			Query query = session.createQuery(queryString);
			 Collection<Project> projects =  query.list();
			 Map<Long, Project> result = new HashMap<Long, Project>();
			 for (Project j : projects) {
				 result.put(j.getId(), j);
			}
			
			
			if(result.size() == 0){
				throw new NoSuchProject(); 
			}
			return result;
		
	}
	
	public synchronized static Project getProjectByID(long pid) throws Exception,NoSuchProject{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
			
			Query query = session.createQuery("FROM Project p WHERE p.id=:pid AND p.isDeleted = false ");
			query.setParameter("pid", pid);
			
			Project result =  (Project) query.setMaxResults(1).uniqueResult();
			
			
			if(result  == null){
				throw new NoSuchProject(); 
			}
			return result;
	}
	
	public synchronized static ArrayList<Project> getTopProjectByCount(int count) throws Exception{
		Session session = null;
		session = HibernateUtil.getSession();
		//Query query = session.createQuery("FROM Project p WHERE p.isDeleted = false ");
		Criteria criteria = session.createCriteria(Project.class);
		criteria.add(Restrictions.or(Restrictions.eq("isDeleted",new Boolean(false))));
		criteria.add(Restrictions.or(Restrictions.eq("isCompleted",new Boolean(false))));
		criteria.addOrder(Order.desc("id"));
		ArrayList<Project> result = (ArrayList<Project>) criteria.setMaxResults(count).list();
		return result;
	}
	
	public synchronized static Collection<Long>  getRequestedProjectsOfAlumnus(Alumnus alumnus) throws Exception,NoSuchRequest{
		Session session = null;
		Query query = null;
		
			session = HibernateUtil.getSession();
			
			session.lock(alumnus, LockMode.NONE);
			alumnus.getSentRequests().size();
			Map<Long, Request> sentRequests= alumnus.getSentRequests();
			Collection<Long> reuestedProjectsID= new ArrayList<Long>();
			for (Entry<Long, Request> e : sentRequests.entrySet()) {
			    Long key = e.getKey();
			    Request req = e.getValue();
			    if(req.getTargetType().equalsIgnoreCase(Project.class.getSimpleName())){
			    	reuestedProjectsID.add(req.getTargetID());
			    }
			}
			
			
			if(reuestedProjectsID.size() == 0){
				throw new NoSuchRequest();
			}
			return reuestedProjectsID;
	}
	
	public synchronized static Collection<Field> getAllFields() throws Exception,NoSuchField{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
			Query query = session.createQuery("FROM Field");
			Collection<Field> result =  query.list();
			
			if(result  == null || result.size() == 0){
				throw new NoSuchField(); 
			}
			return result;
	}
	
	public synchronized static Field getFieldByID(long fid) throws Exception,NoSuchField{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
			Query query = session.createQuery("FROM Field f WHERE f.id=:fid");
			query.setParameter("fid", fid);
			Field result =  (Field) query.setMaxResults(1).uniqueResult();
			
			if(result  == null){
				throw new NoSuchField(); 
			}
			return result;
	}
	
	public synchronized static Collection<College> getAllColleges() throws Exception,NoSuchCollege{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
			Query query = session.createQuery("FROM College");
			Collection<College> result =  query.list();
			
			if(result  == null || result.size() == 0){
				throw new NoSuchCollege(); 
			}
			return result;
	}
	
	public synchronized static College getCollegeByID(long cid) throws Exception,NoSuchCollege{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
			Query query = session.createQuery("FROM College c WHERE c.id=:cid");
			query.setParameter("cid", cid);
			College result =  (College) query.setMaxResults(1).uniqueResult();
			
			if(result  == null){
				throw new NoSuchCollege(); 
			}
			return result;
	}
	
	public synchronized static Collection<Category> getAllCategories() throws Exception,NoSuchCategory{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
			Query query = session.createQuery("FROM Category");
			Collection<Category> result =  query.list();
			
			if(result  == null || result.size() == 0){
				throw new NoSuchCategory(); 
			}
			return result;
	}
	
	public synchronized static Category getCategoryByID(long cid) throws Exception,NoSuchCategory{
		Session session = null;
		
			session = HibernateUtil.getSession();
			
			Query query = session.createQuery("FROM Category c WHERE c.id=:cid");
			query.setParameter("cid", cid);
			Category result =  (Category) query.setMaxResults(1).uniqueResult();
			
			if(result  == null){
				throw new NoSuchCategory(); 
			}
			return result;
		
			
	}
	
// End Loads	
//-----------------------------------------------------------------------------------------------------//
// Start Save:	
	public synchronized static void saveObject(Object object) throws Exception{
		Session session = null;
		session = HibernateUtil.getSession();
		session.save(object);
	}
// End Save
//-----------------------------------------------------------------------------------------------------//
// Start Update:		
	public synchronized static void updateObject(Object object) throws Exception{
		Session session = null;
		session = HibernateUtil.getSession();
		session.update(object);
	}
// End Update
//-----------------------------------------------------------------------------------------------------//	
// Start SaveOrUpdate:		
	public synchronized static void saveOrUpdateObject(Object object) throws Exception{
		Session session = null;
		session = HibernateUtil.getSession();
		session.saveOrUpdate(object);
	}
// End SaveOrUpdate	
//-----------------------------------------------------------------------------------------------------//	
// Start Delete:
	public synchronized static void deleteObject(Object object) throws Exception{
		Session session = null;
		session = HibernateUtil.getSession();
		session.delete(object);
	}
// End Delete
//-----------------------------------------------------------------------------------------------------//
}
