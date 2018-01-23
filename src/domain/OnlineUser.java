package domain;


public class OnlineUser {
	public Long uid;
	public String username;
	
	public OnlineUser(){}
	public OnlineUser(Long uid, String username) {
		this.uid = uid;
		this.username = username;
	}
}
