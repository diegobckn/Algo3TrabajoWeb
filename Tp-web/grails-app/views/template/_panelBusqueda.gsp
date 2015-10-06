<g:if test="${flash.message}">
	<div class="alert alert-info">
		${flash.message}
	</div>
</g:if>

<g:if test="${accionBusqueda}">
	<div class="panel panel-default">
		<div class="panel-heading">Par&aacute;metros de b&uacute;squeda
		</div>
		<div class="panel-body">
			<form method="POST" action="./buscar">
				<div class="row">
					<div class="col-md-6">
						<label>Nombre</label> <input type="text" name="busquedaNombre"
							id="busquedaNombre" class="form-control" placeholder="nombre"
							value="${params.busquedaNombre?params.busquedaNombre:''}">
					</div>
	
					<div class="col-md-4">
					<div class="row">
						
						<div class="col-lg-6">
						<div class="row">
					<label for="busqueda_caloria_minima">
						Calor&iacute;as
					</label>
					<div class="clearfix"></div>
						<input type="number" class="form-control"
							name="busquedaCaloriasMinima" id="busquedaCaloriasMinima" placeholder="Cantidad minima"
							value="${params.busquedaCaloriasMinima}">
							</div>
							</div>
						<div class="col-lg-6">
						<label>&nbsp;</label>
						<div class="clearfix"></div>	
						<input type="number" class="form-control"
							name="busquedaCaloriasMaxima" id="busquedaCaloriasMaxima" placeholder="Cantidad maxima"
							value="${params.busquedaCaloriasMaxima}">
						</div>	
					</div>
					</div>
					<div class="col-md-6">
					<br>
						<label>Temporada</label> <input type="text" name="busquedaTemporada"
							id="busquedaTemporada" class="form-control" placeholder="temporada"
							value="${params.busquedaTemporada}">
					</div>	
					
					<div class="col-md-6">
					<br>
					<div class="row">
						<label>Dificultad</label> <input type="text" name="busquedadificultad"
							id="busquedaDificultad" class="form-control" placeholder="temporada"
							value="${params.busquedaDificultad}">
							</div>
					</div>	
					
					
					<div class="col-md-6">
						<br>
						
						<label for="busquedaConFiltros">Filtros de usuario</label> <input type="checkbox" 
							name="busquedaConFiltros"
							id="busquedaConFiltros" class=""
							${params.busquedaConFiltros?'checked="checked"':''}
							value="1">
					</div>	
	
					<div class="col-md-12">
						<br />
						<button type="submit" class="btn btn-primary">
							<span class="glyphicon glyphicon-search"></span> Buscar
						</button>
						<!-- 
						<g:link action="limpiar" class="btn btn-info">
							Limpiar lista
						</g:link>
						-->
					</div>
				</div>
			</form>
		</div>
	</div>
</g:if>