<!doctype html>
<html lang="en">
    <head>
        <title>Hardis-Accueil</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
        <link href="StyleSheets/style.css" rel="stylesheet" type="text/css"/>

    </head>
   <header class ="header1">
        <div class = "" id = "navbar">
            <nav class="navbar navbar-expand-lg">
                
                 <img src = "img/sobrero.png" style = "height : 30px">  </img>
                <a class="navbar-brand" href="#">Sombrero</a>

                
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav"  style="display: flex; justify-content: flex-end">
                    <ul class="navbar-nav">

           
                        <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Home</button>
                            <input type="hidden" name="action" value="Deconnexion"></form></li>
                    </ul>
                </div>
            </nav>
        </div>
            
            
        </header>
    <body>
        <section class="ftco-section">

            <div class="container">
                
                <div class="row justify-content-center">
                    <div class="col-md-12 col-lg-10">
                        <form class="signin-form">
                            <div class="wrap d-md-flex">
                                <div class="text-wrapp p-4 p-lg-5">




                                    <div class="form-group mb-3">
                                        <label class="label" for="LoginCourtier">Identifiant</label>
                                        <input type="text" class="form-control" name ="LoginCourtier" placeholder="Identifiant" required>
                                    </div>
                                    <div class="form-group mb-3"> 
                                        <label class="label" for="name">Mot de passe</label>
                                        <input type="password" class="form-control" name ="MdpCourtier" placeholder="Mot de passe" id ="monmdp" required>
                                        <input type="checkbox" onclick="myFunctionP()"> Voir le mot de passe
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="name">Adresse mail</label>
                                        <input type="text" class="form-control" name ="Email" placeholder="Mail" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="name">Nom</label>
                                        <input type="text" class="form-control" name ="NomCourtier" placeholder="Nom" required>
                                    </div> 
                                    <div class="form-group mb-3">
                                        <label class="label" for="name">Pr�nom</label>
                                        <input type="text" class="form-control" name ="PrenomCourtier" placeholder="Nom" required>
                                    </div> 


                                </div>
                                <div class="login-wrap p-4 p-lg-5">




                                   <div class="form-group">
                                        <div class="form-group mb-3">
                                            <label class="label" for="name">Date de naissance</label>
                                            <input type="date" class="form-control" name ="DateNaissance" placeholder="" required>
                                        </div>

                                        <div class="form-group">
                                            <div class="form-group mb-3">
                                                <label class="label" for="AdresseCourtier">Adresse postale</label>
                                                <input type="text" class="form-control" name ="AdresseCourtier" placeholder="N� de rue, nom de rue" required>
                                            </div>
                                            <div class="form-group mb-3">
                                                <label class="label" for="VilleCourtier">Ville</label>
                                                <input type="text" class="form-control" name ="VilleCourtier" placeholder="Nom de ville" required>
                                            </div>
                                            <div class="form-group mb-3">
                                                <label class="label" for="CpCourtier">Code postal</label>
                                                <input type="number" class="form-control" name ="CPCourtier" placeholder="N� de rue, nom de rue" required>
                                            </div>
                                            <br>


                                            <div class="form-group">

                                                <div class ="row justify content-center">
                                                    <button type="submit" class="form-control btn btn-primary submit px-3">S'inscrire</button>
                                                    <input type="hidden" name="action" value="CreerCourtier">
                                                </div>
                                            </div>



                                        </div> 

                                    </div>

                                </div>
                            </div>
                        </form>
                    </div>
                    </section>

                    <script src="js/jquery.min.js"></script>
                    <script src="js/popper.js"></script>
                    <script src="js/bootstrap.min.js"></script>
                    <script src="js/main.js"></script>
                    <script>
                    function myFunctionP() {
  var x = document.getElementById("monmdp");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
} </script>
                    </body>
                   <footer class="footer-1">
          
          <div class="container">
            <div class="row">
              <div class="col-md-4 pr-md-5">
                <a href="#" class="footer-site-logo d-block mb-4">Sombrero</a>
                <p>Comparateur d'assurance</p>
              </div>
              <div class="col-md">
                <ul class="list-unstyled nav-links">
                  <li><a href="#">Home</a></li>
                  <li><a href="#">A propos</a></li>
                  <li><a href="#"></a></li>
                  <li><a href="#"></a></li>
                  <li><a href="#">Contact</a></li>
                </ul>
              </div>
              <div class="col-md">
                <ul class="list-unstyled nav-links">
                  <li><a href="#">Nos clients</a></li>
                  <li><a href="#">Nos courtiers</a></li>
                  <li><a href="#">Nos assureurs</a></li>
                  <li><a href="#">Nos avantages</a></li>
                  <li><a href="#">Actus</a></li>
                </ul>
              </div>
              <div class="col-md">
                <ul class="list-unstyled nav-links">
                  <li><a href="#">Privacy Policy</a></li>
                  <li><a href="#">Terms &amp; Conditions</a></li>
                  <li><a href="#">Partners</a></li>
                </ul>
              </div>
              <div class="col-md text-md-center">
                <ul class="social list-unstyled">
                  <li><a href="#"><span class="icon-instagram"></span></a></li>
                  <li><a href="#"><span class="icon-twitter"></span></a></li>
                  <li><a href="#"><span class="icon-facebook"></span></a></li>
                  <li><a href="#"><span class="icon-pinterest"></span></a></li>
                  <li><a href="#"><span class="icon-dribbble"></span></a></li>
                </ul>
                <p class=""><a href="#" class="btn btn-tertiary">Contactez-nous :)</a></p>
              </div>
            </div> 
    
            <div class="row ">
              <div class="col-12 text-center">
                <div class="copyright mt-5 pt-5">
                  <p><small>&copy; 2022 All Rights Reserved.</small></p>
                </div>
              </div>
            </div> 
          </div>
          
        </footer>
                    

                    </html>
