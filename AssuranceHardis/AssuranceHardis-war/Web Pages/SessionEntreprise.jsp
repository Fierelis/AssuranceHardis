<%-- 
    Document   : SessionEntreprise
    Created on : 8 mars 2022, 11:00:15
    Author     : alex_
--%>

<%@page import="java.util.List"%>
<%@page import="Modele.Contrat"%>
<%@page import="Modele.Entreprise"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="Entreprise" scope="request" class="Modele.Entreprise"></jsp:useBean>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard Client</title>
        <jsp:useBean id="Boite" scope="request" class="Modele.Entreprise"></jsp:useBean>
        <jsp:useBean id="ListeContratEntreprise" scope="request" class="java.util.List"></jsp:useBean>
    </head>
    <body>
        <h1>Je suis une entreprise</h1>
        
         <%Entreprise EBoite = Boite;%>
        <h1>Bienvenue sur l'espace <%=Boite.getRaisonSocialeEntreprise() %></h1>
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
            <span class="button__text">Compte Entreprise</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
            
              <input type="hidden" name="action" value="CompteEntreprise">
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
                       List<Contrat> ListeContrats = ListeContratEntreprise;
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
                            </tr>
                       <%}%>
            </table>
        </div>
        
        
    </body>
</html>
