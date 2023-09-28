function YAllestPalletOL() {
	document.getElementById('BarcodeDocumento').focus();
	document.getElementById('BarcodePallet').readOnly = true;
	document.getElementById('BarcodeScatola').readOnly = true;
	appendEvent(document.getElementById("BarcodeDocumento"), eventKEYDOWN, function() {
		document.getElementById("BarcodeDocumento").onkeydown; return ricercaDocumento();
	}
	);
	appendEvent(document.getElementById("BarcodeDocumento"), eventCHANGE, function() {
		document.getElementById("BarcodeDocumento").onchange; return ricercaDocumento();
	}
	);
	appendEvent(document.getElementById("BarcodePallet"), eventKEYDOWN, function() {
		document.getElementById("BarcodePallet").onkeydown; return ricercaPallet();
	}
	);
	appendEvent(document.getElementById("BarcodePallet"), eventCHANGE, function() {
		document.getElementById("BarcodePallet").onchange; return ricercaPallet();
	}
	);
	appendEvent(document.getElementById("BarcodeScatola"), eventKEYDOWN, function() {
		document.getElementById("BarcodeScatola").onkeydown; return ricarcaScatola();
	}
	);
	appendEvent(document.getElementById("BarcodeScatola"), eventCHANGE, function() {
		document.getElementById("BarcodeScatola").onchange; return ricarcaScatola();
	}
	);
}

function ricarcaScatola(){
	if (!document.getElementById('BarcodeScatola').hasAttribute('readonly')) {
		var barcode = document.getElementById("BarcodeScatola").value;
		if (barcode != null && barcode != undefined && barcode.length > 12) {
			var f = document.getElementById('GrigliaDocumentiFrame').contentWindow;
			setLocationOnWindow(f, "/" + webAppPath + "/" + servletPath + "/it.lamaplast.thip.logisticaLight.web.YControlloBarcodeScatolaAllesimentoPallet?BarcodeScatola=" + upperCaseValue(barcode));
		}
	}
}

function ricercaPallet(){
	if (!document.getElementById('BarcodePallet').hasAttribute('readonly')) {
		var barcode = document.getElementById("BarcodePallet").value;
		var barcodeDoc = document.getElementById("BarcodeDocumento").value;
		if (barcode != null && barcode != undefined && barcode.length > 12) {
			var f = document.getElementById('GrigliaDocumentiFrame').contentWindow;
			setLocationOnWindow(f, "/" + webAppPath + "/" + servletPath + "/it.lamaplast.thip.logisticaLight.web.YControlloBarcodePalletAllesimentoPallet?BarcodePallet=" + upperCaseValue(barcode)+"&BarcodeDocumento="+barcodeDoc);
		}
	}
}

function ricercaDocumento() {
	if (!document.getElementById('BarcodeDocumento').hasAttribute('readonly')) {
		var barcode = document.getElementById("BarcodeDocumento").value;
		if (barcode != null && barcode != undefined && barcode.length > 12) {
			var f = document.getElementById('GrigliaDocumentiFrame').contentWindow;
			setLocationOnWindow(f, "/" + webAppPath + "/" + servletPath + "/it.lamaplast.thip.logisticaLight.web.YControlloBarcodeDocAllesimentoPallet?BarcodeDocumento=" + upperCaseValue(barcode));
		}
	}
}

function addDescrizioneBarcodeDocumento(txt1, txt2) {
	var tr = document.getElementById("BarcodeDocumento").parentNode.parentNode;
	var desc1 = document.createElement('tr');
	var cell1 = document.createElement('td');
	var cellDesc1 = document.createElement('td');
	var label1 = document.createElement('label');
	label1.innerHTML = txt1;
	cellDesc1.appendChild(label1);
	var desc2 = document.createElement('tr');
	var cell2 = document.createElement('td');
	var cellDesc2 = document.createElement('td');
	var label2 = document.createElement('label');
	label2.innerHTML = txt1;
	cellDesc2.appendChild(label2);
	desc1.appendChild(cell1);
	desc1.appendChild(cellDesc1);
	desc2.appendChild(cell2);
	desc2.appendChild(cellDesc2);
	tr.parentNode.insertBefore(desc1, tr.nextSibling);
	tr.parentNode.insertBefore(desc2, tr.nextSibling);
}