<%-- 
    Document   : MenuCreationCompte
    Created on : 8 mars 2022, 14:44:29
    Author     : alex_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="StyleSheets/ChoiceCSS.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <form>
            <button type="submit" class="button login__submit" name="Connexion"
                <span class="button__text">Je suis un Particulier</span>
                <i class="button__icon fas fa-chevron-right"></i>
            </button><br>
            <input type="hidden" name="action" value="SelectionnerCreationClientUnique">
            </form>
        
        <form>
             <button type="submit" class="button login__submit" name="Connexion"
                <span class="button__text">Je suis une entreprise</span>
                <i class="button__icon fas fa-chevron-right"></i>
            </button><br>           
            <input type="hidden" name="action" value="SelectionnerCreationEntreprise">
            </form>
            
            <form>
             <button type="submit" class="button login__submit" name="Connexion"
                <span class="button__text">Je suis Courtier</span>
                <i class="button__icon fas fa-chevron-right"></i>
             </button><br>
            <input type="hidden" name="action" value="SelectionnerCreationCourtier">
            </form>
            
            <form>
             <button type="submit" class="button login__submit" name="Connexion"
                <span class="button__text">Je suis Assureur</span>
                <i class="button__icon fas fa-chevron-right"></i>
            </button><br>
            <input type="hidden" name="action" value="SelectionnerCreationAssureur">
            </form>
            
            <form>
            <button type="submit" class="button login__submit" name="Connexion"
                <span class="button__text">Je suis Administrateur</span>
                <i class="button__icon fas fa-chevron-right"></i>
            </button><br>
            <input type="hidden" name="action" value="SelectionnerCreationAdmin">
        </form>
    </body>
</html>
