<%-- 
    Document   : CreerAssureur
    Created on : 8 mars 2022, 16:20:34
    Author     : alex_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
              <h1>Création Assureur</h1>
        <div>
            <form method="get" action="AssuranceServlet">
                <fieldset>
                    <legend>Informations Assureur</legend>
                    
                    <label for="EmailAssur">Email : <span class="requis"></span></label>
                    <input type="text" name="EmailAssur" value="" size="40" maxlength="45" /><br />

                    <label for="LoginAssur">Login : <span class="requis"></span></label>
                    <input type="text" name="LoginAssur" Value="" size="40" maxlength="100" /> <br />
                    
                    <label for="MdpAssur">Mot de passe : <span class="requis"></span></label>
                    <input type="password" name="MdpAssur" value="" size="40" maxlength="45" /><br />
                    
                    <label for="RaisonSocialeAssur">Raison Sociale <span class="requis"></span></label>
                    <input type="text" name="RaisonSocialeAssur" value="" size="40" maxlength="45" /><br />

                    <label for="SiegeSocialAssur">Siege Social : <span class="requis"></span></label>
                    <input type="text" name="SiegeSocialAssur" value="" size="40" maxlength="45" /><br />
                    
                    <label for="DateCreationAssur">Date Création : <span class="requis"></span></label>
                    <input type="Date" name="DateCreationAssur" value="" size="40" maxlength="45" /><br />


                    <input type="hidden" name="action" value="CreerAssur">
                </fieldset>
                <input type="submit" value="Valider" />
                <input type="reset" value="Remettre à zéro" /> <br />
            </form>
    </body>
</html>
