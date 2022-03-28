
<%-- 
    Document   : VoirOffre
    Created on : 14 mars 2022, 16:48:21
    Author     : alex_
--%>

<%@page import="Modele.Offre"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="Offre" scope="request" class="Modele.Offre"></jsp:useBean>

        <title>Offre</title>
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
                <div class="collapse navbar-collapse" id="navbarNav" style="display: flex; justify-content: flex-end">
                    <ul class="navbar-nav">

                        <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">home</button>
                                <input type="hidden" name="action" value="home"></form></li>
                        <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Recherche</button>
                                <input type="hidden" name="action" value="RechercherOffre"></form></li>
                        <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Créer une offre</button>
                                <input type="hidden" name="action" value="CreerOffreAssureur"></form></li>
                                <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Compte Assureur</button>
                            <input type="hidden" name="action" value="CompteAssureur"></form></li>
                        <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Se déconnecter</button>
                                <input type="hidden" name="action" value="Deconnexion"></form></li>
                    </ul>
                </div>
            </nav>
        </div>


    </header>
    <%Offre offer = Offre;%>
    <body>

        <div class ="row justify-content-center">
            <div class ="col-md-12 col-lg-10">
                <div class="login-wrap p-4 p-lg-5" style ="width : 100%"> 
                    <h4 class="text-center mb-4">Information sur l'offre</h4>  
                    <div id="TableauOffres">
                        <table class="table livres">
                            <thead class="thead-primary">
                                <tr>
                                    <th> Intitulé</th>
                                    <th> Informations</th>                                
                                </tr>
                            </thead>
                            <tbody>
                                <tr> <td>Type de Produit</td><td><%=offer.getLeTypeDeProduit().getNomTypeProduit()%></td></tr>
                                <tr> <td>Type de Contrat</td><td><%=offer.getTypeOffre()%></td></tr>
                                <tr> <td>Description Contrat</td><td><%=offer.getDescriptionOffreContractuelle()%></td></tr>
                                <tr> <td>Assureur</td><td><%=offer.getLAssurance().getRaisonSocialeAssureur()%></td></tr>
                                <%if (offer.getLeCourtier() != null) {%>

                                <tr> <td>Courtier</td>  <td><%=offer.getLeCourtier().getNomCourtier()%></td></tr>

                                <% }%>
                                <tr> <td>Prix de l'Offre</td><td><%=offer.getPrixOffre()%></td></tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
 






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
        
        
        
    </body>
</html>
