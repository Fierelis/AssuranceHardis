/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Modele.pdf;

/**
 *
 * @author alex_
 */
public class Utilitaire {
    public static void CreerPdf(String args, String message){
        pdf.creerPdf(args, message);
    }
}
