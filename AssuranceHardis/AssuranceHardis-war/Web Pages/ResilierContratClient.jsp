<%-- 
    Document   : ResilierContrat
    Created on : 14 mars 2022, 14:38:48
    Author     : alex_
--%>

<%@page import="Modele.Contrat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="Contrat" scope="request" class="Modele.Contrat"></jsp:useBean>
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
        <%Contrat Con = Contrat;%>
        <h1>Vous êtes ici pour résilier votre contrat <%=Contrat.getLoffreDuContrat().getLeTypeDeProduit().getNomTypeProduit() %></h1>
        
        
        <form>
            <label for='IdContrat'>Numéro de contrat : </label>
            <input type='text' name='IdContrat' readonly='readonly' value='<%=Con.getId() %>'>
            
            <input type='checkbox' name='resiliation' value=''>
            <p>Je confirme la résiliation du contrat. Cette action est irréversible.</p>
            <input type='submit' name='action' value='validerResiliationClient'>
        </form>
        
    </body>
</html>
