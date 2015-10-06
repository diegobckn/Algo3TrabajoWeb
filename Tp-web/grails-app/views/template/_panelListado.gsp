<g:if test="${recetas && labelResultado}">
	<div class="panel panel-default">
		<div class="panel-heading">${labelResultado }</div>
		<div class="panel-body">
	
			<table
				class="table table-striped table-bordered table-hover table-condensed">
				<thead>
					<g:sortableColumn property="Nombre" title="Nombre de las recetas" />
					<g:sortableColumn property="calorias" title="Calorias" />
					<g:sortableColumn property="temporada"	title="Temporada recomendable" />
					<g:sortableColumn property="dificultad"	title="Dificultad" />
					<g:sortableColumn property="acciones"	title="Acciones" />
				</thead>
				<tbody>
					<g:each in="${recetas}" status="i" var="recetaItem">
						<tr class="${(i % 2) == 0 ? 'info-anulado' : ''}" style="background-color:${usuario.colorFondo(recetaItem)} !important;" 
						title="creador: ${recetaItem.acceso.usuarioCarga.nombre}">
							<td><g:link action="ver" id="${recetaItem.id}">
									${recetaItem.nombre}
								</g:link></td>
							<td>
								${recetaItem.calorias}
							</td>
							<td>
								${recetaItem.temporada}
							</td>
							<td>
								${recetaItem.dificultad}
							</td>
							<td>
								<g:link class="btn btn-primary" action="ver" id="${recetaItem.id}">
									<span class="glyphicon glyphicon-eye-open"></span>
											Ver Receta
								</g:link>
								
								<g:link class="btn btn-warning" action="hacerFavorita" id="${recetaItem.id}">
									<g:if test="${usuario.estaEnFavorita(recetaItem)}">
									<span class="glyphicon glyphicon-minus-sign" title="Quitar de favoritas"></span>
									</g:if>
									<g:else>
									<span class="glyphicon glyphicon-plus-sign" title="Agregar a favoritas"></span>		
									</g:else>
									
									Favorita
								</g:link>
								
								<g:link class="btn btn-success" action="copiar" id="${recetaItem.id}">
									<span class="glyphicon glyphicon-duplicate"></span>
											Copiar
								</g:link>
						
						
							</td>
						</tr>
					</g:each>
	
				</tbody>
			</table>
			
		<g:render template="../template/panelAcciones" model="accionBusqueda:accionBusqueda, accionPrincipal:accionPrincipal" />
		
		</div>
	</div>
</g:if>