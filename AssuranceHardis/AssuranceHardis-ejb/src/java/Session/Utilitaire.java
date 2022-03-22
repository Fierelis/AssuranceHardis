/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Modele.Contrat;
import Modele.pdf;

/**
 *
 * @author alex_
 */
public class Utilitaire {
    public static void CreerPdf(Contrat C,String NomClient, String RSAssureur, double PrixOffre, String TypeOffre, String TypeProduit){
        pdf.creerPdf(C, NomClient,  RSAssureur,  PrixOffre,  TypeOffre,  TypeProduit);
    }
}
