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
    <header01>
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
    </header01>
    <body>
        <div class ="container">
            <div class = "row">
                
                <div class="col-sm-6">
                    
                    <div class="card1">
                        <div class="image">
                            
                            <img src="img/Picto_Assureur2.png" alt=""/>
                        </div>
                        <div class="card-inner">
                            <div class="header01">
                                <h2>Assureur</h2>
                               
                            </div>
                            <div class="content">
                                <p>Content area</p>
                                <form>
                                 <button type="submit" class="form-control btn btn-primary submit px-3">S'inscrire</button>
                                 <input type="hidden" name="action" value="SelectionnerCreationAssureur"> </form>
                            </div>
                        </div>
                        
                    </div>
                       
                        
                </div>
                <div class="col-sm-6">
                    <div class="card1">
                        <div class="image">
                         
                            <img src="img/Picto_Clients.png" alt=""/>
                        </div>
                        <div class="card-inner">
                            <div class="header01">
                                <h2>Client</h2>
                              
                            </div>
                            <div class="content">
                                <p>Content area</p>
                                <form>
                                 <button type="submit" class="form-control btn btn-primary submit px-3">S'inscrire</button>
                                 <input type="hidden" name="action" value="SelectionnerCreationClientUnique"> </form>
                            </div>
                        </div>

                    </div>
                </div><div class="col-sm-6">
                    <div class="card1">
                        <div class="image">
                            <img src="img/Picto_Courtier2.png" alt=""/>
                            
                        </div>
                        <div class="card-inner">
                            <div class="header01">
                                <h2>Courtier</h2>
                               
                            </div>
                            <div class="content">
                                <p>Content area</p>
                                <form>
                                 <button type="submit" class="form-control btn btn-primary submit px-3">S'inscrire</button>
                                 <input type="hidden" name="action" value="SelectionnerCreationCourtier"> </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="card1">
                        <div class="image">
                            <img src="img/Picto_Entreprise2.png" alt=""/>
                            
                        </div>
                        <div class="card-inner">
                            <div class="header01">
                                <h2>Entreprise</h2>
                           
                               
                            </div>
                            <div class="content">
                                <p>Content area</p>
                                <form>
                                 <button type="submit" class="form-control btn btn-primary submit px-3">S'inscrire</button>
                                 <input type="hidden" name="action" value="SelectionnerCreationEntreprise"> </form>
                            </div>
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

