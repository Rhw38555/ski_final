package handler.member;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import member.LogonDao;

@Controller
public class MemberFindPasswdProHandler implements CommandHandler{

	@Resource
	private LogonDao logonDao;	
	
	@RequestMapping( "/memberFindPasswdPro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String passwd="nonPasswd";
			      String to1=email; // 인증위해 사용자가 입력한 이메일주소
			      String host="smtp.gmail.com"; // smtp 서버
			      String subject="비밀번호 전달"; // 보내는 제목 설정
			      String fromName="관리자"; // 보내는 이름 설정
			      String from="nhwoo38555@gamil.com"; // 보내는 사람(구글계정)
			      
			      Map<String, String> map = new HashMap<String,String>();
				  map.put("id", id);
				  map.put("email", email);
				  
				  passwd= logonDao.findPasswd(map);// 아이디 보내주기
			      String content="비밀번호 ["+passwd+"]"; // 이메일 내용 설정
			      
			        // SMTP 이용하기 위해 설정해주는 설정값들
			      try{
			      Properties props=new Properties();
			      props.put("mail.smtp.starttls.enable", "true");
			      props.put("mail.transport.protocol", "smtp");
			      props.put("mail.smtp.host", host);
			      props.setProperty
			                       ("mail.smtp.socketFactory.class",
			                        "javax.net.ssl.SSLSocketFactory");
			      props.put("mail.smtp.port","465");
			      props.put("mail.smtp.user",from);
			      props.put("mail.smtp.auth","true");
			      
			      Session mailSession 
			           = Session.getInstance(props,new javax.mail.Authenticator(){
			             protected PasswordAuthentication getPasswordAuthentication(){
			                return new PasswordAuthentication
			                                        ("nhwoo38555@gmail.com","we34r2930@"); // gmail계정
			         }
			      });
			      
			      Message msg = new MimeMessage(mailSession);
			      InternetAddress []address1 = {new InternetAddress(to1)};
			      msg.setFrom(new InternetAddress
			                      (from, MimeUtility.encodeText(fromName,"utf-8","B")));
			      msg.setRecipients(Message.RecipientType.TO, address1); // 받는사람 설정
			      msg.setSubject(subject); // 제목설정
			      msg.setSentDate(new java.util.Date()); // 보내는 날짜 설정
			      msg.setContent(content,"text/html; charset=utf-8"); // 내용설정
			      
			         if(!passwd.equals("nonPasswd")) {
			            Transport.send(msg); // 메일보내기
			         }
			      
			      }catch(MessagingException e){
			         e.printStackTrace();
			      }catch(Exception e){
			         e.printStackTrace();
			      }
		request.setAttribute("passwd", passwd);	      
		
		return new ModelAndView( "member/memberFindPasswdPro" );
	}

}
