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
    <%Offre offer = Offre;%>
    <body>
        <% System.out.println( "1" +offer.getLeTypeDeProduit().getNomTypeProduit()); 
           System.out.println( "2" +offer.getTypeOffre()); 
           System.out.println( "3" +offer.getDescriptionOffreContractuelle()); 
           System.out.println("4" +offer.getLAssurance().getRaisonSocialeAssureur()); 
           System.out.println( "5" +offer.getLeCourtier().getNomCourtier() ); 
           System.out.println( "6" +offer.getPrixOffre()); 
        %>
         <form>
        <button class="button login__submit">
            <span class="button__text">Home</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
              <input type="hidden" name="action" value="home">
        </form>
        <h1>Information sur l'offre </h1>
        
        
        <table>
            <% System.out.println("suuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu1"); %>
            <tr> <td>Type de Produit</td><td><%=offer.getLeTypeDeProduit().getNomTypeProduit() %></td></tr>
            <% System.out.println("suuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu2"); %>
            <tr> <td>Type de Contrat</td><td><%=offer.getTypeOffre() %></td></tr>
            <% System.out.println("suuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu3"); %>
            <tr> <td>Description Contrat</td><td><%=offer.getDescriptionOffreContractuelle() %></td></tr>
            <% System.out.println("suuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu4"); %>
            <tr> <td>Assureur</td><td><%=offer.getLAssurance().getRaisonSocialeAssureur()%></td></tr>
            <% System.out.println("suuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu5"); %>
            <tr> <td>Courtier</td>  <td><%=offer.getLeCourtier().getNomCourtier() %></td></tr>
            <% System.out.println("suuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu6"); %>
            <tr> <td>Prix de l'Offre</td><td><%=offer.getPrixOffre() %></td></tr>
            <form>
                <button name="OffreVia" value="<%=offer.getId()%>">Créer une Offre </button> 
                <input type="hidden" name="Bouton" value="CreerOffreViaCourtier">
            </form>
            
        </table>
        
        
        
    </body>
</html>
