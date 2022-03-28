
<%-- 
    Document   : SessionAdmin
    Created on : 8 mars 2022, 11:00:41
    Author     : alex_
--%>

<%@page import="java.util.List"%>
<%@page import="Modele.Administrateur"%>
<%@page import="Modele.Contrat"%>
<%@page import="Modele.Assureur"%>
<%@page import="Modele.Courtier"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="Admin" scope="session" class="Modele.Administrateur"></jsp:useBean>
        <jsp:useBean id="contrat" scope="request" class="java.util.List"></jsp:useBean>
        <jsp:useBean id="Assureur" scope="request" class="java.util.List"></jsp:useBean>
        <jsp:useBean id="Courtier" scope="request" class="java.util.List"></jsp:useBean>
            <link href="StyleSheets/style.css" rel="stylesheet" type="text/css"/>

            <title>JSP Page</title>
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

                            <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Home</button>
                                    <input type="hidden" name="action" value="home"></form></li>
                            <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Inscriptions en Attente</button>
                                    <input type="hidden" name="action" value="ValidationUser"></form></li>
                            <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Logs Application</button>
                                    <input type="hidden" name="action" value="AccesLogs"></form></li>
                            <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Rechercher Offre</button>
                                    <input type="hidden" name="action" value="RechercherOffre"></form></li>
                            <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Se déconnecter</button>
                                    <input type="hidden" name="action" value="Deconnexion"></form></li>
                        </ul>
                    </div>
                </nav>
            </div>


        </header>
        <body>
        <%
            Administrateur admin = Admin;
            List<Contrat> con = contrat;
            List<Assureur> Assur = Assureur;
            List<Courtier> Court = Courtier;
        %>

        <div class ="row justify-content-center">

            <div class="text-wrapp p-4 p-lg-5 col-md-12 col-lg-10" style ="width : 100%">

                <div class="form-group mb-3">
                    <label class="label" for="name">Vues</label>
                    <select class="js-multiple-select form-control" name ="choixadmin" style ="width : 20%" id="choixadmin">

                        <option value="1">Assureurs</option>
                        <option value="2">Courtiers</option>
                        <option value="3">Contrats</option>
                    </select>
                </div>
                <table class ="table tableau" id="TableauAssureuradmin" style="width:100%">
                    <thead class="thead-primary">
                        <tr>
                            <th>Assureur</th>
                            <th>Siege social</th>
                            <th>SIREN</th>
                            <th>Date Création</th>
                        </tr>
                    </thead>
                    <tbody>

                        <%for (Assureur A : Assur) {%>
                        <tr>
                            <td><%=A.getRaisonSocialeAssureur()%></td>
                            <td><%=A.getSiegeSocialAssureur()%></td>
                            <td><%=A.getSirenAssureur()%></td>
                            <td><%=A.getDateCreation()%></td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
                

                <table class="table tableau" id="TableauCourtierAdmin" style="width:100%">
                    <thead class="thead-primary">

                        <tr>
                            <th>Nom</th>
                            <th>Prénom</th>
                            <th>Date de naissance</th>
                            <th>Adresse</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%for (Courtier C : Court) { %>
                        <tr>
                            <td><%=C.getNomCourtier()%></td>
                            <td><%=C.getPrenomCourtier()%></td>
                            <td><%=C.getDateNaissanceCourtier()%></td>
                            <td><%=C.getAdresseCourtier() + " " + C.getVilleCourtier() + " " + C.getCPCourtier()%></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                

                <table class ="table tableau" id ="tableaucontratsadmin" style="width:100%">

                    <thead class="thead-primary" >

                        <tr>
                            <th>Contrat n°</th>
                            <th>Type produit</th>
                            <th>Type offre</th>
                            <th>Client n°</th>
                            <th>Date de signature du contrat</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%for (Contrat c : con) { %>
                        <tr>
                            <td><%=c.getId()%></td>
                            <td><%=c.getLoffreDuContrat().getLeTypeDeProduit().getNomTypeProduit()%></td>
                            <td><%=c.getLoffreDuContrat().getTypeOffre()%></td>
                            <td><%=c.getLeClientduContrat().getId()%></td>
                            <td><%=c.getDateContrat()%></td>
                        </tr>
                         <% } %>
                    </tbody>
                </table>
               

                <script type="text/javascript">

                    var option = document.getElementById('choixadmin');
                    option.onchange = function() {

                        if (option.value == 1) {
                            document.getElementById('TableauAssureuradmin').style.display = '';
                            document.getElementById('TableauCourtierAdmin').style.display = 'none';
                            document.getElementById('tableaucontratsadmin').style.display = 'none';
                        } else if (option.value == 2) {
                            document.getElementById('TableauAssureuradmin').style.display = 'none';
                            document.getElementById('TableauCourtierAdmin').style.display = '';
                            document.getElementById('tableaucontratsadmin').style.display = 'none';
                        } else if (option.value == 3) {
                            document.getElementById('TableauAssureuradmin').style.display = 'none';
                            document.getElementById('TableauCourtierAdmin').style.display = 'none';
                            document.getElementById('tableaucontratsadmin').style.display = '';
                        } else {
                            document.getElementById('TableauAssureuradmin').style.display = 'none';
                            document.getElementById('TableauCourtierAdmin').style.display = 'none';
                            document.getElementById('tableaucontratsadmin').style.display = 'none';

                        }
                    };

                </script> 
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