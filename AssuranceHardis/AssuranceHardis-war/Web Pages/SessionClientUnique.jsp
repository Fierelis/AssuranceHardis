<%-- 
    Document   : SessionClientUnique
    Created on : 8 mars 2022, 11:00:01
    Author     : alex_
--%>

<%@page import="Modele.ClientUnique"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="ClientU" scope="request" class="Modele.ClientUnique"></jsp:useBean>
        <title>JSP Page</title>
    </head>
    <body>
        <%ClientUnique Client = ClientU;%>
        <h1>Bonjour <%=Client.getPrenom()%></h1>
        <form>
        <button class="button login__submit">
            <span class="button__text">Rechercher une Offre</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
        
              <input type="hidden" name="action" value="RechercherOffre">
        </form>
        
        <form>
        <button class="button login__submit">
            <span class="button__text">Mon Compte</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
            
              <input type="hidden" name="action" value="CompteClient">
        </form>
        
         <form>
        <button class="button login__submit">
            <span class="button__text">Se deconnecter</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
            
              <input type="hidden" name="action" value="Deconnexion">
        </form>
        
        
    </body>
</html>
