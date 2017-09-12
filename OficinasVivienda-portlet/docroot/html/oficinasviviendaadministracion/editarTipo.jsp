<%@ include file="/html/oficinasviviendaadministracion/init.jsp"%>

<%
	Tipo tipo = null;

	long tipoId = ParamUtil.getLong(request, Parametros.FIELD_IDTIPO);

	if (tipoId > 0) {
		tipo = TipoLocalServiceUtil.getTipo(tipoId);
	}
%>

<liferay-portlet:renderURL var="cancelar" >
	<liferay-portlet:param name="mvcPath" value="/html/oficinasviviendaadministracion/listadoTipo.jsp" />
</liferay-portlet:renderURL>

<portlet:actionURL name='guardarTipo' var="guardarTipoURL" />

<div class="taglib-header">
	<h3 class="header-title"><%=(tipo != null) ? tipo.getNombre(locale) : LanguageUtil
					.get(pageContext, "tipo-nuevo")%></h3>
</div>
<div class="oficina-vivienda">
<aui:form name="fm" action="<%=guardarTipoURL.toString()%>"
	method="post">
	<aui:model-context bean="<%=tipo%>" model="<%=Tipo.class%>" />
	<aui:input name="<%=Parametros.FIELD_IDTIPO%>" type="hidden" />
	
	<% if (tipo != null){ %>
	<label class="control-label" ><%=LanguageUtil.get(pageContext, "id") + tipo.getIdTipo()%></label>
	<%}%>
	<aui:input name="<%=Parametros.FIELD_NOMBRE%>" label="nom">
		<aui:validator name="required" />
	</aui:input>
	
	<aui:button name="submit" type="submit" value="save" />
	<aui:button href="<%=cancelar.toString()%>" type="cancel" />
</aui:form>
</div>



