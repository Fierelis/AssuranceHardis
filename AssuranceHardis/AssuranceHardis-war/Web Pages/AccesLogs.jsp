<%-- 
    Document   : AccesLogs
    Created on : 17 mars 2022, 18:26:15
    Author     : alex_
--%>

<%@page import="Modele.Logs"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="logs" scope="request" class="java.util.List"></jsp:useBean>
        <title>JSP Page</title>
    </head>
    <body>
        <form>
        <button class="button login__submit">
            <span class="button__text">Home</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
            
              <input type="hidden" name="action" value="home">
        </form>
           
         <form>
        <button class="button login__submit">
            <span class="button__text">Inscriptions en Attente</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
            
              <input type="hidden" name="action" value="ValidationUser">
        </form>
         
          <form>
        <button class="button login__submit">
            <span class="button__text">Log Application</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
            
              <input type="hidden" name="action" value="AccesLogs">
        </form>
         
         <form>
        <button class="button login__submit">
            <span class="button__text">Rechercher Offres</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
            
              <input type="hidden" name="action" value="RechercherOffre">
        </form>
        <%
        List<Logs> log = logs;
        %>
        <h1> Création de Client en attente</h1>
         
        
         <table>
            <tr>
                <td>Type</td>
                <td>Date</td>
            </tr>
            <% for (Logs L : log){ %>
            <tr>
                <td><%=L.getTypeLog() %></td>
                <td><%=L.getDateLog() %></td>

            </tr>
            <% } %>
        </table>
        
    </body>
</html>
