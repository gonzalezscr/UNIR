<%@ include file="/html/oficinasviviendaadministracion/init.jsp"%>

<%
	Servicio servicio = null;

	long servicioId = ParamUtil.getLong(request, Parametros.FIELD_IDSERVICIO);

	if (servicioId > 0) {
		servicio = ServicioLocalServiceUtil.getServicio(servicioId);
	}
%>

<liferay-portlet:renderURL var="cancelar" >
	<liferay-portlet:param name="mvcPath" value="/html/oficinasviviendaadministracion/listadoServicio.jsp" />
</liferay-portlet:renderURL>

<portlet:actionURL name='guardarServicio' var="guardarServicioURL" />

<div class="taglib-header">
	<h3 class="header-title"><%=(servicio != null) ? servicio.getNombre(locale)
					: LanguageUtil.get(pageContext, "servicio-nuevo")%></h3>
</div>
<div class="oficina-vivienda">
<aui:form name="fm" action="<%=guardarServicioURL.toString()%>"
	method="post">
	<aui:model-context bean="<%=servicio%>" model="<%=Servicio.class%>" />
	<aui:input name="<%=Parametros.FIELD_IDSERVICIO%>" type="hidden" />
	
	<% if (servicio != null){ %>
	<label class="control-label" ><%=LanguageUtil.get(pageContext, "id") + servicio.getIdServicio()%></label>
	<%}%>
	<aui:input name="<%=Parametros.FIELD_NOMBRE%>" label="nom">
		<aui:validator name="required" />
	</aui:input>
	<aui:input name="<%=Parametros.FIELD_NECESIDAD%>"  label='<%=LanguageUtil.get(pageContext, "servicio-necesidad") %>'/>
		
	
	<aui:button name="submit" type="submit" value="save" />
	<aui:button href="<%=cancelar.toString()%>" type="cancel" />
</aui:form>
</div>



