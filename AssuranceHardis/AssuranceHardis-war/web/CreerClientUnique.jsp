<%-- 
    Document   : CreerClientUnique
    Created on : 8 mars 2022, 09:56:53
    Author     : alexa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Création Client Unique</title>
    </head>
    <body>
        <h1>Création Client Unique</h1>
        <div>
            <form method="get" action="AssuranceServlet">
                <fieldset>
                    <legend>Informations Client</legend>
                    <label for="NomClient">Nom : <span class="requis">*</span></label>
                    <input type="text" name="NomClient" value="" size="20" maxlength="20" /><br />

                    <label for="PrenomClient">Prenom : <span class="requis">*</span></label>
                    <input type="text" name="PrenomClient" value="" size=“80" maxlength="20" /><br />

                    <label for="LoginClient">Login : <span class="requis">*</span></label>
                    <input type="text" name="LoginClient" Value="" size="80" maxlength="100" /> <br />

                    <label for="MdpClient">Mot de passe : <span class="requis">*</span></label>
                    <input type="password" name="MdpClient" value="" size="20" maxlength="20" /><br />

                    <label for="Iban">Iban : <span class="requis">*</span></label>
                    <input type="text" name="Iban" value="" size="20" maxlength="20" /><br />

                    <input type="hidden" name="action" value="CreerClientUnique">
                </fieldset>
                <input type="submit" value="Valider" />
                <input type="reset" value="Remettre à zéro" /> <br />
            </form>
        </div>

    </body>
</html>
