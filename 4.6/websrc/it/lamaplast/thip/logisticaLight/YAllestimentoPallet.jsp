<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"
                      "file:///K:/Thip/4.7.0/websrcsvil/dtd/xhtml1-transitional.dtd">
<html>
<!-- WIZGEN Therm 2.0.0 as Form - multiBrowserGen = true -->
<%=WebGenerator.writeRuntimeInfo()%>
<head>
<%@ page contentType="text/html; charset=Cp1252"%>
<%@ page import= " 
  java.sql.*, 
  java.util.*, 
  java.lang.reflect.*, 
  javax.naming.*, 
  com.thera.thermfw.common.*, 
  com.thera.thermfw.type.*, 
  com.thera.thermfw.web.*, 
  com.thera.thermfw.security.*, 
  com.thera.thermfw.base.*, 
  com.thera.thermfw.ad.*, 
  com.thera.thermfw.persist.*, 
  com.thera.thermfw.gui.cnr.*, 
  com.thera.thermfw.setting.*, 
  com.thera.thermfw.collector.*, 
  com.thera.thermfw.batch.web.*, 
  com.thera.thermfw.batch.*, 
  com.thera.thermfw.pref.* 
"%> 
<%
  ServletEnvironment se = (ServletEnvironment)Factory.createObject("com.thera.thermfw.web.ServletEnvironment"); 
  BODataCollector YAllestPalletBODC = null; 
  List errors = new ArrayList(); 
  WebJSTypeList jsList = new WebJSTypeList(); 
  WebForm YAllestPalletForm =  
     new com.thera.thermfw.web.WebForm(request, response, "YAllestPalletForm", "YAllestPallet", null, "it.lamaplast.thip.logisticaLight.web.YAllestimentoPalletFormActionAdapter", false, false, false, false, true, true, null, 1, true, "it/lamaplast/thip/logisticaLight/YAllestimentoPallet.js"); 
  YAllestPalletForm.setServletEnvironment(se); 
  YAllestPalletForm.setJSTypeList(jsList); 
  YAllestPalletForm.setHeader(null); 
  YAllestPalletForm.setFooter(null); 
  YAllestPalletForm.setWebFormModifierClass("it.lamaplast.thip.logisticaLight.web.YAllestimentoPalletWebFormModifier"); 
  YAllestPalletForm.setDeniedAttributeModeStr("hideNone"); 
  int mode = YAllestPalletForm.getMode(); 
  String key = YAllestPalletForm.getKey(); 
  String errorMessage; 
  boolean requestIsValid = false; 
  boolean leftIsKey = false; 
  boolean conflitPresent = false; 
  String leftClass = ""; 
  try 
  {
     se.initialize(request, response); 
     if(se.begin()) 
     { 
        YAllestPalletForm.outTraceInfo(getClass().getName()); 
        String collectorName = YAllestPalletForm.findBODataCollectorName(); 
                YAllestPalletBODC = (BODataCollector)Factory.createObject(collectorName); 
        if (YAllestPalletBODC instanceof WebDataCollector) 
            ((WebDataCollector)YAllestPalletBODC).setServletEnvironment(se); 
        YAllestPalletBODC.initialize("YAllestPallet", true, 1); 
        YAllestPalletForm.setBODataCollector(YAllestPalletBODC); 
        int rcBODC = YAllestPalletForm.initSecurityServices(); 
        mode = YAllestPalletForm.getMode(); 
        if (rcBODC == BODataCollector.OK) 
        { 
           requestIsValid = true; 
           YAllestPalletForm.write(out); 
           if(mode != WebForm.NEW) 
              rcBODC = YAllestPalletBODC.retrieve(key); 
           if(rcBODC == BODataCollector.OK) 
           { 
              YAllestPalletForm.writeHeadElements(out); 
           // fine blocco XXX  
           // a completamento blocco di codice YYY a fine body con catch e gestione errori 
%> 

</head>
<body bottommargin="0" leftmargin="0" onbeforeunload="<%=YAllestPalletForm.getBodyOnBeforeUnload()%>" onload="<%=YAllestPalletForm.getBodyOnLoad()%>" onunload="<%=YAllestPalletForm.getBodyOnUnload()%>" rightmargin="0" topmargin="0"><%
   YAllestPalletForm.writeBodyStartElements(out); 
%> 


	<table width="100%" height="100%" cellspacing="0" cellpadding="0">
<tr>
<td style="height:0" valign="top">
<% String hdr = YAllestPalletForm.getCompleteHeader();
 if (hdr != null) { 
   request.setAttribute("dataCollector", YAllestPalletBODC); 
   request.setAttribute("servletEnvironment", se); %>
  <jsp:include page="<%= hdr %>" flush="true"/> 
<% } %> 
</td>
</tr>

<tr>
<td valign="top" height="100%">
<form action="<%=YAllestPalletForm.getServlet()%>" id="form" method="post" name="form" style="height:100%"><%
  YAllestPalletForm.writeFormStartElements(out); 
%>

		<div id="divDatiCausale" style="position: absolute; display: none; height: 92%; width: 100%;">
			<table cellpadding="2" cellspacing="0" height="100%" id="emptyborder" width="100%">
				<tr>
					<td height="40%" id="LogoAziendaDivCausale" style="text-align: center;"></td>
				</tr>
				<tr valign="top">
					<td>
						<table>
							<tr>
								<td><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "YAllestPallet", "BarcodeDocumento", null); 
   label.setParent(YAllestPalletForm); 
%><label class="<%=label.getClassType()%>" for="BarcodeDocumento"><%label.write(out);%></label><%}%></td>
								<td><% 
  WebTextInput YAllestPalletBarcodeDocumento =  
     new com.thera.thermfw.web.WebTextInput("YAllestPallet", "BarcodeDocumento"); 
  YAllestPalletBarcodeDocumento.setParent(YAllestPalletForm); 
%>
<input class="<%=YAllestPalletBarcodeDocumento.getClassType()%>" id="<%=YAllestPalletBarcodeDocumento.getId()%>" maxlength="<%=YAllestPalletBarcodeDocumento.getMaxLength()%>" name="<%=YAllestPalletBarcodeDocumento.getName()%>" size="<%=YAllestPalletBarcodeDocumento.getSize()%>"><% 
  YAllestPalletBarcodeDocumento.write(out); 
%>
 
								</td>
							</tr>
							<tr>
								<td><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "YAllestPallet", "BarcodePallet", null); 
   label.setParent(YAllestPalletForm); 
%><label class="<%=label.getClassType()%>" for="BarcodePallet"><%label.write(out);%></label><%}%></td>
								<td><% 
  WebTextInput YAllestPalletBarcodePallet =  
     new com.thera.thermfw.web.WebTextInput("YAllestPallet", "BarcodePallet"); 
  YAllestPalletBarcodePallet.setParent(YAllestPalletForm); 
%>
<input class="<%=YAllestPalletBarcodePallet.getClassType()%>" id="<%=YAllestPalletBarcodePallet.getId()%>" maxlength="<%=YAllestPalletBarcodePallet.getMaxLength()%>" name="<%=YAllestPalletBarcodePallet.getName()%>" size="<%=YAllestPalletBarcodePallet.getSize()%>"><% 
  YAllestPalletBarcodePallet.write(out); 
%>
 
								</td>
							</tr>
							<tr>
								<td><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "YAllestPallet", "BarcodeScatola", null); 
   label.setParent(YAllestPalletForm); 
%><label class="<%=label.getClassType()%>" for="BarcodeScatola"><%label.write(out);%></label><%}%></td>
								<td><% 
  WebTextInput YAllestPalletBarcodeScatola =  
     new com.thera.thermfw.web.WebTextInput("YAllestPallet", "BarcodeScatola"); 
  YAllestPalletBarcodeScatola.setParent(YAllestPalletForm); 
%>
<input class="<%=YAllestPalletBarcodeScatola.getClassType()%>" id="<%=YAllestPalletBarcodeScatola.getId()%>" maxlength="<%=YAllestPalletBarcodeScatola.getMaxLength()%>" name="<%=YAllestPalletBarcodeScatola.getName()%>" size="<%=YAllestPalletBarcodeScatola.getSize()%>"><% 
  YAllestPalletBarcodeScatola.write(out); 
%>
 
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
	<%
  YAllestPalletForm.writeFormEndElements(out); 
%>
</form></td>
</tr>

<tr>
<td style="height:0">
<% String ftr = YAllestPalletForm.getCompleteFooter();
 if (ftr != null) { 
   request.setAttribute("dataCollector", YAllestPalletBODC); 
   request.setAttribute("servletEnvironment", se); %>
  <jsp:include page="<%= ftr %>" flush="true"/> 
<% } %> 
</td>
</tr>
</table>


<%
           // blocco YYY  
           // a completamento blocco di codice XXX in head 
              YAllestPalletForm.writeBodyEndElements(out); 
           } 
           else 
              errors.addAll(0, YAllestPalletBODC.getErrorList().getErrors()); 
        } 
        else 
           errors.addAll(0, YAllestPalletBODC.getErrorList().getErrors()); 
           if(YAllestPalletBODC.getConflict() != null) 
                conflitPresent = true; 
     } 
     else 
        errors.add(new ErrorMessage("BAS0000010")); 
  } 
  catch(NamingException e) { 
     errorMessage = e.getMessage(); 
     errors.add(new ErrorMessage("CBS000025", errorMessage));  } 
  catch(SQLException e) {
     errorMessage = e.getMessage(); 
     errors.add(new ErrorMessage("BAS0000071", errorMessage));  } 
  catch(Throwable e) {
     e.printStackTrace(Trace.excStream);
  }
  finally 
  {
     if(YAllestPalletBODC != null && !YAllestPalletBODC.close(false)) 
        errors.addAll(0, YAllestPalletBODC.getErrorList().getErrors()); 
     try 
     { 
        se.end(); 
     }
     catch(IllegalArgumentException e) { 
        e.printStackTrace(Trace.excStream); 
     } 
     catch(SQLException e) { 
        e.printStackTrace(Trace.excStream); 
     } 
  } 
  if(!errors.isEmpty())
  { 
      if(!conflitPresent)
  { 
     request.setAttribute("ErrorMessages", errors); 
     String errorPage = YAllestPalletForm.getErrorPage(); 
%> 
     <jsp:include page="<%=errorPage%>" flush="true"/> 
<% 
  } 
  else 
  { 
     request.setAttribute("ConflictMessages", YAllestPalletBODC.getConflict()); 
     request.setAttribute("ErrorMessages", errors); 
     String conflictPage = YAllestPalletForm.getConflictPage(); 
%> 
     <jsp:include page="<%=conflictPage%>" flush="true"/> 
<% 
   } 
   } 
%> 
</body>
</html>
