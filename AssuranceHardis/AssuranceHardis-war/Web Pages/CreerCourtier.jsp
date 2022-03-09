<%-- 
    Document   : CreerCourtier
    Created on : 8 mars 2022, 16:02:31
    Author     : alex_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Creer Courtier</title>
    </head>
    <body>
             <h1>Création Courtier</h1>
        <div>
            <form method="get" action="AssuranceServlet">
                <fieldset>
                    <legend>Informations Courtier</legend>
                    
                    <label for="Email">Email : <span class="requis"></span></label>
                    <input type="text" name="Email" value="" size="40" maxlength="45" /><br />

                    <label for="LoginCourtier">Login : <span class="requis"></span></label>
                    <input type="text" name="LoginCourtier" Value="" size="40" maxlength="100" /> <br />
                    
                    <label for="MdpCourtier">Mot de passe : <span class="requis"></span></label>
                    <input type="password" name="MdpCourtier" value="" size="40" maxlength="45" /><br />
                    
                    <label for="NomCourtier">Nom : <span class="requis"></span></label>
                    <input type="text" name="NomCourtier" value="" size="40" maxlength="45" /><br />
                    
                    <label for="PrenomCourtier">Prenom : <span class="requis"></span></label>
                    <input type="text" name="PrenomCourtier" value="" size=“40" maxlength="45" /><br />
                    
                    <label for="DateNaissance">Date de Naissance : <span class="requis"></span></label>
                    <input type="Date" name="DateNaissance" value="" size="40" maxlength="45" /><br />
                    
                    <label for="AdresseCourtier">Adresse : <span class="requis"></span></label>
                    <input type="text" name="AdresseCourtier" value="" size="40" maxlength="45" /><br />
                    
                    <label for="VilleCourtier">Ville : <span class="requis"></span></label>
                    <input type="text" name="VilleCourtier" value="" size="40" maxlength="45" /><br />
                    
                    <label for="CPCourtier">Code Postal : <span class="requis"></span></label>
                    <input type="text" name="CPCourtier" value="" size="40" maxlength="45" /><br />


                    <input type="hidden" name="action" value="CreerCourtier">
                </fieldset>
                <input type="submit" value="Valider" />
                <input type="reset" value="Remettre à zéro" /> <br />
            </form>
    </body>
</html>
