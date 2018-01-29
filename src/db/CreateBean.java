package db;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import barcode.BarcodeDBBean;
import barcode.BarcodeDao;
import eventBoard.EventBoardDBBean;
import eventBoard.EventBoardDao;
import ffBoard.FFBoardDBBean;
import ffBoard.FFBoardDao;
import member.LogonDBBean;
import member.LogonDao;
import memo.MemoDBBean;
import memo.MemoDao;
import noticeBoard.NoticeBoardDBBean;
import noticeBoard.NoticeBoardDao;
import qnaBoard.QnaBoardDBBean;
import qnaBoard.QnaBoardDao;
import reverse.ReverseDBBean;
import reverse.ReverseDao;

@Configuration
public class CreateBean {
	
	@Bean
	public LogonDao logonDao() {
		return new LogonDBBean();
	}
	@Bean
	public MemoDao memoDao() {
		return new MemoDBBean();
	}
	@Bean
	public QnaBoardDao qnaBoardDao() {
		return new QnaBoardDBBean();
	}
	@Bean
	public NoticeBoardDao noticeBoardDao() {
		return new NoticeBoardDBBean();
	}
	@Bean
	public FFBoardDao ffBoardDao() {
		return new FFBoardDBBean();
	}
	@Bean
	public EventBoardDao eventBoardDao() {
		return new EventBoardDBBean();
	}
	@Bean
	public ReverseDao reverseBoardDao() {
		return new ReverseDBBean();
	}
	@Bean
	public BarcodeDao barcodeDao() {
		return new BarcodeDBBean();
	}
	@Bean
	public ViewResolver viewResolver() {
		UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
		viewResolver.setViewClass( JstlView.class );
		viewResolver.setPrefix( "/" );
		viewResolver.setSuffix( ".jsp" );
		return viewResolver;
	}
}

















