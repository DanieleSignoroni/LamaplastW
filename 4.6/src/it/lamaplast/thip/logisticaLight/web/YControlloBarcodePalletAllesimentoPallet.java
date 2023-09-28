package it.lamaplast.thip.logisticaLight.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Vector;

import com.thera.thermfw.base.Trace;
import com.thera.thermfw.persist.KeyHelper;
import com.thera.thermfw.persist.PersistentObject;
import com.thera.thermfw.web.ServletEnvironment;
import com.thera.thermfw.web.WebElement;
import com.thera.thermfw.web.servlet.BaseServlet;

import it.lamaplast.thip.vendite.documentoVE.YDocumentoVendita;
import it.thera.thip.base.azienda.Azienda;
import it.thera.thip.vendite.pickingPacking.DocumentoVenRigaPplCnr;
import it.thera.thip.vendite.pickingPacking.DocumentoVenRigaPplCnrTM;


public class YControlloBarcodePalletAllesimentoPallet extends BaseServlet{

	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	@Override
	protected void processAction(ServletEnvironment se) throws Exception{
		try {		
			PrintWriter out = se.getResponse().getWriter();
			out.println("<script>");
			String barcodePallet = getStringParameter(se.getRequest(), "BarcodePallet");
			String barcodeDocumento = getStringParameter(se.getRequest(), "BarcodeDocumento");
			if(barcodeDocumento != null) {
				if(barcodeDocumento.length() >= 13) {
					try {
						String anno = barcodePallet.substring(0, 4);
						String numero = barcodePallet.substring(6, 16);
						String serie = numero.substring(0,2);
						if(serie.equals("PL")) {
							String where = " "+DocumentoVenRigaPplCnrTM.ID_AZIENDA+" = '"+Azienda.getAziendaCorrente()+"' ";
							where += " "+DocumentoVenRigaPplCnrTM.ID_ANNO_IMB+" = '"+anno+"' ";
							where += " "+DocumentoVenRigaPplCnrTM.ID_NUMERO_IMB+" = '"+numero+"' ";
							where += " "+DocumentoVenRigaPplCnrTM.ID_LIVELLO+" = '2' ";
							Vector<DocumentoVenRigaPplCnr> listaPallet;
							try {
								listaPallet = DocumentoVenRigaPplCnr.retrieveList(
										DocumentoVenRigaPplCnr.class,
										where, 
										"", 
										false);
								if(listaPallet.size() > 0) {
									DocumentoVenRigaPplCnr pallet = listaPallet.get(0);
									YDocumentoVendita docVen = getDocumentoVenditaDaBarcode(barcodeDocumento);
									if(docVen != null) {
										if(docVen.getIdAzienda().equals(pallet.getIdAzienda())
												&& docVen.getAnnoDocumento().equals(pallet.getIdAnnoPkl())
												&& docVen.getNumeroDocumento().equals(pallet.getIdNumeroPkl())) {
											out.println("parent.document.getElementById('BarcodePallet').readOnly = true;");
											out.println("parent.document.getElementById('BarcodeScatola').removeAttribute('readonly');");
											out.println("setTimeout(parent.document.getElementById('BarcodeScatola').focus(),1000);");
										}else {
											String lstPrl = "V"+docVen.getAnnoDocumento().substring(2,4)+"  "+docVen.getNumeroDocumento();
											out.println("setTimeout(parent.window.alert('Pallet gia assegnato alla lista di prelievo "+WebElement.formatStringForHTML(lstPrl)+"'),1000);");
										}
									}
								}else {

								}
							} catch (ClassNotFoundException e) {
								e.printStackTrace();
							} catch (InstantiationException e) {
								e.printStackTrace();
							} catch (IllegalAccessException e) {
								e.printStackTrace();
							} catch (SQLException e) {
								e.printStackTrace();
							}
						}else {
							out.println("setTimeout(parent.window.alert('Serie pallet non valida'),1000);");
						}
					}catch (IndexOutOfBoundsException e) {
						out.println("setTimeout(parent.window.alert('Formato pallet non valido'),1000);");
					}
				}else {
					out.println("setTimeout(parent.window.alert('Formato pallet non valido'),1000);");
				}
			}else {
				out.println("setTimeout(parent.window.alert('Barcode pallet vuoto'),1000);");
			}
			out.println("</script>");
		}catch (IOException e) {
			e.printStackTrace(Trace.excStream);
		}	
	}

	public YDocumentoVendita getDocumentoVenditaDaBarcode(String barcodeDocumento) {
		String anno = barcodeDocumento.substring(1, 3);
		anno = "20"+anno;
		String numero = barcodeDocumento.substring(4, 14);
		try {
			YDocumentoVendita docVen = (YDocumentoVendita)
					YDocumentoVendita.elementWithKey(YDocumentoVendita.class, 
							KeyHelper.buildObjectKey(new String[] {
									Azienda.getAziendaCorrente(),
									anno,
									numero
							}), PersistentObject.NO_LOCK);
			return docVen;
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (IndexOutOfBoundsException e) {
			e.printStackTrace();
		}
		return null;
	}
}
