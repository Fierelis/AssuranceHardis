<%-- 
    Document   : Connexion
    Created on : 8 mars 2022, 10:57:53
    Author     : alex_
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html> -->
<!-- <html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> 
<!--  <link href="StyleSheets/LoginCSS.css" rel="stylesheet" type="text/css"/> -->
<!--  <title>Connexion</title>
</head>
<body>

<!--   <div class="container"> 
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

<div id="login">
    <h3 class="text-center text-white pt-5">Connexion</h3>
    <div class="container">
        <div>
        d
    </div>
</div>
</body> 
</html> -->
<!doctype html>
<html lang="en">
    <head>
        <title>Hardis-Accueil</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">
        <link href="StyleSheets/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> 


    </head>
    <header>
        <div class = "col-12" id = "navbar">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="#">Assurance Hardis</a>
                <!-- <img src = ".jpg" style = "height : 70px">  </img> -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">

                    </ul>
                </div>
            </nav>
        </div>
    </header>
    <body>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">

                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-12 col-lg-10">
                        <div class="wrap d-md-flex">
                            <div class="text-wrap p-4 p-lg-5 text-center d-flex align-items-center order-md-last">
                                <div class="text w-100">
                                    <h2>Bienvenue sur la plateforme du groupe Hardis</h2>
                                    <p>Vous n'avez pas de compte ?</p>
                                    <form>
                                    <button type="submit" class="form-control btn btn-white btn-outline-white">S'inscrire</button>
                                    <input type="hidden" name="action" value="MenuCreerCompte">
                                    </form>
                                </div>
                            </div>
                            <div class="login-wrap p-4 p-lg-5">
                                <div class="d-flex">
                                    <div class="w-100">
                                        <h3 class="mb-4">Connexion</h3>
                                    </div>

                                </div>
                                <form method="get" action="#" class="signin-form">
                                    <div class="form-group mb-3">
                                        <label class="label" for="name">Identifiant</label>
                                        <input type="text" class="form-control" name="login" placeholder="Identifiant" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="password">Mot de passe</label>
                                        <input type="password" class="form-control" name="mdp" placeholder="Mot de passe" required>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="form-control btn btn-primary submit px-3">Connexion</button>
                                        <input type="hidden" name="action" value="Connexion">
                                    </div>
                                    <div class="form-group d-md-flex">

                                        <div class="w-100 text-md-center">
                                            <a href="#">Mot de passe oublié</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>

    </body>
    <footer class = "footer" style="background-color: #f75959;">
        <hr style = "height : 30px ;">
        <p><b class="text-light"> BESOIN D'AIDE ?</b></p>
        <div class = "d-flex justify-content-between">
            <div>
                <a href="lien.jsp" class="btn btn-light" role="button">formulaire de contact</a>
            </div>
            <div>
                <a href="lien.jsp" class="btn btn-dark" role="button">F.A.Q</a>
            </div>
            <div>
                <button class = "btn btn-light" onclick = "affichernum()" id = "boutonassistance"> ligne assistance </button>
                <p id = "num"></p>
            </div>
        </div>
    </footer>
    <script> function affichernum() {
            document.getElementById("boutonassistance").hidden = true;
            document.getElementById("num").innerHTML = "04.00.00.00.00";
            document.getElementById("num").style.color = "black";
        }
    </script>

</html>

