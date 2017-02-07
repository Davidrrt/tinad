 
package com.wbz.tinad.servlets;
import com.wbz.tinad.dao.CategorieDao;
import com.wbz.tinad.dao.DAOFactory;
import com.wbz.tinad.services.CategorieService;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
public class Categorie extends HttpServlet {

    public static final String CONF_DAO_FACTORY = "daofactory";
    private CategorieDao categorieDao;  

    @Override
    public void init() throws ServletException {
        this.categorieDao = ((DAOFactory) getServletContext().getAttribute(CONF_DAO_FACTORY)).getCategorieDao();     
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategorieService util = new CategorieService(categorieDao);          
        response.setContentType("application/json");
        response.setHeader("Access-Control-Allow-Origin", "*");
        PrintWriter out=response.getWriter();
        out.print(util.printCategories());        
    }
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
