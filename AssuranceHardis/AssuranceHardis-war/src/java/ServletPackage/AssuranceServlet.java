/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletPackage;

import Session.GestionClientLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.Date;
import javax.ejb.EJB;
import javax.print.attribute.standard.DateTimeAtCreation;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alex_  
 */
@WebServlet(name = "AssuranceServlet", urlPatterns = {"/AssuranceServlet"})
public class AssuranceServlet extends HttpServlet {

    @EJB
    private GestionClientLocal gestionClient;

   
 

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            
            String jsp = null;
            String act = request.getParameter("action");
            if ((act == null) || (act.equals("vide"))) {
                jsp = "/CreerClientUnique.jsp";
                //request.setAttribute("message", "pas d'informations");
            } 
            //--------------------------------
            else if (act.equals("CreerClientUnique")) {
                doActionCreerClientUnique(request, response);
                jsp = "/CreerClientUnique.jsp";
                
            } 
            
            RequestDispatcher Rd;
            Rd = getServletContext().getRequestDispatcher(jsp);
            Rd.forward(request, response);
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AssuranceServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AssuranceServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    
    
    // DoAction pour creer un client unique
    protected void doActionCreerClientUnique(HttpServletRequest request, 
            HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("NomClient");
        String prenom = request.getParameter("PrenomClient");
        String login = request.getParameter("LoginClient");
        String mdp = request.getParameter("MdpClient");
        String iban = request.getParameter("Iban");
        String message;
        if (nom.trim().isEmpty() || prenom.trim().isEmpty() || login.trim().isEmpty() || mdp.trim().isEmpty() || iban.trim().isEmpty()) { //récupère les valeurs de la servlet pour vérifier si elles sont vides
            message = "Erreur - Vous n'avez pas rempli tous les champs obligatoires. " + "<br /> <a href=\"CreerClientUnique.jsp\">Cliquez ici</a> pour accéder au formulaire de création d'un Client";
        } else {
            
            Date dateCreation = new Date();
            String typeUser="Client Unique";
            String hashage=gestionClient.HashageSha256(mdp);
            System.out.println(hashage);
            
            gestionClient.CreerClientUnique(nom, prenom, login, hashage, dateCreation, typeUser, iban);
            message = "Agent créé avec succès !";
        }
        request.setAttribute("message", message);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
