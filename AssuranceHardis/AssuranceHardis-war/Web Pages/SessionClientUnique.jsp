<%-- 
    Document   : SessionClientUnique
    Created on : 8 mars 2022, 11:00:01
    Author     : alex_
--%>

<%@page import="Modele.UtilisateurService"%>
<%@page import="java.util.List"%>
<%@page import="Modele.Contrat"%>
<%@page import="Modele.ClientUnique"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="ClientUniqueJSP" scope="request" class="Modele.ClientUnique"></jsp:useBean>
       <jsp:useBean id="ListeContrat" scope="request" class="java.util.List"></jsp:useBean> 
        <title>JSP Page</title>
    </head>
    <body>
        <%ClientUnique ClientU = ClientUniqueJSP;
        System.out.println(ClientU);
        %>
        <h1>Bonjour <%=ClientU.getPrenom()%></h1>
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
        <div id="TableauAssureursPartenaires">
             <h2>Mes Contrats en cours</h2>
            <table>
                <tr>
                    <td>Assureur</td>
                    <td>Type de Contrat</td>
                    <td>Produit</td>
                    <td>Date de Souscription</td>
                    <td>Durée de couverture</td>
                </tr>
                    <% 
                       List<Contrat> ListeContrats = ListeContrat;
                       if (!ListeContrats.isEmpty()){
                        for(Contrat ContratSouscrits : ListeContrats){
                        %>  <tr>
                            <td><%=ContratSouscrits.getLoffreDuContrat().getLAssurance().getRaisonSocialeAssureur() %></td>
                            <td><%=ContratSouscrits.getLoffreDuContrat().getTypeOffre() %></td>
                            <td><%=ContratSouscrits.getLoffreDuContrat().getLeTypeDeProduit() %></td>
                            <td><%=ContratSouscrits.getDateContrat() %></td>
                            <td><%=ContratSouscrits.getDureeContrat()+" mois"%></td>
                            <td>
                                <form>
                                    <button name="contrat" value="<%=ContratSouscrits.getId()%>">Résilier</button> 
                                    <input type="hidden" name="Bouton" value="ResilierContrat">
                                </form>
                            </td>
                            
                            </tr>
                       <%   }
                        }
                        else { %>
                        <tr>
                        <td>No data</td>
                        <td>No data</td>
                        <td>No data</td>
                        <td>No data</td>
                        <td>No data</td>
                        </tr>
                        <%}
                       
                       %>
            </table>
        </div>
        
    </body>
</html>
