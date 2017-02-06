/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wbz.tinad.servlets;

import com.wbz.tinad.dao.AnnonceDao;
import com.wbz.tinad.dao.DAOFactory;
import java.io.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author davra
 */
public class Telecharge extends HttpServlet {

    public static final String CONF_DAO_FACTORY = "daofactory";
    public File file ;
    public int maxFileSize = 5000 * 1024;
    public int maxMemSize = 5000 * 1024;
    public String filePath = "src/main/webapp/img/";

    private AnnonceDao annonceDao;
    // private UtilisateurDao utilisateurDao;

    @Override
    public void init() throws ServletException {
        this.annonceDao = ((DAOFactory) getServletContext().getAttribute(CONF_DAO_FACTORY)).getAnnonceDao();

    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String contentType = request.getContentType();
        //PrintWriter out=response.getWriter();
        
        if ((contentType.contains("multipart/form-data"))) {

            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(maxMemSize);
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setSizeMax(maxFileSize);
            try {
                  //out.print(request);
                List fileItems = upload.parseRequest(request);
                Iterator i = fileItems.iterator();
                while (i.hasNext()) {
                    FileItem fi = (FileItem) i.next();
                    if (!fi.isFormField()) {
                        String fileName = fi.getName();
                        //out.print(fileName);
                        file = new File(filePath + fileName);
                        fi.write(file);
                         //out.println("<img src='img/" + fileName + "' />");
                    }
                }

            } catch (Exception ex) {
                System.out.println(ex);
            }
        }
    }
}
