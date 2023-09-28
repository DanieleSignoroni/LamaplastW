package it.lamaplast.thip.logisticaLight.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.thera.thermfw.base.Trace;
import com.thera.thermfw.persist.KeyHelper;
import com.thera.thermfw.persist.PersistentObject;
import com.thera.thermfw.web.ServletEnvironment;
import com.thera.thermfw.web.servlet.BaseServlet;

import it.lamaplast.thip.vendite.documentoVE.YDocumentoVendita;
import it.thera.thip.base.azienda.Azienda;
import it.thera.thip.base.documenti.StatoAttivita;
import it.thera.thip.cs.DatiComuniEstesi;
import it.thera.thip.vendite.generaleVE.TipoDocumento;

public class YControlloBarcodeDocAllesimentoPallet extends BaseServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void processAction(ServletEnvironment se) throws Exception {
		try {		
			PrintWriter out = se.getResponse().getWriter();
			out.println("<script>");
			String barcodeDocumento = getStringParameter(se.getRequest(), "BarcodeDocumento");
			if(barcodeDocumento != null) {
				if(barcodeDocumento.length() >= 13) {
					try {
						char tipo = barcodeDocumento.charAt(0);
						if(tipo == 'V') {
							String anno = barcodeDocumento.substring(1, 3);
							anno = "20"+anno;
							String numero = barcodeDocumento.substring(4, 14);
							YDocumentoVendita docVen = (YDocumentoVendita)
									YDocumentoVendita.elementWithKey(YDocumentoVendita.class, 
											KeyHelper.buildObjectKey(new String[] {
													Azienda.getAziendaCorrente(),
													anno,
													numero
											}), PersistentObject.NO_LOCK);
							if(docVen != null) {
								if(docVen.getStato() == DatiComuniEstesi.VALIDO
										&& docVen.getCollegatoAMagazzino() < StatoAttivita.ESEGUITO
										&& docVen.getTipoDocumento() != TipoDocumento.NOTA_ACCREDITO) {
									out.println("parent.addDescrizioneBarcodeDocumento('DESCRIZIONE1','DESCRIZIONE2');");
									out.println("parent.document.getElementById('BarcodeDocumento').readOnly = true;");
									out.println("parent.document.getElementById('BarcodePallet').removeAttribute('readonly');");
									out.println("setTimeout(parent.document.getElementById('BarcodePallet').focus(),1000);");
								}else {
									out.println("setTimeout(parent.window.alert('Documento in stato non corretto'),1000);");
								}
							}else {
								out.println("setTimeout(parent.window.alert('Nessun documento vendita trovato con quel barcode'),1000);");
							}
						}else{
							out.println("setTimeout(parent.window.alert('Tipo barcode non valido'),1000);");
						}
					}catch (IndexOutOfBoundsException e) {
						out.println("setTimeout(parent.window.alert('Formato barcode non valido'),1000);");
					}catch (SQLException e) {
						out.println("setTimeout(parent.window.alert('Nessun documento vendita trovato con quel barcode'),1000);");
					}
				}else {
					out.println("setTimeout(parent.window.alert('Formato barcode non valido'),1000);");
				}
			}else {
				out.println("setTimeout(parent.window.alert('Barcode documento vuoto'),1000);");
			}
			out.println("</script>");
		}catch (IOException e) {
			e.printStackTrace(Trace.excStream);
		}	
	}
}
