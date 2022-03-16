<%-- 
    Document   : SouscriptionContrat
    Created on : 15 mars 2022, 16:58:15
    Author     : alex_
--%>

<%@page import="Modele.Offre"%>
<%@page import="Modele.ClientUnique"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="ContratJSP" scope="request" class="Modele.Offre"></jsp:useBean>
        <jsp:useBean id="ClientUniqueJSP" scope="request" class="Modele.ClientUnique"></jsp:useBean>
            <title>Souscription</title>
        </head>

        <body>
        <%ClientUnique Client = ClientUniqueJSP;
            Offre offer = ContratJSP;
        %>
        <form>
        <button class="button login__submit">
            <span class="button__text">Home</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
            
              <input type="hidden" name="action" value="home">
          </form>
        <h1>Confirmez vous la souscription à cette offrea</h1>
        <form>
            <fieldset><h2>Vous</h2>
                <label for='mail'>Adresse contact</label>
                <input type='text' name='mail' readonly='readonly' value='<%=Client.getMail()%>'><br>

                <label for='mail'>Nom</label>
                <input type='text' name='NomClient' readonly='readonly' value='<%=Client.getNom()%>'><br>

                <label for='mail'>Prenom</label>
                <input type='text' name='PrenomClient' readonly='readonly' value='<%=Client.getPrenom()%>'>     <br>  

                <input type='hidden' name='numClient' value='<%=Client.getId()%>'><br>
            </fieldset><br>

            <fieldset><h2>Votre Contrat</h2>
                <label for='assureur'>Assureur</label>
                <input type='text' name='assureur' readonly='readonly' value='<%=offer.getLAssurance()%>'><br>

                <label for='Produit'>Produit</label>
                <input type='text' name='Produit' readonly='readonly' value='<%=offer.getLeTypeDeProduit().getNomTypeProduit()%>'><br>

                <label for='typeoffre'>Offre</label>
                <input type='text' name='typeoffre' readonly='readonly' value='<%=offer.getTypeOffre()%>'> <br>

                <label for='description'>Description Contrat</label>
                <input type='text' name='description' readonly='readonly' value='<%=offer.getDescriptionOffreContractuelle()%>'> <br>

                <label for='Prix'>Prix</label>
                <input type='text' name='Prix' readonly='readonly' value='<%=offer.getPrixOffre()%>'> <br>

                <input type='hidden' name='numOffre' value='<%=offer.getId()%>'><br>

                <label for='set'>Durée de souscription au contrat : </label>
                <select name='combo'>
                    <option name='combo' value='6'>6 mois</option>
                    <option name='combo' value='12'>12 mois</option>
                    <option name='combo' value='24'>24 mois</option>
                </select>
            </fieldset>


            <input type='hidden' name='action' value='validerSouscription'>
            <button name='Souscrire' value='Souscrire'>


        </form>
    </body>
</html>
