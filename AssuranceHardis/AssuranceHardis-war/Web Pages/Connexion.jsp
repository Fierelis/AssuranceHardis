<%-- 
    Document   : Connexion
    Created on : 8 mars 2022, 10:57:53
    Author     : alex_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="StyleSheets/LoginCSS.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
 
        <div class="container">
	<div class="screen">
		<div class="screen__content">
			<form class="login">
				<div class="login__field">
					<i class="login__icon fas fa-user"></i>
					<input type="text" class="login__input" name="login" placeholder="User login">
				</div>
				<div class="login__field">
					<i class="login__icon fas fa-lock"></i>
					<input type="password" class="login__input" name="mdp" placeholder="Password">
				</div>
				<button type="submit" class="button login__submit" name="Connexion"
					<span class="button__text">Log In Now</span>
					<i class="button__icon fas fa-chevron-right"></i>
                                </button><br>
                                
                                
                                <input type="hidden" name="action" value="Connexion">
			</form>
                    <form>
                                <button class="button login__submit">
                                    <span class="button__text">Create Account</span>
                                    <i class="button__icon fas fa-chevron-right"></i>
				</button>
                                <input type="hidden" name="action" value="MenuCreerCompte">
                    </form>
		</div>
		<div class="screen__background">
			<span class="screen__background__shape screen__background__shape4"></span>
			<span class="screen__background__shape screen__background__shape3"></span>		
			<span class="screen__background__shape screen__background__shape2"></span>
			<span class="screen__background__shape screen__background__shape1"></span>
		</div>		
	</div>
            </div>
    </body> 
</html>
