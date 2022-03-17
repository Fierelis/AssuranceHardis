<%-- 
    Document   : AccesLogs
    Created on : 16 mars 2022, 17:50:05
    Author     : alex_
--%>

<%@page import="java.util.List"%>
<%@page import="Modele.Logs"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="logs" scope="request" class="java.util.List"></jsp:useBean>
        <title>JSP Page</title>
        
        
    </head>
    <body>
         <button class="button login__submit">
            <span class="button__text">Home</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
            
              <input type="hidden" name="action" value="home">
        </form>
        
        <%
        List<Logs> log = logs;
        %>
        <h1> Création de Client en attente</h1>
         <% for (Logs L : log){ %>
        
         <table>
            <tr>
                <td>Type</td>
                <td>Date</td>
                <td>Utilisateur</td>
                <td>Statut inscription</td>
            </tr>
            
            <tr>
                <td><%=L.getTypeLog() %></td>
                <td><%=L.getDateLog() %></td>
                <td><%=L.getLogClientUnique().getLogin() %></td>
                <td><%=L.getLogClientUnique().isActivationUser() %></td>

                    <td>
                    <form>
                            <input type="hidden" name="IdClientUnique" value="<%=L.getLogClientUnique().getId()%>">
                            <input type="Submit" value="Valider Inscription">
                            <input type="hidden" name="action" value="ValiderInscriptionClientUnique">
                       
                    </form>
                   </td>
            </tr>
        </table>
        <% } %>
        <h1> Création d'Entreprise en attente</h1>
         <% for (Logs L : log){ %>
        
         <table>
            <tr>
                <td>Type</td>
                <td>Date</td>
                <td>Utilisateur</td>
                <td>Statut inscription</td>
            </tr>
            
            <tr>
                <td><%=L.getTypeLog() %></td>
                <td><%=L.getDateLog() %></td>
                <td><%=L.getLogEntreprise().getLogin() %></td>
                <td><%=L.getLogEntreprise().isActivationUser() %></td>

                    <td>
                    <form>
                            <input type="hidden" name="IdEntreprise" value="<%=L.getLogEntreprise().getId()%>">
                            <input type="Submit" value="Valider Inscription">
                            <input type="hidden" name="action" value="ValiderInscriptionEntreprise">
                       
                    </form>
                   </td>
            </tr>
        </table>
        <% } %>
        <h1> Création de Courtier en attente</h1>
         <% for (Logs L : log){ %>
        
         <table>
            <tr>
                <td>Type</td>
                <td>Date</td>
                <td>Utilisateur</td>
                <td>Statut inscription</td>
            </tr>
            
            <tr>
                <td><%=L.getTypeLog() %></td>
                <td><%=L.getDateLog() %></td>
                <td><%=L.getLogCourtier().getMailCourtier()%></td>
                <td><%=L.getLogCourtier().isActivationUser() %></td>

                    <td>
                    <form>
                            <input type="hidden" name="IdCourtier" value="<%=L.getLogCourtier().getId()%>">
                            <input type="Submit" value="Valider Inscription">
                            <input type="hidden" name="action" value="ValiderInscriptionCourtiere">
                       
                    </form>
                   </td>
            </tr>
        </table>
        <% } %>
        <h1> Création d'assureurs en attente</h1>
         <% for (Logs L : log){ %>
        
         <table>
            <tr>
                <td>Type</td>
                <td>Date</td>
                <td>Utilisateur</td>
                <td>Statut inscription</td>
            </tr>
            
            <tr>
                <td><%=L.getTypeLog() %></td>
                <td><%=L.getDateLog() %></td>
                <td><%=L.getLogAssureur().getRaisonSocialeAssureur() %></td>
                <td><%=L.getLogAssureur().isActivationUser() %></td>

                    <td>
                    <form>
                            <input type="hidden" name="IdAssureur" value="<%=L.getLogAssureur().getId()%>">
                            <input type="Submit" value="Valider Inscription">
                            <input type="hidden" name="action" value="ValiderInscriptionAssureur">
                       
                    </form>
                   </td>
            </tr>
        </table>
        <% } %>
    </body>
    
</html>
