<%-- 
    Document   : CreerOffreCourtier
    Created on : 10 mars 2022, 09:46:21
    Author     : alexa
--%>

<%@page import="java.util.List"%>
<%@page import="Modele.Assureur"%>
<%@page import="Modele.Courtier"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Creation d'offre</title>
        <jsp:useBean id="ListeAllAssureur" scope="request" class="java.util.List"></jsp:useBean>
        <jsp:useBean id="courtier" scope="request" class="Modele.Courtier"></jsp:useBean>
    </head>
    <body>
        <%Courtier Court = courtier;%>
        <% List<Assureur>listeAssureur=ListeAllAssureur;%>
        <h1>Création d'une offre</h1>
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
        <form method="post" action="AssuranceServlet">
            <fieldset>
                <legend>Informations Offre</legend>     
                <label for="TypeOffre">Type d'offre : <span class="requis"></span></label>
                <select name="TypeOffre">                  
                    <option value ="Mono">Mono</option>   
                    <option value ="Multi">Multi</option>    
                </select><br />

                <label for="PrixOffre">Prix de l'offre : <span class="requis"></span></label>
                <input type="text" name="PrixOffre" Value="" size="40" maxlength="100" /> <br />

                <label for="Description">Description : <span class="requis"></span></label>
                <input type="text" name="Description" value="" size="40" maxlength="45" /><br />

                <label for="AsuureurPartenaire">AssureurPartenaire: <span class="requis"></span></label>
                <select name="Partenaire">                  
                    <%
                    for (Assureur a : listeAssureur) {
                    %>  
                    <option value ="<%=a.getId() %>"><%=a.getRaisonSocialeAssureur() %></option>   
                    <%} %>
                </select><br />
                
                <label for="TypeProduit">Type de produit : <span class="requis"></span></label>
                <select name="TypeProduit">                  
                     <option value ="Sante">Santé</option>   
                     <option value ="Vie">Vie</option>    
                     <option value ="Prevoyance">Prévoyance</option> 
                     <option value ="IARD">IARD</option> 
                     <option value ="Epargne">Epargne</option> 
                     <option value ="PlacementFinancier">Placement Financier</option> 
                </select><br />
                
                
                <input type="hidden" name="Courtier" value="<%=Court.getId()%>">
                <input type="hidden" name="action" value="FormCreerOffreCourtier">
            </fieldset>
            <input type="submit" value="Valider" />
            <input type="reset" value="Remettre à zéro" /> <br />
        </form>
    </body>
</html>

