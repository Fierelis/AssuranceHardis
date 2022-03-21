<%-- 
    Document   : CompteCourtier
    Created on : 10 mars 2022, 09:49:44
    Author     : alex_
--%>

<%@page import="Modele.Assureur"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="Assureur" scope="request" class="Modele.Assureur"></jsp:useBean>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Informations courtier</h1>
        
        <%Assureur Assur = Assureur;  %>
        <form>
        <button class="button login__submit">
            <span class="button__text">Home</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
            
              <input type="hidden" name="action" value="home">
        </form>
        
         <form method="get" action="AssuranceServlet">
            <input type="hidden" name="action" value="RechercherOffre">
            <input type="submit" value="Les Offres" />            
        </form>
        
        <form method="get" action="AssuranceServlet">
            <input type="hidden" name="action" value="CreerOffreAssureur">
            <input type="submit" value="Créer une offre" />            
        </form>
        <form method="get" action="AssuranceServlet">
            <input type="hidden" name="action" value="Deconnexion">
            <input type="submit" value="Se deconnnecter" />   
        </form>
        <form>
        <table>
            <tr>
                <td>N°</td>
                <td><input type="text" name="IdAssur" readonly="readonly" value="<%=Assur.getId()%>"></td>
            </tr>
            <tr>
                <td>Raison Sociale</td>
                <td><input type="text" name="RaisonSocialeAssur" value="<%=Assur.getRaisonSocialeAssureur() %>"></td>
            </tr>
            <tr>
                <td>Siege Social</td>
                <td><input type="text" name="SiegeSocialAssur" value="<%=Assur.getSiegeSocialAssureur() %>"></td>
            </tr>

            <tr>
                <td>Date Création</td>
                <td><input type="text" name="DateCreationAssur" readonly="readonly" value="<%=Assur.getDateCreation() %>"></td>
            </tr>
            <tr>
                <td>SIREN</td>
                <td><input type="date" name="SirenAssur" readonly="readonly" value="<%=Assur.getSirenAssureur() %>"></td>
            </tr>
            <tr>
                <td>Mail</td>
                <td><input type="text" name="MailAssur" value="<%=Assur.getMailAssureur()%>"></td>
            </tr>
            <tr>
                <td>Login</td>
                <td><input type="text" name="LoginAssur" value="<%=Assur.getLoginUserService()%>"></td>
            </tr>
                         <tr>
                <td>Mot de Passe</td>
                <td><input type="text" name="MdpAssur" value="<%=Assur.getPasswordUserService() %>"></td>
            </tr>
           
            
            </table>
            
            <input type="hidden" name="action" value="ModifierInfoAssureur">
            <input id="valid" type="submit" name="action" value="Valider les changements">
        </form>
         
    </body>
</html>
