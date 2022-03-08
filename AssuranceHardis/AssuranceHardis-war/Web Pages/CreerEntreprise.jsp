<%-- 
    Document   : CreerEntreprise
    Created on : 8 mars 2022, 15:17:04
    Author     : alexa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Création Entreprise</title>
    </head>
    <body>
        <h1>Création d'une Entreprise </h1>
        <div>
            <form method="get" action="AssuranceServlet">
                <fieldset>
                    <legend>Informations Entreprise</legend>
                    
                    <label for="LoginEntreprise">Login : <span class="requis">*</span></label>
                    <input type="text" name="LoginEntreprise" Value="" size="40" maxlength="100" /> <br />
                    <label for="MdpEntreprise">Mot de passe : <span class="requis">*</span></label>
                    <input type="password" name="MdpEntreprise" value="" size="40" maxlength="45" /><br />        
                    <label for="NomEntreprise">Nom : <span class="requis">*</span></label>
                    <input type="text" name="NomEntreprise" value="" size="40" maxlength="45" /><br />
                    <label for="RaisonSocial">Raison Social de l'entreprise : <span class="requis">*</span></label>
                    <input type="text" name="RaisonSocial" value="" size=“40" maxlength="45" /><br />               
                    <label for="DateCreationEntreprise">Date de création de l'entreprise : <span class="requis">*</span></label>
                    <input type="date" name="DateCreationEntreprise" value="" size="40" maxlength="45" /><br />
                    <label for="Email">Email : <span class="requis">*</span></label>
                    <input type="text" name="Email" value="" size="40" maxlength="45" /><br />
                    <label for="SiegeSocial">Siège Social : <span class="requis">*</span></label>
                    <input type="text" name="SiegeSocial" value="" size="40" maxlength="45" /><br />
                    <label for="Taille">Taille de l'entreprise : <span class="requis">*</span></label>
                    <select name="TailleEntreprise">                  
                        <option value ="Petite">Petite</option>   
                        <option value ="Moyenne">Moyenne</option>   
                        <option value ="Grande">Grande</option>   
                    </select><br />                  
                    <input type="hidden" name="action" value="CreerEntreprise">
                </fieldset>
                <input type="submit" value="Valider" />
                <input type="reset" value="Remettre à zéro" /> <br />
            </form>
        </div>
    </body>
</html>
