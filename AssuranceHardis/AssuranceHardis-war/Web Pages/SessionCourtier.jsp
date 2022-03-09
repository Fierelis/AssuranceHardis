<%-- 
    Document   : SessionCourtier
    Created on : 8 mars 2022, 11:00:28
    Author     : alex_
--%>

<%@page import="java.util.List"%>
<%@page import="Modele.Offre"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="Courtier" scope="request" class="Modele.Courtier"></jsp:useBean>
        <jsp:useBean id="ListeFiltreePartenaires" scope="request" class="java.util.List"></jsp:useBean>
        <jsp:useBean id="ListeFiltreeOffresPartenaires" scope="request" class="java.util.List"></jsp:useBean>
        <title>Page Courtier</title>
    </head>
    <body>
        <form>
        <button class="button login__submit">
            <span class="button__text">Créer une Offre</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
        
              <input type="hidden" name="action" value="CreerOffreCourtier">
        </form>
        <div id="TableauAssureursPartenaires">
             <h2>Assureurs Partenaires</h2>
            <table>
                <tr><td>Nom Assureur</td></tr>
                    <% 
                       List<Offre> ListeFiltreeAssureurs=ListeFiltreePartenaires;
                        for(Offre OffrePartenaire : ListeFiltreeAssureurs){
                            %>  <tr><%OffrePartenaire.getPartenariatAssurance().getRaisonSocialeAssureur();%></tr>
                       <%}%>
            </table>
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
                    %>  <tr><td><%OffrePartenaire.getPartenariatAssurance().getRaisonSocialeAssureur();%></td>
                            <td><%OffrePartenaire.getTypeOffre();%></td>
                            <td><%OffrePartenaire.getLeTypeDeProduit().getNomTypeProduit();%></td>
                            <td><%OffrePartenaire.getDescriptionOffreContractuelle();%></td>
                            <td><%OffrePartenaire.getPrixOffre();%></td>
                        </tr>
                       <%}%>
            </table>
            


        </div>


    </body>
</html>
