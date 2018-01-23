package session;

import java.util.HashMap;

import domain.OnlineUser;


public class SessionManager {
	private static HashMap<Long,OnlineUser> onlineAlumnus = new HashMap<Long,OnlineUser>();
	
	public synchronized static void add(OnlineUser user){
		onlineAlumnus.put(user.uid, user);
	}
	
	public synchronized static void remove(Long uid){
		onlineAlumnus.remove(uid);
	}

	public synchronized static OnlineUser get(Long uid) {
		return onlineAlumnus.get(uid);
	}
	
	public synchronized static int getCount() {
		return onlineAlumnus.size();
	}
	
}
