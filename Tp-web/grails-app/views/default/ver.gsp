<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>Que comemos hoy</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link href="${assetPath(src: '../css/bootstrap.css')}" rel="stylesheet">
		
		<style>
		.text-areas {
			width:100%;
			overflow: vertical;
			height: 95px;
			border-radius: 0px;
			padding: 3px 8px;
			border: 1px solid #6D6868;
			overflow: scroll;
		}
		</style>
	</head>
	<body>
	<div class="container">
	<div class="col-lg-12 text-center">
		<h1>
		Bienvenido a
			<span>
			Que comemos hoy
			</span> 
		</h1>
	</div>
	
	
	<div class="col-lg-2">
	</div>
	
	<div class="col-lg-9">
	<div class="panel panel-default">
			<div class="panel-heading">Viendo receta</div>
			<div class="panel-body">
			
			<div style="border:1px solid #ccc; padding:5px 15px;">
			<p style="font-size:18px; font-weight:bold; ">
			${receta.nombre }
			</p>
			<p>
			${receta.calorias} calorias, creado por: ${receta.acceso.usuarioCarga.nombre}
			</p>
			</div>
			
			<div class="clearfix"></div><br>
			
			
			<div class="col-lg-6">
				<p>
					<b>
					Dificultad
					</b>
				</p>
				<p>
				${receta.dificultad}
				</p>
				
				<p>
					<b>
					Ingredientes
					</b>
				</p>

						<table
					class="table  table-bordered">
					<thead style="background:#ccc;">
						<th>Dosis</th>
						<th>Ingrediente</th>
					</thead>
					<tbody>
						<g:each in="${receta.ingredientes}" status="i" var="recetaItem">
							<tr >
								<td>
									${recetaItem.cantidadEnGr} g.
								</td>
								<td>
									${recetaItem.nombre}
								</td>
							</tr>
						</g:each>

					</tbody>
				</table>
				
				<div class="clearfix"></div><br>
				
				<input disabled class="disabled" id="es_favoita" type="checkbox" ${es_favorita?'checked':'' }/>
				<p style="display:inline-block;">Favorita</p>

					</div>
					
					
					
			
						<div class="col-lg-6">
				<p>
					<b>
					Temporada
					</b>
				</p>
				<p>
				${receta.temporada}
				</p>
				<p>
					<b>
					Condimentos
					</b>
				</p>
				<textarea class="text-areas"
				style="scroll:vertical;"
				><g:each in="${receta.condimentos}" status="i" 
				var="recetaItem">${recetaItem.nombre}</g:each></textarea>
				<div class="clearfix"></div><br>
				
				
				<p>
					<b>
					Condiciones preexistentes
					</b>
				</p>
				<textarea class="text-areas"
				style="scroll:vertical;"
				><g:each in="${condicionesPermitidas}" status="i" 
				var="condicion">${condicion.condicion+"\n"}</g:each></textarea>
				
				
			</div>
			
			<div class="col-lg-12">
						<p>
							<b> Proceso de preparaci&oacute;n </b>
						</p>

						<p class="text-areas" style="background:#EAEAEA; padding: 5px 10px;"
				><g:each in="${receta.pasos}" status="i" 
				var="paso">${paso}<br></g:each></p>
				

				</div>
				
				<div class="col-lg-12 text-center">
				<div class="clearfix"></div>
					<g:link class="btn btn-success" action="lista">
						<span class="glyphicon glyphicon-back"></span>
								Volver
							</g:link>
				</div>

				</div>
		</div>

	</div>

</body>
</html>
