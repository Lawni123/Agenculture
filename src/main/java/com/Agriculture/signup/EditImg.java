package com.Agriculture.signup;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;


@WebServlet("/EditImg")
@MultipartConfig
public class EditImg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Part part = request.getPart("image");
	        String picName = (part != null && part.getSubmittedFileName() != null) ? part.getSubmittedFileName() : "default.png";
	        HttpSession session = request.getSession();
	        String realPath = getServletContext().getRealPath("/pic/profile");
	        File uploadDir = new File(realPath);
	        if (!uploadDir.exists()) {
	            uploadDir.mkdirs();
	        } 
	        
	        String filePath = realPath + File.separator + picName;
	        uploadPic(part.getInputStream(), filePath);
	        int id = (int) session.getAttribute("uid");
	        SignUpDAO sUDao = new SignUpDAO();
	        sUDao.editImg(id,picName);
	        response.sendRedirect("FetchDetails");
	}
	
	private boolean uploadPic(InputStream in, String filePath) {
        try (FileOutputStream out = new FileOutputStream(filePath);
             InputStream input = in) {
             
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = input.read(buffer)) != -1) {
                out.write(buffer, 0, bytesRead);
            }
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }
}
