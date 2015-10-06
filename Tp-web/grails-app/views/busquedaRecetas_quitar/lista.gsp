<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Que comemos hoy</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}"
	type="image/x-icon">
<link href="${assetPath(src: '../css/bootstrap.css')}" rel="stylesheet">
<script src="${assetPath(src: '../js/bootstrap.js')}"></script>
</head>
<body>
	<div class="container">

		<g:render template="../template/panelLogin" model="" />

		<div class="clearfix"></div>



		<g:if test="${flash.message}">
			<div class="alert alert-info">
				${flash.message}
			</div>
		</g:if>


		<div class="panel panel-default">
			<div class="panel-heading">Par&aacute;metros de b&uacute;squeda
			</div>
			<div class="panel-body">
				<form method="POST" action="./buscar">
					<div class="row">
						<div class="col-md-6">
							<label>Nombre</label> <input type="text" name="busqueda_nombre"
								id="busqueda_nombre" class="form-control" placeholder="nombre"
								value="${params.busqueda_nombre?params.busqueda_nombre:''}">
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
								name="busqueda_caloria_minima" id="busqueda_caloria_minima" placeholder="Cantidad minima"
								value="${params.busqueda_caloria_minima}">
								</div>
								</div>
							<div class="col-lg-6">
							<label>&nbsp;</label>
							<div class="clearfix"></div>	
							<input type="number" class="form-control"
								name="busqueda_caloria_maxima" id="busqueda_caloria_maxima" placeholder="Cantidad maxima"
								value="${params.busqueda_caloria_maxima}">
							</div>	
						</div>
						</div>
						<div class="col-md-6">
						<br>
							<label>Temporada</label> <input type="text" name="busqueda_temporada"
								id="busqueda_temporada" class="form-control" placeholder="temporada"
								value="${params.busqueda_temporada}">
						</div>	
						
						<div class="col-md-6">
						<br>
						<div class="row">
							<label>Dificultad</label> <input type="text" name="busqueda_dificultad"
								id="busqueda_dificultad" class="form-control" placeholder="temporada"
								value="${params.busqueda_dificultad}">
								</div>
						</div>	
						
						
						<div class="col-md-6">
							<br>
							
							<label for="busqueda_con_filtros">Filtros de usuario</label> <input type="checkbox" name="busqueda_con_filtros"
								id="busqueda_con_filtros" class=""
								${params.busqueda_con_filtros?'checked="checked"':''}
								value="1">
						</div>	

						<div class="col-md-12">
							<br />
							<button type="submit" class="btn btn-primary">
								<span class="glyphicon glyphicon-search"></span> Buscar
							</button>
							<g:link action="limpiar" class="btn btn-info">
								Limpiar lista
							</g:link>
						</div>
					</div>
				</form>
			</div>
		</div>

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
				
				<g:link class="btn btn-info" controller="Principal" action="index">
					<span class="glyphicon glyphicon-menu-left"></span>
					Volver a principal
				</g:link>

			</div>
		</div>



		</div>
</body>
</html>
