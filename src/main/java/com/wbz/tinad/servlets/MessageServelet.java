 
package com.wbz.tinad.servlets;
import com.wbz.tinad.dao.CategorieDao;
import com.wbz.tinad.dao.DAOFactory;
import com.wbz.tinad.dao.MessageDao;
import com.wbz.tinad.services.CategorieService;
import com.wbz.tinad.services.MessageService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
public class MessageServelet extends HttpServlet {

    public static final String CONF_DAO_FACTORY = "daofactory";
    private MessageDao messageDao;  

    @Override
    public void init() throws ServletException {
        this.messageDao = ((DAOFactory) getServletContext().getAttribute(CONF_DAO_FACTORY)).getMessageDaoDao();     
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MessageService util = new MessageService(messageDao); 
        response.setContentType("application/json");
        response.setHeader("Access-Control-Allow-Origin", "*");
        PrintWriter out = response.getWriter();
        try {
             
            out.print(util.afficheMessage("1"));
        } catch (Exception ex) {
            ex.printStackTrace();
        }
               
    }
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MessageService util = new MessageService(messageDao);          
        response.setContentType("application/json");
        response.setHeader("Access-Control-Allow-Origin", "*");
        //data:'idAnnonce='+idAnnonce+'&idAnnonce='+idUtilisateur+'&description='+description+'&contact='+contact,
        if(!request.getParameter("idAnnonce").isEmpty() && !request.getParameter("idUtilisateur").isEmpty()&& !request.getParameter("description").isEmpty() && !request.getParameter("contact").isEmpty()) {
            try {
                //String idEnvoyeur, String description, String annonce_id, String contact
                util.createMessage(request.getParameter("idUtilisateur"), request.getParameter("description"), request.getParameter("idAnnonce"), request.getParameter("contact"));
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
