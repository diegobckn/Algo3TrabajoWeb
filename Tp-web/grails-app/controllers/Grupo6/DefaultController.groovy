package Grupo6

import applicationModel.QueComemosLogin
import org.omg.CORBA.UserException

class DefaultController {

	static scope = "session"
	def usuario = new Usuario()
	def recetaElegida
	def lista
	
	static allowedMethods = [
		sumar: 'POST',
		buscar: 'POST'
		
	]

	def index() {
		[usuario:usuario]
	}
	
	def loguear(){
		def messageError
		def repoUsuarios
		repoUsuarios = RepoUsuarios.getInstance() 
		try {
			repoUsuarios.chequearUsuario(params.nombre, params.clave)
			usuario = RepoUsuarios.getInstance().usuarioLogueado
			redirect (action: "lista", model: [usuario: usuario])
		} catch (RuntimeException e) {
			messageError = "Datos incorrectos"
		}
			render(view:"index", model:[usuario:usuario,messageError:messageError])
		
	}
	
	def desloguear(){
		def messageError
		usuario = new Usuario()
		
		
			render(view:"index",
				model:[usuario:usuario])
		
	}
	
	def lista()
	{
		def labelResultado
		def resultado
		resultado = new ArrayList<Receta>()
		
		if (usuario.recetasFavoritas.size > 0) {
			println("listando favoritas..")
			usuario.debug()
			resultado.addAll(usuario.recetasFavoritas)
			labelResultado = "Estas son tus recetas favoritas"
		} else if (usuario.ultimasRecetasConsultadas.size > 0) {
			labelResultado = "Estas son tus ultimas consultas"
			resultado.addAll(usuario.ultimasRecetasConsultadas)
		} else {
			resultado = RepositorioRecetas.getInstance().getRecetasVisiblesPor(usuario).toList()
			labelResultado = "Estas son las recetas Disponibles"
		}
		[usuario:usuario, recetas: resultado,labelResultado:labelResultado]
	}
	
	def getRepo(){
		return RepositorioRecetas.getInstance()
	}
	
	def buscar()
	{
		def resultado = null
		def rep
		def labelResultado
		
		rep = RepositorioRecetas.getInstance();
		labelResultado = "Resultado de la busqueda"
		
		if (params.busqueda_con_filtros.equals("1") ) {
			resultado = rep.filtrarConFiltrosUsuario(usuario)
		} else {
			resultado = rep.getRecetasVisiblesPor(usuario).toList()
			resultado = rep.buscarPorNombreReceta(params.busqueda_nombre, resultado)
			def minima = (params.busqueda_caloria_minima?params.busqueda_caloria_minima:0) as Integer
			def maxima = (params.busqueda_caloria_maxima?params.busqueda_caloria_maxima:0) as Integer
			resultado = rep.buscarPorCalorias(minima, maxima, resultado)
			resultado = rep.buscarPorDificultad(params.busqueda_dificultad, resultado)
			resultado = rep.buscarPorTemporada(params.busqueda_temporada, resultado)
//			resultado = rep.buscarPorIngrediente(params.busqueda_ingrediente, resultado)
			usuario.ultimasRecetasConsultadas.addAll(resultado)
		}
		
		
		render (view: "lista",
			model: [usuario: usuario,recetas:resultado,labelResultado:labelResultado
				])
	}
	
	
	def limpiar()
	{
		def resultado = new ArrayList<Receta>()
		def labelResultado
		
		labelResultado = "Busqueda reseteado"
		usuario.ultimasRecetasConsultadas.clear()
		
		render (view: "lista",
			model: [usuario: usuario,recetas:resultado,labelResultado:labelResultado
				])
	}
	
	
	
	def getElegida(id){
		return getRepo().getById(id)
	}
	
	def ver(int id)
	{
		recetaElegida = getElegida(id)
		def condicionesPermitidas = recetaElegida.getCondicionesQueCumple()
		[usuario: usuario, receta:recetaElegida, es_favorita:checkFavorita(), condicionesPermitidas: condicionesPermitidas]
		
		
	}
	
	def hacerFavorita(int id){
		recetaElegida = getElegida(id)
		usuario.agregarAFavoritas(recetaElegida)
		
		redirect (action: "lista")
		
	}
	
	
	def copiar(int id)
	{
		
		recetaElegida = getElegida(id)
		[receta:recetaElegida]
	}
	
	def checkFavorita(){
		return usuario.recetasFavoritas.contains(recetaElegida)
	}
	
	def procesarCopia(int id){
		recetaElegida = getElegida(id)
		recetaElegida.acceso.usuarioCarga = usuario
		def Receta copia = recetaElegida.getCopia()
		copia.nombre = params.nuevoNombre
		RepositorioRecetas.getInstance().recetas.add(copia)
		
		redirect (action: "lista")
	}
	
}

