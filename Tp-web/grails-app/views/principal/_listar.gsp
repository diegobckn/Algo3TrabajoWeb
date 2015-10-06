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
		<g:render template="/template/panelLogin" model="" /> 
		<g:render template="/template/panelHeader" model="" />
		<div class="clearfix"></div>
		<g:render template="/template/panelBusqueda" model="[recetas:recetas]" />
		<g:render template="/template/panelListado" model="[recetas:recetas, labelResultado:labelResultado]" />
		
		</div>
		
		<g:render template="/template/panelFooter" model="" />
</body>
</html>
