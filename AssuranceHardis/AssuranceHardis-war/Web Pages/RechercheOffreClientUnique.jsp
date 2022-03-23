<%-- 
    Document   : RechercheOffre
    Created on : 10 mars 2022, 10:28:27
    Author     : alex_
--%>

<%@page import="java.util.List"%>
<%@page import="Modele.Offre"%>
<%@page import="Modele.ClientUnique"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="ClientUnique" scope="request" class="Modele.ClientUnique"></jsp:useBean>
        <jsp:useBean id="listeOffre" scope="request" class="java.util.List"></jsp:useBean>
        <title>JSP Page</title>
    </head>
    <body>
         <%ClientUnique ClientU = ClientUnique; %>
   
        <form>
        <button class="button login__submit">
            <span class="button__text">Home</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
            
              <input type="hidden" name="action" value="home">
        </form>
           </form>
        <form>
        <button class="button login__submit">
            <span class="button__text">Rechercher une Offre</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
        
              <input type="hidden" name="action" value="RechercherOffre">
        </form>
        
        <form>
        <button class="button login__submit">
            <span class="button__text">Mon Compte</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
            
              <input type="hidden" name="action" value="CompteClient">
        </form>
        
        
         <form>
        <button class="button login__submit">
            <span class="button__text">Se deconnecter</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
            
              <input type="hidden" name="action" value="Deconnexion">
        </form>
         <div id="TableauOffres">
            <h2>Totalités des offre</h2>
            <p> Filtrer : <input type="text" class="table-filter" data-table="livres"></p>
            <table class="livres">
                <tr><td>Type d'Offre</td>
                    <td>Description de l'offre</td>
                    <td>Prix de l'offre</td>
                    <td>Le type de produit</td>
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
                                    <button name="idOffre" value="<%=ExistOffre.getId()%>">Voir offre</button> 
                                    <input type="hidden" name="action" value="VoirOffreClientUnique">
                                </form>
                            </td>
                        </tr>
                       <%}%>
            </table>
            </div>
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
