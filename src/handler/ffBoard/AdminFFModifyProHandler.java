package handler.ffBoard;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ffBoard.FFBoardDao;
import ffBoard.FFBoardDataBean;
import handler.CommandHandler;

@Controller
public class AdminFFModifyProHandler implements CommandHandler{
	
	@Resource
	FFBoardDao ffDao;
	
	@RequestMapping( "/adminFFModifyPro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding( "UTF-8" );
		
		FFBoardDataBean ffDto = new FFBoardDataBean();
		FFBoardDataBean ffOld = new FFBoardDataBean();
		
		String path = request.getServletContext().getRealPath( "/ff" );
		new File( path ).mkdir();
		
		System.out.println( "path : " + path ); // path 체크
		
		MultipartRequest multi
			= new MultipartRequest( request, path, 1024*1024*20, "utf-8", new DefaultFileRenamePolicy() );
		
		int num = Integer.parseInt( multi.getParameter( "num" ) );
		// parameter check
		System.out.println( "num : " + num );
		System.out.println( "name : " + multi.getParameter( "name" ) );
		System.out.println( "subject : " + multi.getParameter( "subject" ) );
		System.out.println( "introduce : " + multi.getParameter( "introduce" ) );
		System.out.println( "location : " + multi.getFilesystemName( "location" ) );
		System.out.println( "thumbnail : " + multi.getFilesystemName( "thumbnail" ) );
		System.out.println( "img : " + multi.getParameter( "img" ) );
		
		// old data input
		ffOld = ffDao.getArticle( num );
		
		// num set
		ffDto.setNum( num );
		
		// name set
		if( multi.getParameter( "name" ) == null || multi.getParameter( "name" ).equals( "" ) ) {
			ffDto.setName( ffOld.getName() );
		} else {
			ffDto.setName( multi.getParameter( "name" ) );
		}
		
		// ���� set
		if( multi.getParameter( "subject" ) == null || multi.getParameter( "subject" ).equals( "" ) ) {
			ffDto.setSubject( ffOld.getSubject() );
		} else {
			ffDto.setSubject( multi.getParameter( "subject" ) );
		}
		
		// introduce set
		if( multi.getParameter( "introduce" ) == null || multi.getParameter( "introduce" ).equals( "" ) ) {
			ffDto.setIntroduce( ffOld.getIntroduce() );
		} else {
			ffDto.setIntroduce( multi.getParameter( "introduce" ) );
		}
		
		// location set
		if( multi.getParameter( "location" ) == null || multi.getParameter( "location" ).equals( "" ) ) {
			ffDto.setLocation( ffOld.getLocation() );
		} else {
			ffDto.setLocation( multi.getFilesystemName( "location" ) );
		}
		
		// thumbnail set
		String timage = "";
		String oimage = "";
		if( multi.getFilesystemName( "thumbnail" ) == null || multi.getFilesystemName( "thumbnail" ).equals( "" ) ) {
				ffDto.setThumbnail( ffOld.getThumbnail() );
		} else {
			ffDto.setThumbnail( "t" + multi.getFilesystemName( "thumbnail" ) );
			timage = path + "\\t" + multi.getFilesystemName( "thumbnail" );
			oimage = path + "\\" + multi.getFilesystemName( "thumbnail" );
		}
		System.out.println( ffDto.getThumbnail() );
		if( ! timage.equals( "" ) ) {
			RenderedOp op = JAI.create( "fileload", oimage );
			BufferedImage obuffer = op.getAsBufferedImage();
			
			int width = 300;
			int height = 200;
			
			BufferedImage tbuffer = new BufferedImage( width, height, BufferedImage.TYPE_INT_RGB );
			Graphics g = tbuffer.getGraphics();
			g.drawImage( obuffer, 0, 0, width, height, null );
			
			ImageIO.write(tbuffer, "jpg", new File( timage ) );
			ImageIO.write(tbuffer, "png", new File( timage ) );
			ImageIO.write(tbuffer, "gif", new File( timage ) );
		}
		// images set
		if( multi.getParameter( "img" ) == null || multi.getParameter( "img" ).equals( "" ) ) {
			ffDto.setImages( ffOld.getImages() );
		} else {
			ffDto.setImages( multi.getParameter( "img" ) );
		}
		
		// DB insert
		int result = ffDao.updateArticle( ffDto );
		
		request.setAttribute( "result", result );
		request.setAttribute( "pageNum", multi.getParameter( "pageNum" ) );
		request.setAttribute( "division", multi.getParameter( "division" ) );
		
		return new ModelAndView( "ffBoard/adminFFModifyPro" );
	}

}