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
        <jsp:useBean id="Entreprise" scope="request" class="Modele.Entreprise"></jsp:useBean>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Informations Entreprise</h1>
        
        <%Entreprise EBoite = Entreprise; 
        System.out.println(EBoite);
        %>
                <form>
            <button class="button login__submit">
                <span class="button__text">Home</span>
                <i class="button__icon fas fa-chevron-right"></i>
            </button>

            <input type="hidden" name="action" value="home">
        </form>
        <form>
            <button class="button login__submit">
                <span class="button__text">Rechercher une Offre</span>
                <i class="button__icon fas fa-chevron-right"></i>
            </button>

            <input type="hidden" name="action" value="RechercherOffre">
        </form>

        <form>
            <button class="button login__submit">
                <span class="button__text">Compte Entreprise</span>
                <i class="button__icon fas fa-chevron-right"></i>
            </button>

            <input type="hidden" name="action" value="CompteEntreprise">
        </form>

        <form>
            <button class="button login__submit">
                <span class="button__text">Se deconnecter</span>
                <i class="button__icon fas fa-chevron-right"></i>
            </button>

            <input type="hidden" name="action" value="Deconnexion">
        </form>
        <form>
        <table>
            <tr>
                <td>N°</td>
                <td><input type="text" name="IdEntreprise" readonly="readonly" value="<%=EBoite.getId()%>"></td>
            </tr>
            <tr>
                <td>Raison Sociale</td>
                <td><input type="text" name="NomEntreprise" value="<%=EBoite.getRaisonSocialeEntreprise() %>"></td>
            </tr>
            <tr>
                <td>Siège Social</td>
                <td><input type="text" name="SiegeSocialEntreprise" value="<%=EBoite.getSiegeSocialEntreprise() %>"></td>
            </tr>
            <tr>
                <td>Mail</td>
                <td><input type="text" name="MailEntreprise" value="<%=EBoite.getMail() %>"></td>
            </tr>
                        <tr>
                <td>Login</td>
                <td><input type="text" name="LoginEntreprise" value="<%=EBoite.getLogin() %>"></td>
            </tr>
            <tr>
                <td>Mot de passe</td>
                <td><input type="password" name="MdpEntreprise" value="<%=EBoite.getMdp()%>"></td>
            </tr>
            <tr>
                <td>Taille Entreprise</td>
                <td><input type="text" name="TailleEntreprise" value="<%=EBoite.getTailleEntreprise() %>"></td>
            </tr>
            <tr>
                <td>Date Création Entreprise</td>
                <td><%=EBoite.getDateCreationEntreprise() %></td>
            </tr>

            
            </table>
            
            <input type="hidden" name="action" value="ModifierInfoEntreprise">
            <input id="valid" type="submit" name="Valider" value="Valider les changements">
        </form>
    </body>
</html>
