/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletPackage;

import Modele.Administrateur;
import Modele.Assureur;
import Modele.ClientUnique;
import Modele.Contrat;
import Modele.Courtier;
import Modele.Entreprise;
import Modele.Facture;
import Modele.Logs;
import Modele.Mailer;
import Modele.Offre;
import Modele.TypeProduit;
import Modele.UtilisateurService;
import Session.GestionAdminLocal;
import Session.GestionClientLocal;
import Session.GestionServiceLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author alex_
 */
@WebServlet(name = "AssuranceServlet", urlPatterns = {"/AssuranceServlet"})
public class AssuranceServlet extends HttpServlet {

    @EJB
    private GestionServiceLocal gestionService;

    @EJB
    private GestionClientLocal gestionClient;

    @EJB
    private GestionAdminLocal gestionAdmin;


    /*
    protected void Test(HttpServletRequest request, HttpServletResponse response){
        Date d = new Date();
        gestionService.CreerAssureur("JohnDoe", "JD", "Assureur", "MAIF", d, "Johndoe@hotmail.fr", "Paris", 0);
     }*/
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            HttpSession sess = request.getSession();
            String jspClient = null;
            String act = request.getParameter("action");

            if ((act == null) || act.equals("vide")) {
                /*gestionService.CreerTypeProduit("Sante");
                gestionService.CreerTypeProduit("Vie");
                gestionService.CreerTypeProduit("Prevoyance");
                gestionService.CreerTypeProduit("IARD");
                gestionService.CreerTypeProduit("Epargne");
                gestionService.CreerTypeProduit("PlacementFinancier");
                 */
                jspClient = "/Connexion.jsp";
                //jspClient = "/CreerAssureur.jsp";

            } else if (act.equals("CreerClientUnique")) {
                doActionCreerClientUnique(request, response);
                jspClient = "/Connexion.jsp";
            } else if (act.equals("CreerEntreprise")) {
                doActionCreerEntreprise(request, response);
                jspClient = "/Connexion.jsp";
            } else if (act.equals("CreerAssur")) {
                doActionCreerAssur(request, response);
                jspClient = "/Connexion.jsp";;
            } else if (act.equals("CreerCourtier")) {
                doActionCreerCourtier(request, response);
                jspClient = "/Connexion.jsp";
            } else if (act.equals("CreerAdmin")) {
                doActionCreerAdmin(request, response);
                jspClient = "/Connexion.jsp";
            } // SESSION --------------------------------------------------------------------------------------------------------------------------
            else if (act.equals("Connexion")) {
                String login = request.getParameter("login");
                String mdp = request.getParameter("mdp");
                String mdpHache = gestionClient.HashageSha256(mdp);
                if (!(login.trim().isEmpty()) || mdp.trim().isEmpty()) {
                    ClientUnique ClientU = null;
                    Entreprise Boite = null;
                    Courtier Court = null;
                    Assureur Assur = null;
                    Administrateur Admin = null;
                    ClientU = gestionClient.AuthentificationClientUnique(login, mdpHache);
                    Boite = gestionClient.AuthentificationEntreprise(login, mdpHache);
                    Court = gestionService.AuthentificationCourtier(login, mdpHache);
                    Assur = gestionService.AuthentificationAssureur(login, mdpHache);
                    Admin = gestionAdmin.AuthentificationAdmin(login, mdpHache);

                    if (ClientU != null) {
                        //doSendMailConfirmationInscription(request, response, "alex_pr01@hotmail.fr", "test", "ça fonctionne bieng"); ---> à voir comment faire
                        sess.setAttribute("ClientUnique", ClientU);
                        request.setAttribute("ClientUniqueJSP", ClientU);
                        List<Contrat> ListeContratClient = gestionClient.RecupererContratClientUnique(ClientU);
                        request.setAttribute("ListeContrat", ListeContratClient);
                        sess.setAttribute("Entreprise", null);
                        sess.setAttribute("Courtier", null);
                        sess.setAttribute("Assureur", null);
                        sess.setAttribute("Administrateur", null);

                        jspClient = "/SessionClientUnique.jsp";
                    } else if (Boite != null) {
                        sess.setAttribute("Entreprise", Boite);
                        //System.out.println("connexion entreprise");
                        request.setAttribute("Entreprise", Boite);
                        //System.out.println("connexion entreprise 2");
                        List<Contrat> ListeContratEntreprise = gestionClient.RecupererContratSouscritEntreprise(Boite);
                        System.out.println("liste contrat vide ");
                        request.setAttribute("ListeContratEntreprise", ListeContratEntreprise);
                        sess.setAttribute("ClientUnique", null);
                        sess.setAttribute("Courtier", null);
                        sess.setAttribute("Assureur", null);
                        sess.setAttribute("Administrateur", null);
                        jspClient = "/SessionEntreprise.jsp";
                    } else if (Court != null) {
                        sess.setAttribute("Courtier", Court);
                        List<Offre> ListeFiltreePartenaires = gestionService.FiltrerOffre("PartenariatsAssureurs", Court, Assur);
                        List<Offre> ListeFiltreeOffresPartenaires = gestionService.FiltrerOffre("OffrePartenaires", Court, Assur);
                        request.setAttribute("CourtierJSP", Court);
                        request.setAttribute("ListeFiltreePartenaires", ListeFiltreePartenaires);
                        request.setAttribute("ListeFiltreeOffresPartenaires", ListeFiltreeOffresPartenaires);
                        sess.setAttribute("Entreprise", null);
                        sess.setAttribute("ClientUnique", null);
                        sess.setAttribute("Assureur", null);
                        sess.setAttribute("Administrateur", null);
                        jspClient = "/SessionCourtier.jsp";
                    } else if (Assur != null) {
                        sess.setAttribute("Assureur", Assur);
                        Assureur a = (Assureur) sess.getAttribute("Assureur");
                        request.setAttribute("AssureurJSP", a);
                        // liste offre de l'assureur
                        List<Offre> listOffreAssureur = gestionService.GetAllOffreAssureur(a.getId());
                        request.setAttribute("listOffreAssureur", listOffreAssureur);
                        //liste de toutes les offres
                        //List<Offre> ListOffre = gestionService.GetListOffreAll();
                        //request.setAttribute("ListeAllOffre", ListOffre);
                        // liste de tous les courtiers partenaires
                        //System.out.println(a.getId());
                        List<Courtier> ListCourtier = gestionService.RechercheCourtierPartenaire(a.getId());
                        /*System.out.println("taille : " + ListCourtier.size());
                        System.out.println("suuuuuuuuuuuu");
                        for (int i = 0; i < ListCourtier.size(); i++) {
                            System.out.println(ListCourtier.get(i).getNomCourtier());
                        }
                        System.out.println("suuuuuuuuuuuu");*/
                        request.setAttribute("ListCourtier", ListCourtier);

                        // liste de tous les clients souscripteur 
                        sess.setAttribute("AssureurCreerOffre", Assur);  //---------------------------------- à quoi ça correspond ?
                        sess.setAttribute("Entreprise", null);
                        sess.setAttribute("Courtier", null);
                        sess.setAttribute("ClientUnique", null);
                        sess.setAttribute("Administrateur", null);
                        jspClient = "/SessionAssureur.jsp";

                    } else if (Admin != null) {
                        sess.setAttribute("Admin", Admin);
                        request.setAttribute("Admin", Admin);
                        List<Courtier> ListeCourtier = gestionAdmin.GetListCourtier();
                        request.setAttribute("Courtier", ListeCourtier);
                        List<Assureur> ListeAssureur = gestionAdmin.GetListAssureur();
                        request.setAttribute("Assureur", ListeAssureur);
                        List<Contrat> ListeContrat = gestionClient.GetListContrat();
                        request.setAttribute("contrat", ListeContrat);
                        sess.setAttribute("Entreprise", null);
                        sess.setAttribute("Courtier", null);
                        sess.setAttribute("ClientUnique", null);
                        sess.setAttribute("ClientUnique", null);
                        jspClient = "/SessionAdmin.jsp";
                    } else {
                        jspClient = "/Connexion.jsp";
                        request.setAttribute("message", "Aucun utilisateur enregistré à ce nom");
                    }
                } else {
                    jspClient = "/Menu.jsp";
                    request.setAttribute("message", "Identifiant ou mot de passe incorrect");
                }
            } // SESSION --------------------------------------------------------------------------------------------------------------------------
            else if (act.equals("MenuCreerCompte")) {
                jspClient = "/MenuCreationCompte.jsp";
            } else if (act.equals("SelectionnerCreationClientUnique")) {
                jspClient = "/CreerClientUnique.jsp";
            } else if (act.equals("SelectionnerCreationEntreprise")) {
                jspClient = "/CreerEntreprise.jsp";
            } else if (act.equals("SelectionnerCreationCourtier")) {
                jspClient = "/CreerCourtier.jsp";
            } else if (act.equals("SelectionnerCreationAssureur")) {
                jspClient = "/CreerAssureur.jsp";
            } else if (act.equals("SelectionnerCreationAdmin")) {
                jspClient = "/CreerAdmin.jsp";
            } else if (act.equals("CreerOffreCourtier")) {
                jspClient = "/CreerOffreCourtier.jsp";
            } else if (act.equals("Deconnexion")) {
                sess.setAttribute("Courtier", null);
                sess.setAttribute("Entreprise", null);
                sess.setAttribute("ClientUnique", null);
                sess.setAttribute("Assureur", null);
                sess.setAttribute("Admin", null);
                jspClient = "/Connexion.jsp";
            } else if (act.equals("CompteCourtier")) {
                Courtier Court = (Courtier) sess.getAttribute("Courtier");
                request.setAttribute("Courtier", Court);
                jspClient = "/CompteCourtier.jsp";
            } else if (act.equals("ModifierInfoCourtier")) {
                doActionModifierCourtier(request, response);
                Courtier Court = (Courtier) sess.getAttribute("Courtier");
                sess.setAttribute("Courtier", Court);
                jspClient = "/CompteCourtier.jsp";

            } else if (act.equals("CreerOffreAssureur")) {
                //System.out.println("Uwu Ca sent mauvais !!!");
                Assureur assureur = (Assureur) sess.getAttribute("AssureurCreerOffre");
                //System.out.println(assureur.getId());
                request.setAttribute("AssureurCreerOffreAssureur", assureur);
                jspClient = "/CreerOffreAssureur.jsp";
            } else if (act.equals("FormCreerOffreAssureur")) {
                doActionCreerOffreAssureur(request, response);
                jspClient = "/SessionAssureur.jsp";
            } else if (act.equals("CreerOffreAssureur")) {
                //System.out.println("Uwu Ca sent mauvais !!!");
                Assureur assureur = (Assureur) sess.getAttribute("AssureurCreerOffre");
                //System.out.println(assureur.getId());
                request.setAttribute("AssureurCreerOffreAssureur", assureur);
                jspClient = "/CreerOffreAssureur.jsp";
            } else if (act.equals("FormCreerOffreAssureur")) {
                doActionCreerOffreAssureur(request, response);
                jspClient = "/SessionAssureur.jsp";
            } else if (act.equals("CompteClient")) {
                ClientUnique ClientU = (ClientUnique) sess.getAttribute("ClientUnique");
                request.setAttribute("ClientU", ClientU);
                jspClient = "/CompteClient.jsp";
            } else if (act.equals("ModifierInfoClient")) {
                doActionModifierClientUnique(request, response);
                ClientUnique ClientU = (ClientUnique) sess.getAttribute("ClientUnique");
                sess.setAttribute("ClientUnique", ClientU);
                jspClient = "/CompteClient.jsp";
            } else if (act.equals("RetourSessionClient")) {
                ClientUnique ClientU = (ClientUnique) sess.getAttribute("ClientUnique");
                request.setAttribute("ClientU", ClientU);
                List<Contrat> ListeContratClient = gestionClient.RecupererContratClientUnique(ClientU);
                request.setAttribute("ListeContrat", ListeContratClient);
                jspClient = "/SessionClient.jsp";
            } else if (act.equals("RetourSessionEntreprise")) {
                Entreprise Boite = (Entreprise) sess.getAttribute("Entreprise");
                request.setAttribute("Boite", Boite);
                //List<Contrat> ListeContratClient = gestionClient.RecupererContratClient(Boite); //////////////////////////////////////////////////////////////////////////
                //request.setAttribute("ListeContrat",ListeContratClient);
                jspClient = "/SessionEntreprise.jsp";
            } else if (act.equals("ModifierInfoEntreprise")) {
                doActionModifierEntreprise(request, response);
                Entreprise Boite = (Entreprise) sess.getAttribute("Entreprise");
                sess.setAttribute("ClientUnique", Boite);
                jspClient = "/CompteClient.jsp";
            } else if (act.equals("ResilierContrat")) {
                String Contrat = request.getParameter("contrat");
                long IdContrat = Long.parseLong(Contrat);
                Contrat SupprContrat = gestionClient.RechercherContrat(IdContrat);
                request.setAttribute("Contrat", SupprContrat);
                jspClient = "/ResilierContrat.jsp";
            } //___________________________________RECHERCHER__OFFRE__PAR__SESSION______________________________________________________________________________________________
            else if (act.equals("RechercherOffre")) {
                ClientUnique Client = (ClientUnique) sess.getAttribute("ClientUnique");
                Entreprise Boite = (Entreprise) sess.getAttribute("Entreprise");
                Courtier Court = (Courtier) sess.getAttribute("Courtier");
                Assureur Assur = (Assureur) sess.getAttribute("Assureur");
                Administrateur Admin = (Administrateur) sess.getAttribute("Administrateur");
                if (Client != null) {
                    request.setAttribute("ClientUnique", Client);
                    List<Offre> ListeOffre = gestionService.GetListOffreAll();
                    request.setAttribute("listeOffre", ListeOffre);
                    jspClient = "/RechercheOffreClientUnique.jsp";
                } else if (Boite != null) {
                    request.setAttribute("ClientUnique", Client);
                    List<Offre> ListeOffre = gestionService.GetListOffreAll();
                    request.setAttribute("listeOffre", ListeOffre);
                    jspClient = "/RechercheOffreEntreprise.jsp";

                } else if (Court != null) {
                    request.setAttribute("ClientUnique", Client);
                    List<Offre> ListeOffre = gestionService.GetListOffreAll();
                    request.setAttribute("listeOffre", ListeOffre);
                    jspClient = "/RechercheOffreCourtier.jsp";

                } else if (Assur != null) {
                    request.setAttribute("AssureurJSP", Assur);
                    List<Offre> ListeOffre = gestionService.GetListOffreAll();
                    request.setAttribute("listeOffre", ListeOffre);
                    jspClient = "/RechercheOffreAssureur.jsp";

                } else if (Admin != null) {
                    request.setAttribute("ClientUnique", Client);
                    List<Offre> ListeOffre = gestionService.GetListOffreAll();
                    request.setAttribute("listeOffre", ListeOffre);
                    jspClient = "/RechercheOffreAdmin.jsp";

                }

            } //______________________________________________________________FIN______________________________________________________________________________________
            else if (act.equals("home")) {

                ClientUnique ClientU = (ClientUnique) sess.getAttribute("ClientUnique");
                Entreprise Boite = (Entreprise) sess.getAttribute("Entreprise");
                Courtier Court = (Courtier) sess.getAttribute("Courtier");
                Assureur Assur = (Assureur) sess.getAttribute("Assureur");
                Administrateur Admin = (Administrateur) sess.getAttribute("Administrateur");

                if (ClientU != null) {
                    request.setAttribute("ClientUniqueJSP", ClientU);
                    List<Contrat> ListeContratClient = gestionClient.RecupererContratClientUnique(ClientU);
                    request.setAttribute("ListeContrat", ListeContratClient);
                    jspClient = "/SessionClientUnique.jsp";
                } else if (Boite != null) {
                    request.setAttribute("Entreprise", Boite);
                    List<Contrat> ListeContratEntreprise = gestionClient.RecupererContratSouscritEntreprise(Boite);
                    request.setAttribute("ListeContratEntreprise", ListeContratEntreprise);
                    jspClient = "/SessionEntreprise.jsp";

                } else if (Court != null) {
                    Assur = null;
                    sess.setAttribute("Courtier", Court);
                    List<Offre> ListeFiltreePartenaires = gestionService.FiltrerOffre("PartenariatsAssureurs", Court, Assur);
                    List<Offre> ListeFiltreeOffresPartenaires = gestionService.FiltrerOffre("OffrePartenaires", Court, Assur);
                    request.setAttribute("CourtierJSP", Court);
                    request.setAttribute("ListeFiltreePartenaires", ListeFiltreePartenaires);
                    request.setAttribute("ListeFiltreeOffresPartenaires", ListeFiltreeOffresPartenaires);
                    jspClient = "/SessionCourtier.jsp";

                } else if (Assur != null) {
                    request.setAttribute("AssureurJSP", Assur);
                    // liste offre de l'assureur
                    List<Offre> listOffreAssureur = gestionService.GetAllOffreAssureur(Assur.getId());
                    request.setAttribute("listOffreAssureur", listOffreAssureur);
                    //liste de toutes les offres
                    List<Offre> ListOffre = gestionService.GetListOffreAll();
                    request.setAttribute("ListeAllOffre", ListOffre);
                    // liste de tous les courtiers partenaires
                    System.out.println(Assur.getId());
                    List<Courtier> ListCourtier = gestionService.RechercheCourtierPartenaire(Assur.getId());
                    System.out.println("taille : " + ListCourtier.size());
                    System.out.println("suuuuuuuuuuuu");
                    for (int i = 0; i < ListCourtier.size(); i++) {
                        System.out.println(ListCourtier.get(i).getNomCourtier());
                    }
                    System.out.println("suuuuuuuuuuuu");
                    request.setAttribute("ListCourtier", ListCourtier);

                    // liste de tous les clients souscripteur 
                    sess.setAttribute("AssureurCreerOffre", Assur);
                    jspClient = "/SessionAssureur.jsp";

                } else if (Admin != null) {
                    sess.setAttribute("Admin", Admin);
                        request.setAttribute("Admin", Admin);
                        List<Courtier> ListeCourtier = gestionAdmin.GetListCourtier();
                        request.setAttribute("Courtier", ListeCourtier);
                        List<Assureur> ListeAssureur = gestionAdmin.GetListAssureur();
                        request.setAttribute("Assureur", ListeAssureur);
                        List<Contrat> ListeContrat = gestionClient.GetListContrat();
                        request.setAttribute("contrat", ListeContrat);
                        jspClient = "/SessionAdmin.jsp";
                }
            } else if (act.equals("VoirOffre")) {
                doActionAfficherOffre(request, response);
                jspClient = "/VoirOffre.jsp";
            } else if (act.equals("Souscrire")) {
                ClientUnique ClientU = (ClientUnique) sess.getAttribute("ClientUnique");
                Entreprise Boite = (Entreprise) sess.getAttribute("Entreprise");
                if (ClientU != null) {
                    request.setAttribute("ClientUniqueJSP", ClientU);
                    doActionAfficherContrat(request, response);
                    jspClient = "SouscriptionContratCU.jsp";
                } else if (Boite != null) {
                    request.setAttribute("EntrepriseJSP", Boite);
                    doActionAfficherContrat(request, response);
                    jspClient = "SouscriptionContratEntreprise.jsp";
                }
            } else if (act.equals("validerSouscription")) {
                ClientUnique ClientU = (ClientUnique) sess.getAttribute("ClientUnique");
                Entreprise Boite = (Entreprise) sess.getAttribute("Entreprise");
                if (ClientU != null) {
                    doActionSouscrireContratClientUnique(request, response);
                    request.setAttribute("ClientUniqueJSP", ClientU);
                    List<Contrat> ListeContratClient = gestionClient.RecupererContratClientUnique(ClientU);
                    request.setAttribute("ListeContrat", ListeContratClient);
                    jspClient = "/SessionClientUnique.jsp";
                } else if (Boite != null) {
                    doActionSouscrireContratEntreprise(request, response);
                    request.setAttribute("Entreprise", Boite);
                    List<Contrat> ListeContratEntreprise = gestionClient.RecupererContratSouscritEntreprise(Boite);
                    request.setAttribute("ListeContratEntreprise", ListeContratEntreprise);
                    jspClient = "/SessionEntreprise.jsp";
                }
            } else if (act.equals("ValidationUser")) {
                String TypeLog="Create";
                List<Logs> Listlog = gestionAdmin.RecupLogByType(TypeLog) ;
                request.setAttribute("logs", Listlog);
                jspClient = "/ValidationUser.jsp";
            }
            else if (act.equals("AccesLogs")){
                List<Logs> Listlog = gestionAdmin.GetAllLogs() ;
                request.setAttribute("logs", Listlog);
                jspClient = "/AccesLogs.jsp";
            }
            else if (act.equals("ValiderInscriptionClientUnique")){
                String id = request.getParameter("IdClientUnique");
                long idl = Long.parseLong(id);
                ClientUnique ClientU = gestionClient.RechercherClientUnique(idl);
                gestionClient.ValiderInscriptionClientUnique(ClientU);
            }
            else if (act.equals("ValiderInscriptionEntreprise")){
                String id = request.getParameter("IdEntreprise");
                long idl = Long.parseLong(id);
                Entreprise boite = gestionClient.RechercherEntreprise(idl);
                gestionClient.ValiderInscriptionEntreprise(boite);
            }
            else if (act.equals("ValiderInscriptionCourtier")){
                String id = request.getParameter("IdCourtier");
                long idl = Long.parseLong(id);
                Courtier court = gestionService.RechercherCourtier(idl);
                gestionService.ValiderInscriptionCourtier(court);
            }
            else if (act.equals("ValiderInscriptionAssureur")){
                String id = request.getParameter("IdAssureur");
                long idl = Long.parseLong(id);
                Assureur Assur = gestionService.RechercherAssureur(idl);
                gestionService.ValiderInscriptionAssureur(Assur);
            }

            RequestDispatcher Rd;
            Rd = getServletContext().getRequestDispatcher(jspClient);
            Rd.forward(request, response);
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AssuranceServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AssuranceServlet at " + request.getContextPath() + "</h1>");

            out.println("</body>");
            out.println("</html>");
        }
    }

    // DoAction pour creer un client unique
    protected void doActionCreerClientUnique(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("NomClient");
        String prenom = request.getParameter("PrenomClient");
        String login = request.getParameter("LoginClient");
        String mdp = request.getParameter("MdpClient");
        String iban = request.getParameter("Iban");
        String email = request.getParameter("Email");
        String message;
        if (nom.trim().isEmpty() || prenom.trim().isEmpty() || login.trim().isEmpty() || mdp.trim().isEmpty() || iban.trim().isEmpty()) { //récupère les valeurs de la servlet pour vérifier si elles sont vides
            message = "Erreur - Vous n'avez pas rempli tous les champs obligatoires. " + "<br /> <a href=\"CreerClientUnique.jsp\">Cliquez ici</a> pour accéder au formulaire de création d'un Client";
        } else {
            Date dateCreation = new Date();
            String typeUser = "Client Unique";
            String hashage = gestionClient.HashageSha256(mdp);
            ClientUnique CU = gestionClient.CreerClientUnique(nom, prenom, login, hashage, dateCreation, typeUser, iban, email);
            String TypeLog = "Create";
            gestionAdmin.CreerLog(CU, null, null, null, null, null, null, TypeLog);
            message = "Client créé avec succès !";
        }
        request.setAttribute("message", message);
    }

    protected void doActionAfficherOffre(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String Offre = request.getParameter("idOffre");

        String message;
        if (Offre.trim().isEmpty()) { //récupère les valeurs de la servlet pour vérifier si elles sont vides
            message = "Erreur - Vous n'avez pas rempli tous les champs obligatoires. " + "<br /> <a href=\"CreerClientUnique.jsp\">Cliquez ici</a> pour accéder au formulaire de création d'un Client";
        } else {
            long IdOffre = Long.parseLong(Offre);
            System.out.println("--------------------------------------------------------");
            Offre offer = gestionService.RechercherOffre(IdOffre);
            //System.out.println(offer.getTypeOffre());
            System.out.println("1 "+offer.getLeTypeDeProduit().getNomTypeProduit()); 
            System.out.println("2 "+offer.getTypeOffre()); 
            System.out.println("3 "+offer.getDescriptionOffreContractuelle()); 
            System.out.println("4 "+offer.getLAssurance().getRaisonSocialeAssureur()); 
            System.out.println("5 "+offer.getLeCourtier().getNomCourtier() ); 
            System.out.println("6 "+offer.getPrixOffre()); 
            message = "offre N° " + offer.getId();
            request.setAttribute("Offre", offer);
        }
        request.setAttribute("message", message);
    }

    protected void doActionAfficherContrat(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String Contrat = request.getParameter("contrat");

        String message;
        if (Contrat.trim().isEmpty()) { //récupère les valeurs de la servlet pour vérifier si elles sont vides
            message = "Erreur - Vous n'avez pas rempli tous les champs obligatoires. " + "<br /> <a href=\"CreerClientUnique.jsp\">Cliquez ici</a> pour accéder au formulaire de création d'un Client";
        } else {
            long IdOffre = Long.parseLong(Contrat);
            Offre offer = gestionService.RechercherOffre(IdOffre);
            message = "offre N° " + offer.getId();
            request.setAttribute("ContratJSP", offer);
        }
        request.setAttribute("message", message);
    }

    protected void doActionCreerEntreprise(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String raisonSocial = request.getParameter("RaisonSocial");
        String login = request.getParameter("LoginEntreprise");
        String mdp = request.getParameter("MdpEntreprise");
        String dateCreation = request.getParameter("DateCreationEntreprise");
        String mail = request.getParameter("Email");
        String taille = request.getParameter("TailleEntreprise");
        String siegeSocial = request.getParameter("SiegeSocial");
        System.out.println(raisonSocial);
        String message;
        if (raisonSocial.trim().isEmpty() || login.trim().isEmpty() || mdp.trim().isEmpty() || dateCreation.trim().isEmpty() || mail.trim().isEmpty() || taille.trim().isEmpty() || siegeSocial.trim().isEmpty()) { //récupère les valeurs de la servlet pour vérifier si elles sont vides
            message = "Erreur - Vous n'avez pas rempli tous les champs obligatoires. " + "<br /> <a href=\"CreerEntreprise.jsp\">Cliquez ici</a> pour accéder au formulaire de création d'une Entreprise";
        } else {
            Date dateCreationCompteEntreprise = new Date();
            String typeUser = "Entreprise";
            String hashage = gestionClient.HashageSha256(mdp);
            System.out.println("---------------------" + hashage);
            java.sql.Date dateCreationEntreprise = java.sql.Date.valueOf(dateCreation);
            //login, mdp, dateCreationUser,typeUser, raisonSocial, siegeSocial,dateCreationEntreprise, tailleEntreprise, mail);
            Entreprise boite = gestionClient.CreerEntreprise(login, hashage, dateCreationCompteEntreprise, typeUser, raisonSocial, siegeSocial, dateCreationEntreprise, taille, mail);
            String TypeLog = "Create";
            gestionAdmin.CreerLog(null, boite,null, null, null, null, null, TypeLog);
            message = "Entreprise créé avec succès !";
        }
        request.setAttribute("message", message);

    }

    protected void doActionCreerAssur(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String Email = request.getParameter("EmailAssur");
        String Login = request.getParameter("LoginAssur");
        String Mdp = request.getParameter("MdpAssur");
        String RaisonSociale = request.getParameter("RaisonSocialeAssur");
        String SiegeSocial = request.getParameter("SiegeSocialAssur");
        String DateCreation = request.getParameter("DateCreationAssur");
        String numSiren = request.getParameter("numSiren");

        String message;
        if (Email.trim().isEmpty() || Login.trim().isEmpty() || Mdp.trim().isEmpty() || RaisonSociale.trim().isEmpty() || SiegeSocial.trim().isEmpty() || DateCreation.trim().isEmpty()) { //récupère les valeurs de la servlet pour vérifier si elles sont vides
            message = "Erreur - Vous n'avez pas rempli tous les champs obligatoires. " + "<br /> <a href=\"CreerAssureur.jsp\">Cliquez ici</a> pour accéder au formulaire de création d'un Assureur";
        } else {

            String typeUser = "Assureur";
            String hashage = gestionClient.HashageSha256(Mdp);
            Long siren = Long.valueOf(numSiren);
            java.sql.Date dateCreationAssurance = java.sql.Date.valueOf(DateCreation);
            Assureur Assur = gestionService.CreerAssureur(Login, hashage, typeUser, RaisonSociale, dateCreationAssurance, Email, SiegeSocial, siren);
            String TypeLog = "Create";
            gestionAdmin.CreerLog(null, null,null ,Assur,null, null, null, TypeLog);

            message = "Assureur créé avec succès !";
        }
        request.setAttribute("message", message);
    }

    protected void doActionCreerCourtier(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String Email = request.getParameter("Email");
        String Login = request.getParameter("LoginCourtier");
        String Mdp = request.getParameter("MdpCourtier");
        String nom = request.getParameter("NomCourtier");
        String prenom = request.getParameter("PrenomCourtier");
        String dateNaissance = request.getParameter("DateNaissance");
        String adresse = request.getParameter("AdresseCourtier");
        String ville = request.getParameter("VilleCourtier");
        String cp = request.getParameter("CPCourtier");

        String message;
        if (Email.trim().isEmpty() || Login.trim().isEmpty() || Mdp.trim().isEmpty() || nom.trim().isEmpty() || prenom.trim().isEmpty() || dateNaissance.trim().isEmpty() || adresse.trim().isEmpty() || ville.trim().isEmpty() || cp.trim().isEmpty()) { //récupère les valeurs de la servlet pour vérifier si elles sont vides
            message = "Erreur - Vous n'avez pas rempli tous les champs obligatoires. " + "<br /> <a href=\"CreerCourtier.jsp\">Cliquez ici</a> pour accéder au formulaire de création d'un Courtier";
        } else {

            String typeUser = "Courtier";
            java.sql.Date dateNaissanceCourtier = java.sql.Date.valueOf(dateNaissance);
            String hashage = gestionClient.HashageSha256(Mdp);
            Courtier court = gestionService.CreerCourtier(nom, prenom, dateNaissanceCourtier, Email, Login, hashage, typeUser, adresse, ville, cp);
            String TypeLog = "Create";
            gestionAdmin.CreerLog(null,null, court,null, null, null, null, TypeLog);

            message = "Courtier créé avec succès !";
        }
        request.setAttribute("message", message);

    }

    protected void doActionCreerAdmin(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("NomAdmin");
        String prenom = request.getParameter("PrenomAdmin");
        String mail = request.getParameter("MailAdmin");
        String login = request.getParameter("LoginAdmin");
        String mdp = request.getParameter("MdpAdmin");

        String message;
        if (nom.trim().isEmpty() || prenom.trim().isEmpty() || mail.trim().isEmpty() || login.trim().isEmpty() || mdp.trim().isEmpty()) { //récupère les valeurs de la servlet pour vérifier si elles sont vides
            message = "Erreur - Vous n'avez pas rempli tous les champs obligatoires. " + "<br /> <a href=\"CreerAdmin.jsp\">Cliquez ici</a> pour accéder au formulaire de création d'un Admin";
        } else {

            String hashage = gestionClient.HashageSha256(mdp);
            gestionAdmin.CreerAdministrateur(nom, prenom, mail, login, hashage);
            message = "Admin créé avec succès !";
        }
        request.setAttribute("message", message);

    }

    protected void doActionCreerOffreAssureur(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String TypeOffre = request.getParameter("TypeOffre");
        String PrixOffre = request.getParameter("PrixOffre");
        String Description = request.getParameter("Description");
        String assureur = request.getParameter("Assureur");
        String typeProduit = request.getParameter("TypeProduit");

        //System.out.println(typeProduit);
        String message;
        if (TypeOffre.trim().isEmpty() || PrixOffre.trim().isEmpty() || Description.trim().isEmpty() || typeProduit.trim().isEmpty()) { //récupère les valeurs de la servlet pour vérifier si elles sont vides
            message = "Erreur - Vous n'avez pas rempli tous les champs obligatoires. " + "<br /> <a href=\"CreerOffreAssureur.jsp\">Cliquez ici</a> pour accéder au formulaire de création d'une offre assureur";
        } else {
            double prix = Double.valueOf(PrixOffre);

            // besoin rechercher le type produit
            TypeProduit typeProduitOffre = gestionService.rechercheTypeProduit(typeProduit);
            System.out.println("uwu ");
            if (typeProduitOffre != null) {
                System.out.println(typeProduitOffre.getId());
                System.out.println(typeProduitOffre.getNomTypeProduit());
            }
            // recuperer l'assureur
            long idAssureur = Long.valueOf(assureur);
            Assureur a = gestionService.RechercherAssureur(idAssureur);
            //(String TypeOffre, double PrixOffre, String DescriptionOffre, boolean OffreActive, UtilisateurService IdUtilisateurService, Assureur PartenariatAssurance , TypeProduit LeTypeDeProduit) {
            Offre offer = gestionService.CreerOffre(TypeOffre, prix, Description, true, a, a, typeProduitOffre, null, null);
            String TypeLog = "Create";
            gestionAdmin.CreerLog(null, null, null,null,offer, null, null, TypeLog);
            message = "Admin créé avec succès !";
        }
        request.setAttribute("message", message);

    }

    protected void doActionModifierCourtier(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String ID = request.getParameter("Idcourtier");
        String nom = request.getParameter("NomC");
        String prenom = request.getParameter("PrenomC");
        String login = request.getParameter("LoginC");
        String mdp = request.getParameter("MdpC");
        String adresse = request.getParameter("AdresseC");
        String mail = request.getParameter("MailC");
        String ville = request.getParameter("VilleC");
        String codepostal = request.getParameter("CPC");
        String message;
        if (nom.trim().isEmpty() || prenom.trim().isEmpty() || login.trim().isEmpty() || mdp.trim().isEmpty() || adresse.trim().isEmpty() || mail.trim().isEmpty() || ville.trim().isEmpty() || codepostal.trim().isEmpty()) { //récupère les valeurs de la servlet pour vérifier si elles sont vides
            message = "Erreur - Vous n'avez pas rempli tous les champs obligatoires. " + "<br /> <a href=\"CreerClientUnique.jsp\">Cliquez ici</a> pour accéder au formulaire de création d'un Client";
        } else {

            long id = Long.parseLong(ID);
            Courtier court = gestionService.RechercherCourtier(id);
            gestionService.ModifierInformationsCourtier(court, nom, prenom, adresse, mail, login, mdp, ville, codepostal);
            String TypeLog = "Modify";
            gestionAdmin.CreerLog(null, null,court, null,null, null, null, TypeLog);
            message = "Informations modifiées avec succès !";
        }
        request.setAttribute("message", message);

    }

    protected void doActionModifierClientUnique(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String ID = request.getParameter("IdClient");
        String nom = request.getParameter("NomClient");
        String prenom = request.getParameter("PrenomClient");
        String login = request.getParameter("LoginClient");
        String mdp = request.getParameter("MdpClient");
        String mail = request.getParameter("MailClient");
        String iban = request.getParameter("IbanClient");
        String message;
        if (nom.trim().isEmpty() || prenom.trim().isEmpty() || login.trim().isEmpty() || mdp.trim().isEmpty() || iban.trim().isEmpty() || mail.trim().isEmpty()) { //récupère les valeurs de la servlet pour vérifier si elles sont vides
            message = "Erreur - Vous n'avez pas rempli tous les champs obligatoires. " + "<br /> <a href=\"CreerClientUnique.jsp\">Cliquez ici</a> pour accéder au formulaire de création d'un Client";
        } else {

            long id = Long.parseLong(ID);
            ClientUnique ClientU = gestionClient.RechercherClientUnique(id);
            gestionClient.ModificationClientUnique(ClientU, prenom, nom, login, mdp, iban, mail);
            String TypeLog = "Modify";
            gestionAdmin.CreerLog(ClientU,null,null, null, null, null, null, TypeLog);
            message = "Informations modifiées avec succès !";
        }
        request.setAttribute("message", message);

    }

    protected void doActionModifierEntreprise(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String ID = request.getParameter("IdEntreprise");
        String raisonSociale = request.getParameter("NomEntreprise");
        String siegeSocial = request.getParameter("SiegeSocialEntreprise");
        String login = request.getParameter("LoginEntreprise");
        String mdp = request.getParameter("MdpEntreprise");
        String mail = request.getParameter("MailEntreprise");
        String taille = request.getParameter("TailleEntreprise");
        String message;
        if (raisonSociale.trim().isEmpty() || siegeSocial.trim().isEmpty() || login.trim().isEmpty() || mdp.trim().isEmpty() || taille.trim().isEmpty() || mail.trim().isEmpty()) { //récupère les valeurs de la servlet pour vérifier si elles sont vides
            message = "Erreur - Vous n'avez pas rempli tous les champs obligatoires. " + "<br /> <a href=\"CreerClientUnique.jsp\">Cliquez ici</a> pour accéder au formulaire de création d'un Client";
        } else {
            long id = Long.parseLong(ID);
            Entreprise Boite = gestionClient.RechercherEntreprise(id);
            gestionClient.ModifierEntreprise(Boite, login, mdp, raisonSociale, siegeSocial, taille, mail);
            String TypeLog = "Modify";
            gestionAdmin.CreerLog(null,Boite, null,null, null, null, null, TypeLog);
            message = "Informations modifiées avec succès !";
        }
        request.setAttribute("message", message);

    }

    protected void doActionSouscrireContratClientUnique(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String numClient = request.getParameter("numClient");
        String numOffre = request.getParameter("numOffre");
        String Duree = request.getParameter("combo");
        String TypePaiement = request.getParameter("TypePaiement");
        String iban = request.getParameter("Iban");

        String message;
        if (numClient.trim().isEmpty() || numOffre.trim().isEmpty() || Duree.trim().isEmpty()) { //récupère les valeurs de la servlet pour vérifier si elles sont vides
            message = "Erreur - Vous n'avez pas rempli tous les champs obligatoires. " + "<br /> <a href=\"CreerClientUnique.jsp\">Cliquez ici</a> pour accéder au formulaire de création d'un Client";
        } else {

            long IdClient = Long.parseLong(numClient);
            long IdOffre = Long.parseLong(numOffre);
            int DureeContrat = Integer.parseInt(Duree);
            ClientUnique ClientU = gestionClient.RechercherClientUnique(IdClient);
            if (iban.equals(ClientU.getIban())) {
                Offre Loffre = gestionService.RechercherOffre(IdOffre);
                Contrat contra = gestionClient.CreerContrat(Loffre, ClientU, DureeContrat);
                String TypeLog = "Create";
                gestionAdmin.CreerLog(ClientU,null,null, null, null, contra, null, TypeLog);
                Date d = new Date();
                gestionClient.CreerFacture(TypePaiement, d, true);
                message = "Contrat créé avec succès !";
            } else {
                message = "Information bancaires erronées, veuillez recommencer";
            }

        }
        request.setAttribute("message", message);
    }

    protected void doActionSouscrireContratEntreprise(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String numClient = request.getParameter("numEntreprise");
        String numOffre = request.getParameter("numOffre");
        String Duree = request.getParameter("combo");

        String message;
        if (numClient.trim().isEmpty() || numOffre.trim().isEmpty() || Duree.trim().isEmpty()) { //récupère les valeurs de la servlet pour vérifier si elles sont vides
            message = "Erreur - Vous n'avez pas rempli tous les champs obligatoires. " + "<br /> <a href=\"CreerClientUnique.jsp\">Cliquez ici</a> pour accéder au formulaire de création d'un Client";
        } else {
            long IdClient = Long.parseLong(numClient);
            long IdOffre = Long.parseLong(numOffre);
            int DureeContrat = Integer.parseInt(Duree);
            Entreprise Boite = gestionClient.RechercherEntreprise(IdClient);
            Offre Loffre = gestionService.RechercherOffre(IdOffre);
            Contrat contra = gestionClient.CreerContrat(Loffre, Boite, DureeContrat);
            String TypeLog = "Create";
            gestionAdmin.CreerLog(null,Boite,null, null, null, contra, null, TypeLog);
            message = "Contrat créé avec succès !";
        }
        request.setAttribute("message", message);
    }
//_______________________________________________ENVOI__DE__MAIL_____________________________________________________________________________________________________________

    protected void doSendMailConfirmationInscription(HttpServletRequest request, HttpServletResponse response, String toAddress, String subject, String message)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            Mailer.sendEmail(toAddress, subject, message);
            out.print("message has been sent successfully");
            out.close();
        } catch (Exception e) {
            out.print("message has not been sent");
            out.close();
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
