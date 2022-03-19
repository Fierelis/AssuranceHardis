<%-- 
    Document   : CompteClient
    Created on : 11 mars 2022, 09:42:16
    Author     : alex_
--%>

<%@page import="Modele.ClientUnique"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <jsp:useBean id="ClientU" scope="request" class="Modele.ClientUnique"></jsp:useBean>
        <title>JSP Page</title>
    </head>
    <body>
         <h1>Informations Client</h1>
        
        <%ClientUnique Client = ClientU;  %>
        
        <form>
        <table>
            <tr>
                <td>N°</td>
                <td><input type="text" name="Idlient" readonly="readonly" value="<%=ClientU.getId()%>"></td>
            </tr>
            <tr>
                <td>Nom</td>
                <td><input type="text" name="NomClient" value="<%=ClientU.getNom()%>"></td>
            </tr>
            <tr>
                <td>Prénom</td>
                <td><input type="text" name="PrenomClient" value="<%=ClientU.getPrenom()%>"></td>
            </tr>
            <tr>
                <td>Mail</td>
                <td><input type="text" name="MailClient" value="<%=ClientU.getMail()%>"></td>
            </tr>
            <tr>
                <td>Login</td>
                <td><input type="text" name="LoginClient" value="<%=ClientU.getLogin() %>"></td>
            </tr>
            <tr>
                <td>Mot de passe</td>
                <td><input type="hidden" name="MdpClient" value="<%=ClientU.getMdp()%>"></td>
            </tr>
            <tr>
                <td>Compte Bancaire Associé</td>
                <td><input type="text" name="IbanClient" value="<%=ClientU.getIban()%>"></td>
            </tr>
            <tr>     
            </table>
            
            <input type="hidden" name="action" value="ModifierInfoClient">
            <input id="valid" type="submit" name="Valider" value="Valider les changements">
        </form>
            <form>
                <button class="button login__submit">
                    <span class="button__text">Retour</span>
                     <i class="button__icon fas fa-chevron-right"></i>
                </button>
        
              <input type="hidden" name="action" value="RetourSessionClient">
            </form>
    </body>
</html>
