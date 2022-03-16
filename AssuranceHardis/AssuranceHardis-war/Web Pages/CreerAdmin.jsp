<%-- 
    Document   : CreerAdmin
    Created on : 9 mars 2022, 09:21:47
    Author     : alexa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Créer Admin</title>
    </head>
    <body>
              <h1>Création Administrateur</h1>
        <div>
            <form method="get" action="AssuranceServlet">
                <fieldset>
                    <legend>Informations Administrateur </legend>
                    
                    <label for="NomAdmin">Nom : <span class="requis"></span></label>
                    <input type="text" name="NomAdmin" value="" size="40" maxlength="45" /><br />

                    <label for="PrenomAdmin">Prenom : <span class="requis"></span></label>
                    <input type="text" name="PrenomAdmin" Value="" size="40" maxlength="100" /> <br />
                    
                    <label for="MailAdmin">Mail : <span class="requis"></span></label>
                    <input type="text" name="MailAdmin" value="" size="40" maxlength="45" /><br />
                    
                    <label for="LoginAdmin"> Login : <span class="requis"></span></label>
                    <input type="text" name="LoginAdmin" value="" size="40" maxlength="45" /><br />

                    <label for="MdpAdmin">Mot de passe : <span class="requis"></span></label>
                    <input type="password" name="MdpAdmin" value="" size="40" maxlength="45" /><br />
               

                    <input type="hidden" name="action" value="CreerAdmin">
                </fieldset>
                <input type="submit" value="Valider" />
                <input type="reset" value="Remettre à zéro" /> <br />
            </form>
    </body>
</html>

