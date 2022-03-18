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
        
        <title>JSP Page</title>
    </head>
    <body>
        <%
        Administrateur admin = Admin;
        List<Contrat> con = contrat;
        List<Assureur> Assur = Assureur;
        List<Courtier> Court = Courtier;
        %>
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
            <span class="button__text">Rechercher Offre</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
            
              <input type="hidden" name="action" value="RechercherOffre">
        </form>
            <form>
        <button class="button login__submit">
            <span class="button__text">Se deconnecter</span>
            <i class="button__icon fas fa-chevron-right"></i>
	</button>
            
              <input type="hidden" name="action" value="Deconnexion">
        </form>
        <h1>Espace Administrateur</h1>
        
        
            <table>
                <tr>
                    <td>Assureur</td>
                    <td>Siege social</td>
                    <td>SIREN</td>
                    <td>Date Création</td>
                </tr>
                <%for(Assureur A : Assur){ %>
                <tr>
                    <td><%=A.getRaisonSocialeAssureur() %></td>
                    <td><%=A.getSiegeSocialAssureur() %></td>
                     <td><%=A.getSirenAssureur() %></td>
                     <td><%=A.getDateCreation() %></td>
                </tr>
            </table>
                 <%} %>
       
            <table>  
                <tr>
                    <td>Nom Courtier</td>
                    <td>Prénom Courtier</td>
                    <td>Date Naissance</td>
                    <td>Adresse Courtier</td>
                </tr>
                 <%for(Courtier C : Court){ %>
                <tr>
                    <td><%=C.getNomCourtier() %></td>
                    <td><%=C.getPrenomCourtier() %></td>
                     <td><%=C.getDateNaissanceCourtier() %></td>
                     <td><%=C.getAdresseCourtier()+" "+C.getVilleCourtier()+" "+C.getCPCourtier() %></td>
                </tr>
            </table>
                 <% } %>
      
            <table>
                <tr>
                    <td>Contrat N°</td>
                    <td>Type Produit</td>
                    <td>Type Offre</td>
                    <td>Client N°</td>
                    <td>Date Signature Contrat</td>
                </tr>
                 <%for(Contrat c : con){ %>
                <tr>
                    <td><%=c.getId() %></td>
                    <td><%=c.getLoffreDuContrat().getLeTypeDeProduit().getNomTypeProduit() %></td>
                    <td><%=c.getLoffreDuContrat().getTypeOffre() %></td>
                     <td><%=c.getLeClientduContrat().getId() %></td>
                     <td><%=c.getDateContrat() %></td>
                </tr>
            </table>
                <%} %>
    </body>
</html>