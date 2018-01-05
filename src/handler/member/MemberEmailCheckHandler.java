package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import member.MemberEmailConfirm;

@Controller
public class MemberEmailCheckHandler implements CommandHandler{

	@RequestMapping( "/memberEmailCheck" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String email = request.getParameter("email");
		MemberEmailConfirm emailconfirm = new MemberEmailConfirm();
		String authNum=emailconfirm.loginconnectEmail(email);
		
		request.setAttribute("authNum", authNum);
		return new ModelAndView( "member/memberEmailCheck" );
	}

}
