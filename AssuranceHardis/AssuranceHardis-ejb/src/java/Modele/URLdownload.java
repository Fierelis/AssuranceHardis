/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

/**
 *
 * @author alex_
 */
public class URLdownload {
    
    public static void downloadFile(String adresse) {

		downloadFile(adresse, null);
	}

	public static void downloadFile(String adresse, File dest) {
		BufferedReader reader = null;
		FileOutputStream fos = null;
		InputStream in = null;
		try {

			// création de la connection
			URL url = new URL(adresse);
			URLConnection conn = url.openConnection();
			System.out.println(adresse);

			String FileType = conn.getContentType();
			System.out.println("FileType : " + FileType);

			int FileLenght = conn.getContentLength();
			if (FileLenght == -1) {
				throw new IOException("Fichier non valide.");
			}

			// lecture de la réponse
			in = conn.getInputStream();
			reader = new BufferedReader(new InputStreamReader(in));
			if (dest == null) {
				String FileName = url.getFile();
				FileName = FileName.substring(FileName.lastIndexOf('/') + 1);
				dest = new File(FileName);
			}
			fos = new FileOutputStream(dest);
			byte[] buff = new byte[1024];
			int l = in.read(buff);
			while (l > 0) {
				fos.write(buff, 0, l);
				l = in.read(buff);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				fos.flush();
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				reader.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
