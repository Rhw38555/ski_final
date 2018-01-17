package handler.main;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import barcode.BarcodeDao;
import handler.CommandHandler;


@Controller
public class MainHandler implements CommandHandler{
	
	
	@Resource
	private BarcodeDao barcodeDao;
	
	@RequestMapping( "/main" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	      DocumentBuilder builder = factory.newDocumentBuilder();
	      Document doc = builder.parse("http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=1168064000");
	      
	      NodeList list = doc.getElementsByTagName("body");
	        for(int i=0; i<list.getLength(); i++) {
	         for(Node node = list.item(i).getFirstChild(); node!=null; node=node.getNextSibling()){
	            
	            if(node.getNodeName().equals("data")){
	               for(Node node2 = node.getFirstChild(); node2!=null; node2=node2.getNextSibling()) {
	                  
	                  if (node2.getNodeName().equals("tmx")){
	                     request.setAttribute("tmx", node2.getTextContent());
	                  }
	                  else if (node2.getNodeName().equals("tmn")){
	                     request.setAttribute("tmn", node2.getTextContent());
	                  }
	                  else if (node2.getNodeName().equals("wfKor")){
	                     request.setAttribute("wfKor", node2.getTextContent());
	                  }
	                  
	               } //for node
	            }
	         }//for node
	        }
		if(request.getSession().getAttribute("memId") !=null && request.getSession().getAttribute("memId")!="") {
			String user_barcode = barcodeDao.getUser_barcode((String)request.getSession().getAttribute("memId"));
			request.setAttribute("user_barcode", user_barcode);
			System.out.println(user_barcode);
		}
		
		
		return new ModelAndView( "main/main" );
	}

}
