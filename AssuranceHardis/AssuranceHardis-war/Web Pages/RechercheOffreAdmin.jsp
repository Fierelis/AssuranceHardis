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
        <jsp:useBean id="AdministrateurJSP" scope="request" class="Modele.Administrateur"></jsp:useBean>
        <jsp:useBean id="listeOffre" scope="request" class="java.util.List"></jsp:useBean>
        <title>JSP Page</title>
    </head>
    <body>
         <%Administrateur admin = AdministrateurJSP;%>
         <h1>C la Reushairshe</h1>
        
        <form>
        <button class="button login__submit">
            <span class="button__text">Home</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
            
              <input type="hidden" name="action" value="home">
        </form>
          <form>
        <button class="button login__submit">
            <span class="button__text">Inscriptions en Attente</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
            
              <input type="hidden" name="action" value="ValidationUser">
        </form>
         
          <form>
        <button class="button login__submit">
            <span class="button__text">Log Application</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
            
              <input type="hidden" name="action" value="AccesLogs">
        </form>
         
         <form>
        <button class="button login__submit">
            <span class="button__text">Rechercher Offres</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
            
              <input type="hidden" name="action" value="RechercherOffre">
        </form>
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
                        for(Offre ExistOffre : ListeFiltreeOffres){
                    %>  <tr><td><%=ExistOffre.getTypeOffre() %></td>
                            <td><%=ExistOffre.getDescriptionOffreContractuelle()%></td>
                            <td><%=ExistOffre.getPrixOffre() %></td>                       
                            <td><%=ExistOffre.getLeTypeDeProduit().getNomTypeProduit() %></td>
                            <td>
                                <form>
                                    <input type="hidden" name="idOffre" value="<%=ExistOffre.getId()%>">
                                    <input type="Submit" value="Voir l'Offre">
                                    <input type="hidden" name="action" value="VoirOffre">
                                </form>
                            </td>
                        </tr>
                       <%}%>
            </table>
            </div>
            <p>Ptin de ses morts</p>
            <script>
            (function() {
  'use strict';

  var TableFilter = (function() {
    var Arr = Array.prototype;
    var input;

    function onInputEvent(e) {
      input = e.target;
      var table1 = document.getElementsByClassName(input.getAttribute('data-table'));
      Arr.forEach.call(table1, function(table) {
        Arr.forEach.call(table.tBodies, function(tbody) {
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
      init: function() {
        var inputs = document.getElementsByClassName('table-filter');
        Arr.forEach.call(inputs, function(input) {
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
