package websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/websocket/chat/{username}")
public class ChatServer {
	private String prefix = "Guest";
	private static int cnt = 0;
	private static List<ChatServer> clients = new ArrayList<ChatServer>();
	private Session session;
	private String name; 
	
	public ChatServer() {
		String threadName = "Thread Name : " + Thread.currentThread().getName();
		name = prefix + " " + ++cnt;
		//System.out.println(threadName + " : " + name);
	}
	
	@OnOpen
	public void start(Session session, @PathParam("username") String username) {//세션이 자바 통신에서의 소켓역할
		//System.out.println("클라이언트 접속 : " + username);
		name=username;
		this.session = session;
		clients.add(this);
		String message = name + "님이 접속했습니다.";
		//broadcast(message);
	} 
	
	@OnClose
	public void end() {
		clients.remove(this);
		String message = name + "님이 종료했습니다";
		//broadcast(message);
	}
	
	@OnMessage
	public void incoming(String msg, Session session) {
		if(msg ==null || msg.trim().equals("")) {
			return;
		} 
		
			/*
			synchronized(clients) {
	            for(ChatServer client : clients) {
	                if(!client.session.equals(session)) {
	                    try {
							client.session.getBasicRemote().sendText(msg);
						} catch (IOException e) {
							e.printStackTrace();
						}
	                }
	            }
	        }
			*/
			broadcast(msg);
		
	}
	
	@OnError
	public void error(Throwable t) {
		//System.out.println("에러 발생 : " + t.toString());
	}
	
	public void broadcast(String message) {
		for(int i =0; i<clients.size(); i++) {
			ChatServer client = clients.get(i);
			
			try {
				synchronized(client){
					client.session.getBasicRemote().sendText(message);
				}
			}catch (IllegalStateException e) {
				//메세지 송신중인 동시에 수신을 하는 경우
				if(e.getMessage().indexOf("[TEXT_FULL_WRITING]") != -1) {
					new Thread() {
						public void run() {
							while(true) {
								try {
									client.session.getBasicRemote().sendText(message);
									break;
								}catch(IllegalStateException ee) {
									try {
										Thread.sleep(1000);
									}catch(InterruptedException ie) {
										//ie.printStackTrace();
									}
								}catch(IOException ie) {
									//ie.printStackTrace();
								}
							}
						}
					}.start();
				}
			} 
			catch (Exception e) {
				System.out.println("강제 종료 : " + e.getMessage());
				clients.remove(this);
				try {
					client.session.close();
				}catch(IOException el) {
					//el.printStackTrace();
				}
				String msg = name  +"강제 종료햇습니다";
				broadcast(msg);
			}
			
		}
	}
	
}//class
