<%-- 
    Document   : CompteCourtier
    Created on : 10 mars 2022, 09:49:44
    Author     : alex_
--%>

<%@page import="Modele.Entreprise"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="Boite" scope="request" class="Modele.Entreprise"></jsp:useBean>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Informations courtier</h1>
        
        <%Entreprise EBoite = Boite;  %>
        
        <form>
        <table>
            <tr>
                <td>N°</td>
                <td><input type="text" name="IdEntreprise" readonly="readonly" value="<%=Boite.getId()%>"></td>
            </tr>
            <tr>
                <td>Raison Sociale</td>
                <td><input type="text" name="NomEntreprise" value="<%=Boite.getRaisonSocialeEntreprise() %>"></td>
            </tr>
            <tr>
                <td>Siège Social</td>
                <td><input type="text" name="SiegeSocialEntreprise" value="<%=Boite.getSiegeSocialEntreprise() %>"></td>
            </tr>
            <tr>
                <td>Mail</td>
                <td><input type="text" name="MailEntreprise" value="<%=Boite.getMail() %>"></td>
            </tr>
                        <tr>
                <td>Login</td>
                <td><input type="text" name="LoginEntreprise" value="<%=Boite.getLogin() %>"></td>
            </tr>
            <tr>
                <td>Mot de passe</td>
                <td><input type="password" name="MdpEntreprise" value="<%=Boite.getMdp()%>"></td>
            </tr>
            <tr>
                <td>Taille Entreprise</td>
                <td><input type="text" name="TailleEntreprise" value="<%=Boite.getTailleEntreprise() %>"></td>
            </tr>
            <tr>
                <td>Date Création Entreprise</td>
                <td><%=Boite.getDateCreationEntreprise() %></td>
            </tr>

            
            </table>
            
            <input type="hidden" name="action" value="ModifierInfoEntreprise">
            <input id="valid" type="submit" name="Valider" value="Valider les changements">
        </form>
            <form>
                <button class="button login__submit">
                    <span class="button__text">Home</span>
                     <i class="button__icon fas fa-chevron-right"></i>
                </button>
        
              <input type="hidden" name="action" value="home">
            </form>
    </body>
</html>
