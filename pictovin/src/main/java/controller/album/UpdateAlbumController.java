package controller.album;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import controller.Controller;
import model.service.AlbumManager;
import model.Album;
import model.User;

// 앨범 수정은 일단 보류
public class UpdateAlbumController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(UpdateCommunityController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
 
		String albumName = (String) request.getParameter("albumName");
		
		if (request.getMethod().equals("GET")) {	
    		// GET request: 커뮤니티 수정 form 요청	
    		AlbumManager manager = AlbumManager.getInstance();
			Album album = manager.findAlbum(albumName);	// 수정하려는 커뮤니티 정보 검색
			request.setAttribute("community", album);			
				
			return "/community/updateForm.jsp";   // 검색한 정보를 update form으로 전송     
	    }	
    	
    	// POST request (커뮤니티 정보가 parameter로 전송됨)
    	Album album = new Album(
    		request.getParameter("name"),
    		request.getParameter("desc"),
    		null, request.getParameter("chairId"), null);

    	log.debug("Update Community : {}", comm);

		UserManager manager = UserManager.getInstance();
		manager.updateCommunity(comm);			
        return "redirect:/community/list";			
    }
}
