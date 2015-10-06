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
	
			<g:if test="${messageError}">
				<div class="alert alert-success">
					${messageError}
				</div>
			</g:if>
			
			<div class="clearfix"></div>

			<div class="panel panel-default">
			<div class="panel-heading"><b>Panel de identificaci&oacute;n</b></div>

				<div class="panel-body">
				
				<h5>
				Logueado como
				</h5>
				<h4>
				${usuario.nombre}
				
				</h4>
				<div class="clearfix"></div>

					<g:link class="btn btn-danger" action="desloguear">
										<span class="glyphicon glyphicon-log-out"></span>
												Desloguear
									</g:link>
				</div>



			</div>


	</div>

</body>
</html>
