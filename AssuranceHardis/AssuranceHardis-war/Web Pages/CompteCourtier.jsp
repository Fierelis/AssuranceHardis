<%-- 
    Document   : CompteCourtier
    Created on : 10 mars 2022, 09:49:44
    Author     : alex_
--%>

<%@page import="Modele.Courtier"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="Courtier" scope="request" class="Modele.Courtier"></jsp:useBean>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Informations courtier</h1>
        
        <%Courtier Court = Courtier;  %>
        
        <form>
        <table>
            <tr>
                <td>N°</td>
                <td><input type="text" name="Idcourtier" readonly="readonly" value="<%=Court.getId()%>"></td>
            </tr>
            <tr>
                <td>Nom</td>
                <td><input type="text" name="NomC" value="<%=Court.getNomCourtier()%>"></td>
            </tr>
            <tr>
                <td>Prénom</td>
                <td><input type="text" name="PrenomC" value="<%=Court.getPrenomCourtier()%>"></td>
            </tr>
            <tr>
                <td>Mail</td>
                <td><input type="text" name="MailC" value="<%=Court.getMailCourtier()%>"></td>
            </tr>
            <tr>
                <td>Adresse</td>
                <td><input type="text" name="AdresseC" value="<%=Court.getAdresseCourtier()%>"></td>
            </tr>
            <tr>
                <td>Ville</td>
                <td><input type="text" name="VilleC" value="<%=Court.getVilleCourtier()%>"></td>
            </tr>
            <tr>
                <td>Code Postal</td>
                <td><input type="text" name="CPC" value="<%=Court.getCPCourtier()%>"></td>
            </tr>
            <tr>
                <td>Date Naissance</td>
                <td><input type="date" name="DateNaissanceC" value="<%=Court.getDateNaissanceCourtier()%>"></td>
            </tr>
            <tr>
                <td>Login</td>
                <td><input type="text" name="LoginC" value="<%=Court.getLoginUserService()%>"></td>
            </tr>
            <tr>
                <td>Mot de passe</td>
                <td><input type="password" name="MdpC" value="<%=Court.getPasswordUserService()%>"></td>
            </tr>
            
            </table>
            
            <input type="hidden" name="action" value="ModifierInfoCourtier">
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
