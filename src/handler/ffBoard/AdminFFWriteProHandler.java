package handler.ffBoard;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.Enumeration;
import java.util.List;

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
public class AdminFFWriteProHandler implements CommandHandler{
	
	@Resource
	FFBoardDao ffDao;
	
	@RequestMapping( "/adminFFWritePro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding( "UTF-8" );
		
		FFBoardDataBean ffDto = new FFBoardDataBean();
		
		String path = request.getServletContext().getRealPath( "/ff" );
		new File( path ).mkdir();
		
		System.out.println( "path : " + path ); // path 체크
		
		MultipartRequest multi
			= new MultipartRequest( request, path, 1024*1024*20, "utf-8", new DefaultFileRenamePolicy() );
		
		// parameter check
		System.out.println( "name : " + multi.getParameter( "name" ) );
		System.out.println( "subject : " + multi.getParameter( "subject" ) );
		System.out.println( "category : " + multi.getParameter( "category" ) );
		System.out.println( "introduce : " + multi.getParameter( "introduce" ) );
		System.out.println( "location : " + multi.getFilesystemName( "location" ) );
		System.out.println( "thumbnail : " + multi.getFilesystemName( "thumbnail" ) );
		System.out.println( "img : " + multi.getParameter( "img" ) );
		System.out.println( "division : " + multi.getParameter( "division" ) );
		
		// name set
		ffDto.setName( multi.getParameter( "name" ) );
		// subject set
		ffDto.setSubject( multi.getParameter( "subject" ) );
		// category set
		ffDto.setCategory( multi.getParameter( "category" ) );
		// introduce set
		ffDto.setIntroduce( multi.getParameter( "introduce" ) );
		// location set
		ffDto.setLocation( multi.getFilesystemName( "location" ) );
		// thumbnail set
		ffDto.setThumbnail( multi.getFilesystemName( "thumbnail" ) );
		String timage = "";
		String oimage = "";
		if( ffDto.getThumbnail() != null ) {
			timage = path + "\\t" + multi.getFilesystemName( "thumbnail" );
			ffDto.setThumbnail( "t" + multi.getFilesystemName( "thumbnail" ) );
			oimage = path + "\\" + multi.getFilesystemName( "thumbnail" );
		}
		
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
		ffDto.setImages( multi.getParameter( "img" ) );
		// division set
		ffDto.setDivision( multi.getParameter( "division" ) );
		
		// DB insert
		int result = ffDao.insertArticle( ffDto );
		
		request.setAttribute( "result", result );
		
		return new ModelAndView( "ffBoard/adminFFWritePro" );
	}

}