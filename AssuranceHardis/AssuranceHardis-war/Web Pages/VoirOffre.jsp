<%-- 
    Document   : VoirOffre
    Created on : 14 mars 2022, 16:48:21
    Author     : alex_
--%>

<%@page import="Modele.Offre"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="Offre" scope="request" class="Modele.Offre"></jsp:useBean>

        <title>Offre</title>
    </head>
    <% Offre o= Offre;%>
    <body>
         <form>
        <button class="button login__submit">
            <span class="button__text">Home</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
            
              <input type="hidden" name="action" value="home">
        </form>
        <h1>Afficher ICI toutes les informations sur une Offre</h1>
        <%Offre offer = offreJSP;%>
        
        
        <table>
            <tr> <td>Type de Produit</td><td><%=offer.getLeTypeDeProduit() %></td></tr>
            <tr> <td>Type de Contrat</td><td><%=offer.getTypeOffre() %></td></tr>
            <tr> <td>Description Contrat</td><td><%=offer.getDescriptionOffreContractuelle() %></td></tr>
            <tr> <td>Assureur</td><td><%=offer.getLAssurance().getRaisonSocialeAssureur() %></td></tr>
            <tr> <td>Courtier</td>  <td><%=offer.getLeCourtier().getNomCourtier() %></td></tr>
            <tr> <td>Prix de l'Offre</td><td><%=offer.getPrixOffre() %></td></tr>
            <form>
                <button name="contrat" value="<%=offer.getId()%>">Souscrire</button> 
                <input type="hidden" name="Bouton" value="Souscrire">
            </form>
            
        </table>
        
        
        
    </body>
</html>
