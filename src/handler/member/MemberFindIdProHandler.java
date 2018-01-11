package handler.member;

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
public class MemberFindIdProHandler implements CommandHandler{

	@Resource
	private LogonDao logonDao;
	
	
	@RequestMapping( "/memberFindIdPro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
			

		String email = request.getParameter("email");
		String id="nonId";
		      String to1=email; // 인증위해 사용자가 입력한 이메일주소
		      String host="smtp.gmail.com"; // smtp 서버
		      String subject="아이디 전달"; // 보내는 제목 설정
		      String fromName="관리자"; // 보내는 이름 설정
		      String from="nhwoo38555@gamil.com"; // 보내는 사람(구글계정)   
		      id= logonDao.findId(email);// 아이디 보내주기
		      String content="아이디 ["+id+"]"; // 이메일 내용 설정
		      
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
		         if(!id.equals("nonId")) {
		            Transport.send(msg); // 메일보내기
		         }
		      }catch(MessagingException e){
		         e.printStackTrace();
		      }catch(Exception e){
		         e.printStackTrace();
		      }

		request.setAttribute("id", id);
		
		return new ModelAndView( "member/memberFindIdPro" );
	}

}
