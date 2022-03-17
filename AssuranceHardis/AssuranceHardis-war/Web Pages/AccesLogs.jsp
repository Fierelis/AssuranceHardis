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
        <h1> Logs de l'application</h1>
         <% for (Logs L : log){ %>
        
         <table>
            <tr>
                <td>Type</td>
                <td>Utilisateur Client N°</td>
                <td>Utilisateur Service N°</td>
                <td>Administrateur</td>
                <td>Offre N°</td>
                <td>Contrat N°</td>
                <td>Date</td>
            </tr>
            
            <tr>
                <td><%=L.getTypeLog() %></td>

                   <td><% %></td>
                  
            </tr>
        </table>
        <% } %>
    </body>
    
</html>