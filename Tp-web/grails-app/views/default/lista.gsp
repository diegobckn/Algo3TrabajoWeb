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

		<div class="col-lg-3 pull-right panel-group" id="accordion1">
			<div class="row">
				<div class="panel panel-default">
					<div class="panel-heading">
						<p>
						Logueado como: ${usuario.nombre}
						 
						<g:link class="" action="desloguear">
									Salir
						</g:link>
									
									
						</p>
						
					</div>
				</div>
			</div>
		</div>

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
							<p>Calor&iacute;as</p>
							
							<div class="col-lg-6">
							<div class="row">
							<label class="form-inline">M&iacute;nima</label> <input type="number" class="form-control"
								name="busqueda_caloria_minima" id="busqueda_caloria_minima" placeholder="Cantidad minima"
								value="${busqueda_caloria_minima}">
								</div>
								</div>
							<div class="col-lg-6">
							<label>M&aacute;xima</label> <input type="number" class="form-control"
								name="busqueda_caloria_minima" id="busqueda_caloria_minima" placeholder="Cantidad maxima"
								value="${busqueda_caloria_minima}">
							</div>	
						</div>
						</div>
						<div class="col-md-6">
							<label>Temporada</label> <input type="text" name="busqueda_temporada"
								id="busqueda_temporada" class="form-control" placeholder="temporada"
								value="${busqueda_temporada}">
						</div>	
						<div class="col-md-6">
							<br>
							
							<label>Filtros de usuario</label> <input type="checkbox" name="busqueda_con_filtros"
								id="busqueda_con_filtros" class=""
								value="${busqueda_con_filtros}">
						</div>	

						<div class="col-md-12">
							<br />
							<button type="submit" class="btn btn-primary">
								<span class="glyphicon glyphicon-search"></span> Buscar
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">Resultados</div>
			<div class="panel-body">

				<table
					class="table table-striped table-bordered table-hover table-condensed">
					<thead>
						<g:sortableColumn property="Nombre" title="Nombre de las recetas" />
						<g:sortableColumn property="calorias" title="Calorias" />
						<g:sortableColumn property="temporada"	title="Temporada recomendable" />
						<g:sortableColumn property="dificultad"	title="Dificultad" />
						<g:sortableColumn property="acciones"	title="acciones" />
					</thead>
					<tbody>
						<g:each in="${recetas}" status="i" var="recetaItem">
							<tr class="${(i % 2) == 0 ? 'info' : ''}">
								<td><g:link action="ver" id="${i}">
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
									<g:link class="btn btn-primary" action="ver" id="${i}">
										<span class="glyphicon glyphicon-eye-open"></span>
												Ver Receta
									</g:link>
									
									<g:link class="btn btn-warning" action="hacerFavorita" id="${i}">
										<span class="glyphicon glyphicon-star"></span>
												Favorita
									</g:link>
									
									<g:link class="btn btn-success" action="copiar" id="${i}">
										<span class="glyphicon glyphicon-duplicate"></span>
												Copiar
									</g:link>
							
							
								</td>
							</tr>
						</g:each>

					</tbody>
				</table>

			</div>
		</div>


	

		</div>
</body>
</html>
