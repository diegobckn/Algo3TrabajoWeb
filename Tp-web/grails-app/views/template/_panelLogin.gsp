<g:if test="${session.logueadoOk}">
	<div class="col-lg-3 pull-right panel-group" id="accordion1">
					<div class="row">
								<p>
								Logueado como: ${usuario.nombre}
									<g:link class="" controller="Login" action="desloguear">
												Salir
									</g:link>
								</p>
				</div>
	</div>
</g:if>