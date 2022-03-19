<%-- 
    Document   : CreerOffre
    Created on : 9 mars 2022, 16:41:18
    Author     : alex_
--%>

<%@page import="Modele.Assureur"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="AssureurCreerOffreAssureur" scope="request" class="Modele.Assureur"></jsp:useBean>
        <title>Creation d'offre</title>
    </head>
    <body>
        <% Assureur a= AssureurCreerOffreAssureur;%>
        
        <h1>Création d'une offre</h1>
        <form>
        <button class="button login__submit">
            <span class="button__text">Home</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
            
              <input type="hidden" name="action" value="home">
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

      
                
                <label for="TypeProduit">Type de produit : <span class="requis"></span></label>
                <select name="TypeProduit">                      
                    <option value ="Sante">Santé</option>   
                    <option value ="Vie">Vie</option>    
                    <option value ="Prevoyance">Prévoyance</option> 
                    <option value ="IARD">IARD</option> 
                    <option value ="Epargne">Epargne</option> 
                    <option value ="PlacementFinancier">Placement Financier</option> 
                </select><br />
                
                <input type="hidden" name="Assureur" value="<%=a.getId()%>">
                
                <input type="hidden" name="action" value="FormCreerOffreAssureur">
            </fieldset>
            <input type="submit" value="Valider" />
            <input type="reset" value="Remettre à zéro" /> <br />
        </form>
    </body>
</html>
