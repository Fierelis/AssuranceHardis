<%-- 
    Document   : CreerAssureur
    Created on : 4 mars 2022, 13:48:59
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
           <form method="get" action="ServletAccesHotel">
    <fieldset>
        <legend>Informations Assureur</legend>
            <label for="NomAssureur">Nom <span class="requis">*</span></label>
            <input type="text" name="NomAssureur" value="" size="20" maxlength="20" /><br />
           
            <input type="hidden" name="action" value="insererAssureur">
    </fieldset>
            <input type="submit" value="Valider" />
            <input type="reset" value="Remettre à zéro" /> <br />
        </form>
    </body>
</html>
