

<%-- 
    Document   : AccesLogs
    Created on : 16 mars 2022, 17:50:05
    Author     : alex_
--%>

<%@page import="java.util.List"%>
<%@page import="Modele.Logs"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="logs" scope="request" class="java.util.List"></jsp:useBean>
            <title>JSP Page</title>
            <link href="StyleSheets/style.css" rel="stylesheet" type="text/css"/>


        </head>
        <header class ="header1">
            <div class = "" id = "navbar">
                <nav class="navbar navbar-expand-lg">
                    <img src = "img/sobrero.png" style = "height : 70px">  </img>
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
            List<Logs> log = logs;
        %>
        <div class ="row justify-content-center">
            <div class ="col-md-12 col-lg-10">
                <div class="wrap d-md-flex">
                    <div class="login-wrap p-4 p-lg-5" style ="width : 100%">


                        <div class="form-group mb-3">
                            <label class="label" for="name">En attente de validation</label>
                            <select class="js-multiple-select form-control" name ="choix" style ="width : 20%" id="choixadmin">

                                <option value="1">Client</option>
                                <option value="2">Entreprise</option>
                                <option value="3">Courtiers</option>
                                <option value="4">Assureurs</option>
                            </select>
                        </div>


                        <table class ="table" id ="tableauclientsattente">
                            <thead class="thead-primary" >
                                <tr>
                                    <th>Type</th>
                                    <th>Date</th>
                                    <th>Utilisateur</th>
                                    <th>Statut inscription</th>
                                    <th>Validation</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Logs L : log) {
                                        if (L.getLogClientUnique() != null) {
                                %>

                                <tr>
                                    <td><%=L.getTypeLog()%></td>
                                    <td><%=L.getDateLog()%></td>
                                    <td><%=L.getLogClientUnique().getLogin()%></td>
                                    <%if (L.getLogClientUnique().isActivationUser() == true) { %>
                                    <td style = "text-color : green">Validée</td>
                                    <% } else {%>
                                    <td>En Attente</td>
                                    <% } %>
                                    <td>
                                        <%if (L.getLogClientUnique().isActivationUser() == false) {%>
                                        <form>
                                            <input type="hidden" name="IdClientUnique" value="<%=L.getLogClientUnique().getId()%>">
                                            <input type="Submit" value="Valider Inscription">
                                            <input type="hidden" name="action" value="ValiderInscriptionClientUnique">

                                        </form>
                                        <% } %>
                                    </td>
                                </tr>
                                <% }
                 } %>
                                </body>
                        </table>




                        <table class ="table" id ="tableauentrepriseattente">
                            <thead class="thead-primary" >
                                <tr>
                                    <th>Type</th>
                                    <th>Date</th>
                                    <th>Utilisateur</th>
                                    <th>Statut inscription</th>
                                    <th>Validation</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Logs L : log) {
                    if (L.getLogEntreprise() != null) {%>
                                <tr>
                                    <td><%=L.getTypeLog()%></td>
                                    <td><%=L.getDateLog()%></td>
                                    <td><%=L.getLogEntreprise().getLogin()%></td>
                                    <%if (L.getLogEntreprise().isActivationUser() == true) { %>
                                    <td><mark class ="mark0">Validée</mark></td>
                                    <% } else {%>
                                    <td><mark class ="mark1">En Attente</mark></td>
                                    <% } %>

                                    <td>
                                        <%if (L.getLogEntreprise().isActivationUser() == false) {%>
                                        <form>
                                            <input type="hidden" name="IdEntreprise" value="<%=L.getLogEntreprise().getId()%>">
                                            <input type="Submit" value="Valider Inscription">
                                            <input type="hidden" name="action" value="ValiderInscriptionEntreprise">

                                        </form>
                                        <% } %>
                                    </td>
                                </tr>
                                <% }
                 } %>
                            </tbody>
                        </table>




                        <table class ="table" id ="tableaucourtierattente">
                            <thead class="thead-primary" >
                                <tr>
                                    <th>Type</th>
                                    <th>Date</th>
                                    <th>Utilisateur</th>
                                    <th>Statut inscription</th>
                                    <th>Validation</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Logs L : log) {
                    if (L.getLogCourtier() != null) {%>
                                <tr>
                                    <td><%=L.getTypeLog()%></td>
                                    <td><%=L.getDateLog()%></td>
                                    <td><%=L.getLogCourtier().getMailCourtier()%></td>
                                    <%if (L.getLogCourtier().isActivationUser() == true) { %>
                                    <td>Validée</td>
                                    <% } else {%>
                                    <td>En Attente</td>
                                    <% } %>

                                    <td>
                                        <%if (L.getLogCourtier().isActivationUser() == false) {%>
                                        <form>
                                            <input type="hidden" name="IdCourtier" value="<%=L.getLogCourtier().getId()%>">
                                            <input type="Submit" value="Valider Inscription">
                                            <input type="hidden" name="action" value="ValiderInscriptionCourtier">

                                        </form>
                                        <% } %>
                                    </td>
                                </tr>
                                <% }
                  } %>
                            </tbody>
                        </table>




                        <table class ="table" id ="tableauassurattente">
                            <thead class="thead-primary" >

                                <tr>
                                    <th>Type</th>
                                    <th>Date</th>
                                    <th>Utilisateur</th>
                                    <th>Statut inscription</th>
                                    <th>Validation</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Logs L : log) {
                    if (L.getLogAssureur() != null) {%>
                                <tr>
                                    <td><%=L.getTypeLog()%></td>
                                    <td><%=L.getDateLog()%></td>
                                    <td><%=L.getLogAssureur().getRaisonSocialeAssureur()%></td>
                                    <%if (L.getLogAssureur().isActivationUser() == true) { %>
                                    <td>Validée</td>
                                    <% } else {%>
                                    <td>En Attente</td>
                                    <% } %>

                                    <td>
                                        <%if (L.getLogAssureur().isActivationUser() == false) {%>
                                        <form>
                                            <input type="hidden" name="IdAssureur" value="<%=L.getLogAssureur().getId()%>">
                                            <input type="Submit" value="Valider Inscription">
                                            <input type="hidden" name="action" value="ValiderInscriptionAssureur">

                                        </form>
                                        <% } %>
                                    </td>
                                </tr>
                                <% }
                 }%>
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
        <script type="text/javascript">

            var option = document.getElementById('choixadmin');
            option.onchange = function () {

                if (option.value == 1) {
                    document.getElementById('tableauclientsattente').style.display = '';
                    document.getElementById('tableauentrepriseattente').style.display = 'none';
                    document.getElementById('tableaucourtierattente').style.display = 'none';
                    document.getElementById('tableauassurattente').style.display = 'none';
                } else if (option.value == 2) {
                    document.getElementById('tableauclientsattente').style.display = 'none';
                    document.getElementById('tableauentrepriseattente').style.display = '';
                    document.getElementById('tableaucourtierattente').style.display = 'none';
                    document.getElementById('tableauassurattente').style.display = 'none';
                } else if (option.value == 3) {
                    document.getElementById('tableauclientsattente').style.display = 'none';
                    document.getElementById('tableauentrepriseattente').style.display = 'none';
                    document.getElementById('tableaucourtierattente').style.display = '';
                    document.getElementById('tableauassurattente').style.display = 'none';
                } else if (option.value == 4) {
                    document.getElementById('tableauclientsattente').style.display = 'none';
                    document.getElementById('tableauentrepriseattente').style.display = 'none';
                    document.getElementById('tableaucourtierattente').style.display = 'none';
                    document.getElementById('tableauassurattente').style.display = '';
                } else {
                    document.getElementById('tableauclientsattente').style.display = 'none';
                    document.getElementById('tableauentrepriseattente').style.display = 'none';
                    document.getElementById('tableaucourtierattente').style.display = 'none';
                    document.getElementById('tableauassurattente').style.display = 'none';

                }
            };

        </script> 
    </body>


</html>
