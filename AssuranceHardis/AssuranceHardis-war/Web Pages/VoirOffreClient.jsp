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
    <%Offre offer = Offre;
    System.out.println(offer);
    %>
    <body>
              <form>
        <button class="button login__submit">
            <span class="button__text">Home</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
            
              <input type="hidden" name="action" value="home">
        </form>
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
        <h1>Information sur l'offre </h1>
        
        <table>
            <tr> <td>Type de Produit</td><td><%=offer.getLeTypeDeProduit().getNomTypeProduit() %></td></tr>
            <tr> <td>Type de Contrat</td><td><%=offer.getTypeOffre() %></td></tr>
            <tr> <td>Description Contrat</td><td><%=offer.getDescriptionOffreContractuelle() %></td></tr>
            <tr> <td>Assureur</td><td><%=offer.getLAssurance().getRaisonSocialeAssureur()%></td></tr>
             <%if (offer.getLeCourtier()!=null){ %>
            
            <tr> <td>Courtier</td>  <td><%=offer.getLeCourtier().getNomCourtier() %></td></tr>
            
            <% } %>
            <tr> <td>Prix de l'Offre</td><td><%=offer.getPrixOffre() %></td></tr>
            <td>
            <form>
                <button name="contrat" value="<%=offer.getId()%>">Souscrire</button> 
                <input type="hidden" name="action" value="Souscrire">
            </form>
            </td>
        </table>
        
        
        
    </body>
</html>
