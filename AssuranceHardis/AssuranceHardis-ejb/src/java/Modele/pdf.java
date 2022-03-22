/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author alex_
 */
public class pdf {

    public static void creerPdf(Contrat C, String NomClient, String RSAssureur, double PrixOffre, String TypeOffre, String TypeProduit)
   {
      Document document = new Document();
      try
      {
         PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("C:\\Users\\alex_\\Downloads\\FactureContrat_"+ RSAssureur +".pdf"));
         document.open();
         Date d = new Date();
          document.addTitle("Facture N°"+C.getId());
         document.add(new Paragraph(" "));
         document.add(new Paragraph("Client : "+NomClient));
         document.add(new Paragraph(" "));
         document.add(new Paragraph("Assureur : "+RSAssureur));
         document.add(new Paragraph("Date du contrat : "+ d));
        
         
         
         PdfPTable table = new PdfPTable(2); // 3 columns.
        table.setWidthPercentage(100); //Width 100%
        table.setSpacingBefore(10f); //Space before table
        table.setSpacingAfter(10f); //Space after table
 
        //Set Column widths
        float[] columnWidths = {1f, 1f};
        table.setWidths(columnWidths);
        
 PdfPTable table2 = new PdfPTable(2); // 3 columns.
        table2.setWidthPercentage(100); //Width 100%
        table2.setSpacingBefore(10f); //Space before table
        table2.setSpacingAfter(10f); //Space after table
 
        //Set Column widths
        float[] columnWidthss = {1f, 1f};
        table.setWidths(columnWidthss);
        
        PdfPCell cell1 = new PdfPCell(new Paragraph("Produit"));
        cell1.setPaddingLeft(10);
        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
 
        PdfPCell cell2 = new PdfPCell(new Paragraph("Montant"));
        cell2.setPaddingLeft(10);
        cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell2.setVerticalAlignment(Element.ALIGN_MIDDLE);
 
        PdfPCell cell3 = new PdfPCell(new Paragraph("Contrat "+ TypeProduit + ", offre : " + TypeOffre));
        cell3.setPaddingLeft(10);
        cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell3.setVerticalAlignment(Element.ALIGN_MIDDLE);
 
        //To avoid having the cell border and the content overlap, if you are having thick cell borders
        //cell1.setUserBorderPadding(true);
        //cell2.setUserBorderPadding(true);
        //cell3.setUserBorderPadding(true);
        
         PdfPCell cell4 = new PdfPCell(new Paragraph("HT : "+PrixOffre));
        cell4.setPaddingLeft(10);
        cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell4.setVerticalAlignment(Element.ALIGN_MIDDLE);
        
         PdfPCell cell5 = new PdfPCell(new Paragraph("                                "));
        cell5.setBorderColor(BaseColor.RED);
        cell5.setPaddingLeft(10);
        cell5.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell5.setVerticalAlignment(Element.ALIGN_MIDDLE);
        
         PdfPCell cell6 = new PdfPCell(new Paragraph("TVA : 20%"));
        cell6.setPaddingLeft(10);
        cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell6.setVerticalAlignment(Element.ALIGN_MIDDLE);
        
         PdfPCell cell7 = new PdfPCell(new Paragraph("Total"));
        cell7.setPaddingLeft(10);
        cell7.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell7.setVerticalAlignment(Element.ALIGN_MIDDLE);
        
         PdfPCell cell8 = new PdfPCell(new Paragraph(""+PrixOffre * 1.2));

        cell8.setPaddingLeft(10);
        cell8.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell8.setVerticalAlignment(Element.ALIGN_MIDDLE);
 
        table.addCell(cell1);
        table.addCell(cell2);
        table.addCell(cell3);
         table.addCell(cell4);
        table.addCell(cell5);
        table.addCell(cell6);
  
        table2.addCell(cell7);
        table2.addCell(cell8);
 
        document.add(table);
        
        document.add(new Paragraph("  "));
        document.add(new Paragraph(" "));
        
         document.add(table2);
         
        document.add(new Paragraph("  "));
        document.add(new Paragraph("Cette facture est à conserver pendant 2 ans au moins"));
             document.close();
         writer.close();
      } catch (DocumentException e)
      {
         e.printStackTrace();
      } catch (FileNotFoundException e)
      {
         e.printStackTrace();
      }
   }

}
