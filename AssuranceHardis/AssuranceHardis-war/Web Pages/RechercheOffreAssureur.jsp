<%-- 
    Document   : RechercheOffre
    Created on : 10 mars 2022, 10:28:27
    Author     : alex_
--%>

<%@page import="Modele.Assureur"%>
<%@page import="java.util.List"%>
<%@page import="Modele.Offre"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="Assureur" scope="request" class="Modele.Assureur"></jsp:useBean>
        <jsp:useBean id="listeOffre" scope="request" class="java.util.List"></jsp:useBean>
            <title>Recherche d'offre</title>
            
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

                        <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">home</button>
                            <input type="hidden" name="action" value="home"></form></li>
                        <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Recherche</button>
                            <input type="hidden" name="action" value="RechercherOffre"></form></li>
                        <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Créer une offre</button>
                            <input type="hidden" name="action" value="CreerOffreAssureur"></form></li>
                        <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Se déconnecter</button>
                            <input type="hidden" name="action" value="Deconnexion"></form></li>
                    </ul>
                </div>
            </nav>
        </div>
            
            
        </header>
        </head>
        <body>
        <%Assureur Assur = Assureur;
        //Assur.getId();
        %>
        <h1>Recherche d'offre </h1>
     

        <div id="TableauOffres">
            <h2>Totalités des offre</h2>
            <p> Filtrer : <input type="text" class="table-filter" data-table="livres"></p>

            <table class="livres">
                <tr>
                    <td> Type d'Offre</td>
                    <td> Description de l'offre</td>
                    <td> Prix de l'offre</td>
                    <td> Le type de produit</td>
                </tr>
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
                            <input type="Submit" value="Voir l'Offre">
                            <input type="hidden" name="action" value="VoirOffreAssureur">
                        </form>
                    </td>
                </tr>
                <%}%>
            </table>
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

    </body>
</html>
