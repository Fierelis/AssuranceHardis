<%-- 
    Document   : SessionCourtier
    Created on : 8 mars 2022, 11:00:28
    Author     : alex_
--%>

<%@page import="Modele.Assureur"%>
<%@page import="Modele.Courtier"%>
<%@page import="java.util.List"%>
<%@page import="Modele.Offre"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="Courtier" scope="session" class="Modele.Courtier"></jsp:useBean>
        <jsp:useBean id="ListeFiltreePartenaires" scope="request" class="java.util.List"></jsp:useBean>
        <jsp:useBean id="ListeFiltreeOffresPartenaires" scope="request" class="java.util.List"></jsp:useBean>
        <title>Page Courtier</title>
    </head>
    <body>
        <%Courtier Court = Courtier;%>
  
        <form>
        <button class="button login__submit">
            <span class="button__text">Home</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
            
              <input type="hidden" name="action" value="home">
        </form>
        <form>
        <button class="button login__submit">
            <span class="button__text">Créer une Offre</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
        
              <input type="hidden" name="action" value="CreerOffreCourtier">
        </form>
        
        <form>
        <button class="button login__submit">
            <span class="button__text">Rechercher offre</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
              <input type="hidden" name="action" value="RechercherOffre">
        </form>
        
        <form>
        <button class="button login__submit">
            <span class="button__text">Mon Compte</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
            
              <input type="hidden" name="action" value="CompteCourtier">
        </form>
        
        <form>
        <button class="button login__submit">
            <span class="button__text">Se deconnecter</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
            
              <input type="hidden" name="action" value="Deconnexion">
        </form>
        <div class ="row">
            <div class ="col-md-3">
                 <div id="TableauOffresPartenaires">
                <h4 class="text-center mb-4">Assureurs partenaires</h4>
                <div class="table-wrap">
                    <table class="table">
                        <thead class="thead-primary">
                            <tr>
                                <th>Assureur</th>


                            </tr>
                        </thead>
                        <tbody>
                           <% 
                       List<Assureur> testlist=ListeFiltreePartenaires;
                        for(Assureur Partenaire : testlist){
                    %>
                    <tr><td><%= Partenaire.getRaisonSocialeAssureur() %></td>

                        </tr>
                       <%}%>


                        </tbody>
                    </table>
                </div>
            </div>
            </div>
            
        <div id="TableauOffresPartenaires">
            <h2>Offres des assureurs Partenaires</h2>
            <table>
                <tr><td>Assureur</td>
                    <td>Type Offre</td>
                    <td>Type Produit</td>
                    <td>Description Produit</td>
                    <td>Prix Offre</td>
                </tr>
                    <% 
                       List<Offre> ListeFiltreeOffres=ListeFiltreeOffresPartenaires;
                       
                        for(Offre OffrePartenaire : ListeFiltreeOffres){
                    %>  <tr><td><%=OffrePartenaire.getLAssurance().getRaisonSocialeAssureur()%></td>
                            <td><%=OffrePartenaire.getTypeOffre()%></td>
                            <td><%=OffrePartenaire.getLeTypeDeProduit().getNomTypeProduit()%></td>
                            <td><%=OffrePartenaire.getDescriptionOffreContractuelle()%></td>
                            <td><%=OffrePartenaire.getPrixOffre()%></td>

                        </tr>
                       <%}%>
            </table>
        </div>

    </body>
</html>
