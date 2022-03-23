<%-- 
    Document   : CreerOffreCourtier
    Created on : 10 mars 2022, 09:46:21
    Author     : alexa
--%>

<%@page import="Modele.Courtier"%>
<%@page import="Modele.Offre"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <jsp:useBean id="OffreJSP" scope="request" class="Modele.Offre"></jsp:useBean>
         <jsp:useBean id="Courtier" scope="request" class="Modele.Courtier"></jsp:useBean>
        <title>Creation d'offre</title>

    </head>
    <body>
        <h1>Création d'une offre</h1>

            <%Offre offer = OffreJSP;
            Courtier cour = Courtier;%>
  
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
        <form method="get" action="AssuranceServlet">
            <fieldset>
                <legend>Informations Offre</legend>     
                <label for="TypeOffre">Type d'offre : <span class="requis"></span></label>
                <input type="text" name="TypeOffre" readonly='readonly' value="<%=offer.getTypeOffre() %>">     
                
                <input type="hidden" name="courtier" readonly='readonly' value="<%=cour.getId() %>">
                <input type="hidden" name="assureur" readonly='readonly' value="<%=offer.getLAssurance().getId() %>">       
                       
                <label for="TypeProduit">Type de produit : <span class="requis"></span></label>
                <input name="TypeProduit" readonly='readonly' value="<%=offer.getLeTypeDeProduit().getNomTypeProduit() %>">  
                
                <label for="Description">Description : <span class="requis"></span></label>
                <input type="text" name="Description" readonly='readonly' value="<%=offer.getDescriptionOffreContractuelle() %>" size="40" maxlength="45" /><br />
              
                <label for="LAssureur">Assureur : <span class="requis"></span></label>
                <input type='text' name='LAssureur' readonly='readonly' value='<%=offer.getLAssurance().getRaisonSocialeAssureur() %>'>

                <label for="Prix">Prix de l'offre de l'assureur <span class="requis"></span></label>
                <input type="text" name="Prix" readonly='readonly' Value="<%=offer.getPrixOffre() %>" size="40" maxlength="100" /> <br />
                
                   <label for="PrixOffre">Prix négocié auprès de l'assureur <span class="requis"></span></label>
                <input type="text" name="PrixOffre" Value="" size="40" maxlength="100" /> <br />
            
                
                <input type="hidden" name="action" value="FormCreerOffreCourtierVia">
            </fieldset>
            <input type="submit" value="Valider" />
            <input type="reset" value="Remettre à zéro" /> <br />
        </form>
    </body>
</html>

