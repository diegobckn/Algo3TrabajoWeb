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
	<g:render template="/template/panelHeader" model="" />
	
	
	<div class="col-lg-3">
	</div>
	
	<div class="col-lg-6">
	
			<g:if test="${messageError}">
				<div class="alert alert-danger">
					${messageError}
				</div>
			</g:if>
			
			<div class="clearfix"></div>

			<div class="panel panel-default">
			<div class="panel-heading"><b>Panel de identificaci&oacute;n</b></div>

				<div class="panel-body">

					<form method="POST">
						<div class="form-group">
							<label for="nombre">Ingrese su nombre</label>
							<input type="text" class="form-control" name="nombre" id="nombre" value="${usuario.nombre}" 
								placeholder="Nombre">
							<div class="clearfix"></div>
							<div class="clearfix"></div>
							<br> <label for="clave">Ingrese su contrase&ntilde;a</label>
							<input type="password" class="form-control" name="clave" id="clave" value="${usuario.clave}"
								placeholder="Clave">
						</div>
						<g:actionSubmit controller="default" class="btn btn-success" action="loguear" value="Entrar"/>
					</form>
				</div>



			</div>


	</div>
	</div>

	<g:render template="/template/panelFooter" model="" />
	
</body>
</html>
