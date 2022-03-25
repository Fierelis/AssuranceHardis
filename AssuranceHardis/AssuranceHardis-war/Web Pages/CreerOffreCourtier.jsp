
<%-- 
    Document   : CreerOffreCourtier
    Created on : 10 mars 2022, 09:46:21
    Author     : alexa
--%>

<%@page import="java.util.List"%>
<%@page import="Modele.Assureur"%>
<%@page import="Modele.Courtier"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Creation d'offre</title>
        <jsp:useBean id="ListeAllAssureur" scope="request" class="java.util.List"></jsp:useBean>
        <jsp:useBean id="courtier" scope="request" class="Modele.Courtier"></jsp:useBean>
        <link href="StyleSheets/style.css" rel="stylesheet" type="text/css"/>
    </head>
     <header class ="header1">
          <%Courtier Court = courtier;%>
        <div class = "" id = "navbar">
            <nav class="navbar navbar-expand-lg">
               <img src = "img/sobrero.png" style = "height : 70px">  </img>
                <a class="navbar-brand" href="#">Sombrero</a>
                
                <!-- <img src = ".jpg" style = "height : 70px">  </img> -->
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
                            <input type="hidden" name="action" value="CreerOffreCourtier"></form></li>
                            <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">CompteCourtier</button>
                            <input type="hidden" name="action" value="CompteCourtier"></form></li>
                        <li> <form> <button type="submit" class="form-control btn1 btn1-primary submit px-3">Se déconnecter</button>
                            <input type="hidden" name="action" value="Deconnexion"></form></li>
                    </ul>
                </div>
            </nav>
        </div>
            
            
        </header>
    <body>
       
        <% List<Assureur>listeAssureur=ListeAllAssureur;%>
        <h1>Création d'une offre</h1>
        <section class="ftco-section">

                <div class="container">
                    
                    <div class="row justify-content-center">
                         <div class="text-wrapp p-4 p-lg-5">
                        <div class="col-md-12 col-lg-10 " style = "width :100%">
                            <form class="signin-form" method="post" action="AssuranceServlet">
        
            
                <legend>Informations Offre</legend>     
                <label class="label"for="TypeOffre">Type d'offre : <span class="requis"></span></label>
                <select class="form-control" name="TypeOffre">                  
                    <option value ="Mono">Mono</option>   
                    <option value ="Multi">Multi</option>    
                </select><br />

                <label class="label" for="PrixOffre">Prix de l'offre : <span class="requis"></span></label>
                <input class="form-control" type="text" name="PrixOffre" Value="" size="40" maxlength="100" /> <br />

                <label class="label" for="Description">Description : <span class="requis"></span></label>
                <input class="form-control" type="text" name="Description" value="" size="40" maxlength="45" /><br />

                <label class="label" for="AsuureurPartenaire">AssureurPartenaire: <span class="requis"></span></label>
                <select class="form-control" name="Partenaire">                  
                    <%
                    for (Assureur a : listeAssureur) {
                    %>  
                    <option value ="<%=a.getId() %>"><%=a.getRaisonSocialeAssureur() %></option>   
                    <%} %>
                </select><br />
                
                <label class="label" for="TypeProduit">Type de produit : <span class="requis"></span></label>
                <select class="form-control" name="TypeProduit">                  
                     <option value ="Sante">Santé</option>   
                     <option value ="Vie">Vie</option>    
                     <option value ="Prevoyance">Prévoyance</option> 
                     <option value ="IARD">IARD</option> 
                     <option value ="Epargne">Epargne</option> 
                     <option value ="PlacementFinancier">Placement Financier</option> 
                </select><br />
                
                
                <input type="hidden" name="Courtier" value="<%=Court.getId()%>">
                <input type="hidden" name="action" value="FormCreerOffreCourtier">
            
            <button type="submit" class="form-control btn btn-primary submit px-3">Créer L'offre</button>
         
        </form>
                        </div>
                         </div>
                    </div>
                </div>
        </section>
    </body>
</html>

