package com.Agriculture.Mngprod;

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

@WebServlet("/AddProduct")
@MultipartConfig
public class AddProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String info = request.getParameter("info");
        String price = request.getParameter("price");
        String type = request.getParameter("type");
        String qty = request.getParameter("qty");
        Part part = request.getPart("pic");
        String picName = (part != null && part.getSubmittedFileName() != null) ? part.getSubmittedFileName() : "default.png";

        String realPath = getServletContext().getRealPath("/pic/products");
        File uploadDir = new File(realPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        } 
        
        String filePath = realPath + File.separator + picName;
        System.out.println(filePath);
        AddProductDAO aPDao = new AddProductDAO();

        if (!aPDao.checkDuplicate(name.toLowerCase())) { 
            if (qty != null && aPDao.increaseQty(name.toLowerCase(), Integer.parseInt(qty))) {
                response.getWriter().print("<script>" +
                        "alert('Quantity Updated Successfully!');" +
                        "window.location.href = 'products.jsp';" +
                        "</script>");
            } else {
                response.getWriter().print("<script>" +
                        "alert('Failed to Update Quantity!');" +
                        "window.location.href = 'addProducts.jsp';" +
                        "</script>");
            }
        } else {
            if (aPDao.addProduct(name.toLowerCase(), info, price, type, qty, picName) && uploadPic(part.getInputStream(), filePath)) {
                response.getWriter().print("<script>" +
                        "alert('Product Added Successfully!');" +
                        "window.location.href = 'products.jsp';" +
                        "</script>");
            } else {
                response.getWriter().print("<script>" +
                        "alert('An Error Occurred! Please Try Again.');" +
                        "window.location.href ='addProduct.jsp';" +
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
