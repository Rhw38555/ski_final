package handler.eventBoard;

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

import eventBoard.EventBoardDao;
import eventBoard.EventBoardDataBean;
import handler.CommandHandler;

@Controller
public class AdminEventModifyProHandler implements CommandHandler{
	
	@Resource
	private EventBoardDao eventDao;
	
	@RequestMapping( "/adminEventModifyPro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding( "utf-8" );

		EventBoardDataBean eventDto = new EventBoardDataBean();
		
		String path =  request.getServletContext().getRealPath( "/event" );
		new File( path ).mkdir();
		
		System.out.println("path: "+path); // path 체크
		
		MultipartRequest multi 
			= new MultipartRequest( request, path, 1024*1024*10, "utf-8", new DefaultFileRenamePolicy() );			
		
		// num set
		eventDto.setNum( Integer.parseInt( multi.getParameter( "num" ) ) );
		
		//이벤트 제목 set
		eventDto.setSubject( multi.getParameter( "subject" ) );                             
        System.out.println( eventDto.getSubject() );
		// img set
		eventDto.setImage( multi.getFilesystemName( "image" ) );
        System.out.println( "image:"+eventDto.getImage() );
		// thumbnail set
        String timage = "";
        String oimage = "";
      
        if(eventDto.getImage() != null) {		
         	timage = path+"\\t"+multi.getFilesystemName( "image" );
         	eventDto.setThumbnail( "t" + multi.getFilesystemName( "image" ) );
         	oimage = path + "\\" + multi.getFilesystemName( "image" );
        }
     	 
    	if(! timage.equals("")) {
    		RenderedOp op=JAI.create( "fileload", oimage );
        	BufferedImage obuffer= op.getAsBufferedImage();
        	
        	int width =300;
        	int height =200;
        	
        	BufferedImage tbuffer=new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        	Graphics g= tbuffer.getGraphics();
        	g.drawImage(obuffer, 0, 0, width, height, null);
        	
        	ImageIO.write(tbuffer, "jpg", new File( timage ) );
        	ImageIO.write(tbuffer, "png", new File( timage ) );
        	ImageIO.write(tbuffer, "gif", new File( timage ) );
    	}
    	System.out.println( "넘:"+eventDto.getNum() );
    	System.out.println( "썸네일:"+eventDto.getThumbnail() );

    	// DB insert
		int result = eventDao.updateArticle( eventDto );
		
		request.setAttribute("result", result);
		
		return new ModelAndView( "eventBoard/adminEventModifyPro" );
	}

}