package it.lamaplast.thip.logisticaLight;

import com.thera.thermfw.common.BusinessObjectAdapter;

public class YAllestimentoPallet extends BusinessObjectAdapter{

	protected String iBarcodeDocumento;

	protected String iBarcodePallet;

	protected String iBarcodeScatola;

	public String getBarcodeDocumento() {
		return iBarcodeDocumento;
	}
	public void setBarcodeDocumento(String iBarcodeDocumento) {
		this.iBarcodeDocumento = iBarcodeDocumento;
	}
	public String getBarcodePallet() {
		return iBarcodePallet;
	}
	public void setBarcodePallet(String iBarcodePallet) {
		this.iBarcodePallet = iBarcodePallet;
	}
	public String getBarcodeScatola() {
		return iBarcodeScatola;
	}
	public void setBarcodeScatola(String iBarcodeScatola) {
		this.iBarcodeScatola = iBarcodeScatola;
	}





}
