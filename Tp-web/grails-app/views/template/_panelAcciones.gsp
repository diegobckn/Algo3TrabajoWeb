<g:if test="${accionBusqueda}">	
	<g:link class="btn btn-info" controller="Principal" action="index">
		<span class="glyphicon glyphicon-menu-left"></span>
		Volver a principal
	</g:link>
</g:if>
<g:if test="${accionPrincipal}">	
	<g:link class="btn btn-info" controller="BusquedaRecetas" action="index">
		<span class="glyphicon glyphicon-search"></span>
		Buscar Recetas
	</g:link>
</g:if>