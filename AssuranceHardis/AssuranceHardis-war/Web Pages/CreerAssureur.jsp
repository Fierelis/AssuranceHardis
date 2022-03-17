<!doctype html>
<html lang="en">
    <head>
        <title>Hardis-Accueil</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link href="StyleSheets/style.css" rel="stylesheet" type="text/css"/>

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

                        <li> Inscription assureur</li>
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

                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-12 col-lg-10">
                        <form action="#" class="signin-form">

                            <div class="wrap d-md-flex">
                                <div class="text-wrapp p-4 p-lg-5">



                                    <div class="form-group mb-3">
                                        <label class="label" for="LoginAssur">Identifiant</label>
                                        <input type="text" class="form-control" name ="LoginAssur" placeholder="Identifiant" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="name">Mot de passe</label>
                                        <input type="password" class="form-control" name ="MdpAssur" placeholder="Mot de passe" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="name">Adresse mail</label>
                                        <input type="text" class="form-control" name ="EmailAssur" placeholder="Mail" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="">N° Siren</label>
                                        <input type="number" class="form-control" name ="numSiren" placeholder="N°Siren (8chiffres)" required>
                                    </div>


                                </div>
                                <div class="login-wrap p-4 p-lg-5">




                                    <div class="form-group">
                                        <div class="form-group mb-3">
                                            <label class="label" for="name">Raison Sociale</label>
                                            <input type="text" class="form-control" name ="RaisonSocialeAssur" placeholder="Raison Sociale" required>
                                        </div> 
                                        <div class="form-group mb-3">
                                            <label class="label" for="name">Siège social</label>
                                            <input type="text" class="form-control" name ="SiegeSocialAssur" placeholder="Siège social" required>
                                        </div>

                                        <div class="form-group mb-3">
                                            <label class="label" for="">Date de création</label>
                                            <input type="date" class="form-control" name ="DateCreationAssur" placeholder="" required>
                                        </div>
                                        <br>


                                        <div class="form-group">
                                            <div class ="row justify content-center">
                                                <button type="submit" class="form-control btn btn-primary submit px-3">S'inscrire</button>
                                                <input type="hidden" name="action" value="CreerAssur">
                                            </div> 

                                        </div>



                                    </div> 

                                </div>

                            </div>
                        </form>
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

