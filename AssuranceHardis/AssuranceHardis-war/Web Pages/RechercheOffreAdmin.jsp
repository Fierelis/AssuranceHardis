

<%-- 
    Document   : RechercheOffre
    Created on : 10 mars 2022, 10:28:27
    Author     : alex_
--%>

<%@page import="Modele.Administrateur"%>
<%@page import="java.util.List"%>
<%@page import="Modele.Offre"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="Administrateur" scope="request" class="Modele.Administrateur"></jsp:useBean>
        <jsp:useBean id="listeOffre" scope="request" class="java.util.List"></jsp:useBean>
         <link href="StyleSheets/style.css" rel="stylesheet" type="text/css"/>
            <title>Recherche d'offre</title>
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
                        <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Inscriptions en attente</button>
                            <input type="hidden" name="action" value="ValidationUser"></form></li>
                        <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Log Application</button>
                            <input type="hidden" name="action" value="AccesLogs"></form></li>
                        <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Rechercher offres</button>
                            <input type="hidden" name="action" value="RechercherOffre"></form></li>
                    </ul>
                </div>
            </nav>
        </div>
            
            
        </header>
        <body>
        <%Administrateur admin = Administrateur;%>
        
        <h1>Recherche d'offre </h1>
        <div class ="row justify-content-center">
            <div class ="col-md-12 col-lg-10">
                <div class="login-wrap p-4 p-lg-5" style ="width : 100%">
                <h4 class="text-center mb-4">Offres disponibles</h4>

        <div id="TableauOffres">
         
            <div class="form-group mb-3">
                 <label class="label" for="name">Filtre</label>
           <input type="text" class="table-filter" size ="20" data-table="livres">
            </div>
            <table class ="table livres">
                <thead class="thead-primary">
                <tr>
                    <th> Type d'Offre</th>
                    <th> Description de l'offre</th>
                    <th> Prix de l'offre</th>
                    <th> Le type de produit</th>
                    <th>Détails</th>
                </tr>
                </thead>
                <tbody>
                <%
                    List<Offre> ListeFiltreeOffres = listeOffre;
                    for (Offre ExistOffre : ListeFiltreeOffres) {
                %>  
                <tr><td><%=ExistOffre.getTypeOffre()%></td>
                    <td><%=ExistOffre.getDescriptionOffreContractuelle()%></td>
                    <td><%=ExistOffre.getPrixOffre()%></td>
                    <td><%=ExistOffre.getLeTypeDeProduit().getNomTypeProduit()%></td>
                    <td>
                        <form>
                            <input type="hidden" name="idOffre" value="<%=ExistOffre.getId()%>">
                            <button type="submit" class="form-control btn2 btn2-primary submit px-3">Voir offre</button>
                            <input type="hidden" name="action" value="VoirOffreAssureur">
                        </form>
                    </td>
                </tr>
                <%}%>
                </tbody>
            </table>
        </div>
                </div>
            </div>
        </div>
        <script>
            (function () {
                'use strict';
                var TableFilter = (function () {
                    var Arr = Array.prototype;
                    var input;
                    function onInputEvent(e) {
                        input = e.target;
                        var table1 = document.getElementsByClassName(input.getAttribute('data-table'));
                        Arr.forEach.call(table1, function (table) {
                            Arr.forEach.call(table.tBodies, function (tbody) {
                                Arr.forEach.call(tbody.rows, filter);
                            });
                        });
                    }
                    function filter(row) {
                        var text = row.textContent.toLowerCase();
                        var val = input.value.toLowerCase();
                        row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
                    }
                    return {
                        init: function () {
                            var inputs = document.getElementsByClassName('table-filter');
                            Arr.forEach.call(inputs, function (input) {
                                input.oninput = onInputEvent;
                            });
                        }
                    };
                })();
                TableFilter.init();
            })();
        </script>
        <script src="/scripts/js-table-filter.js"></script>
 <footer class="footer-1">
          
          <div class="container">
            <div class="row">
              <div class="col-md-4 pr-md-5">
                <a href="#" class="footer-site-logo d-block mb-4">Sombrero</a>
                <p>Comparateur d'assurance </p>
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
