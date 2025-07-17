package com.Agriculture.mngEquipment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/AddEquipment")
@MultipartConfig
public class AddEquipment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String info = request.getParameter("info");
        int price = Integer.parseInt(request.getParameter("price"));
        int qty = Integer.parseInt(request.getParameter("number"));
        Part part = request.getPart("pic");
        String picName = (part != null && part.getSubmittedFileName() != null) ? part.getSubmittedFileName() : "default.png";

        String realPath = getServletContext().getRealPath("/pic/products");
        File uploadDir = new File(realPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        } 
        
        String filePath = realPath + File.separator + picName;
        System.out.println(filePath);
        AddEquipmentDAO aPDao = new AddEquipmentDAO();

        if (!aPDao.checkDuplicate(name.toLowerCase())) { 
            if (qty != 0 && aPDao.increaseQty(name.toLowerCase(), qty)) {
                response.getWriter().print("<script>" +
                        "alert('Quantity Updated Successfully!');" +
                        "window.location.href = 'products.jsp';" +
                        "</script>");
            } else {
                response.getWriter().print("<script>" +
                        "alert('Failed to Update Number!');" +
                        "window.location.href = 'addEquipment.jsp';" +
                        "</script>");
            }
        } else {
            if (aPDao.addEquipment(name.toLowerCase(), info, price, picName,qty) && uploadPic(part.getInputStream(), filePath)) {
                response.getWriter().print("<script>" +
                        "alert('Equipment Added Successfully!');" +
                        "window.location.href = 'FetchEquipment';" +
                        "</script>");
            } else {
                response.getWriter().print("<script>" +
                        "alert('An Error Occurred! Please Try Again.');" +
                        "window.location.href ='addEquipment.jsp';" +
                        "</script>");
            }
        }
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
