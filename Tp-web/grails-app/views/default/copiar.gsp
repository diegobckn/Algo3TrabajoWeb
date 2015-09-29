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
	
	<div class="col-lg-3">
	</div>
	
	<div class="col-lg-6">
	


			<div class="panel panel-default">
			<div class="panel-heading"><b>Copiar Receta</b></div>

				<div class="panel-body">

					<form method="POST">
						<div class="form-group">
							<label for="nombre">Nuevo nombre</label>
							<input type="text" class="form-control" name="nuevoNombre" id="nuevoNombre" 
								placeholder="Nombre" value="Copia de ${receta.nombre }">
							<div class="clearfix"></div>
						</div>
						<g:actionSubmit controller="default" class="btn btn-success" 
						action="procesarCopia" value="Copiar"/>
						
						<g:link class="btn btn-danger" action="lista">
						<span class="glyphicon glyphicon-back"></span>
								Volver sin copiar
							</g:link>
							
							
					</form>
				</div>



			</div>


	</div>

</body>
</html>
