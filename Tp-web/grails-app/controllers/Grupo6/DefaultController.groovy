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
		usuario.nombre = params.nombre
		usuario.clave = params.clave
		
		try {
			RepoUsuarios.getInstance().chequearUsuario(usuario.nombre,usuario.clave)
			usuario = RepoUsuarios.getInstance().usuarioLogueado
			redirect (action: "lista",
					model: [usuario: usuario])
		} catch (RuntimeException e) {
			messageError = "Datos incorrectos"
		}
			render(view:"index",
				model:[usuario:usuario,messageError:messageError])
		
	}
	
	def desloguear(){
		def messageError
		usuario.nombre = ""
		usuario.clave = ""
		
		
			render(view:"index",
				model:[usuario:usuario])
		
	}
	
	def lista()
	{
		lista = RepositorioRecetas.getInstance().recetas
		[usuario:usuario, recetas: lista]
	}
	
	def getRepo(){
		return RepositorioRecetas.getInstance()
	}
	
	def buscar()
	{
		def resultado
		if (params.busqueda_con_filtros) {
			resultado = RepositorioRecetas.getInstance.filtrarConFiltrosUsuario(usuario)
		} else {
		def rep
		rep = RepositorioRecetas.getInstance();
			resultado = rep.getRecetasVisiblesPor(usuario).toList()
			resultado = rep.buscarPorNombreReceta(params.busqueda_nombre, resultado)
//			resultado = rep.buscarPorCalorias(params.busqueda_caloria_minima, busqueda_caloria_minima, resultado)
//			resultado = rep.buscarPorDificultad(params.busqueda_dificultad, resultado)
//			resultado = rep.buscarPorTemporada(params.busqueda_temporada, resultado)
//			resultado = rep.buscarPorIngrediente(params.busqueda_ingrediente, resultado)
		}
		
		
		redirect (action: "lista",
			model: [usuario: usuario,recetas:resultado])
	}
	
	def getElegida(id){
		return getRepo().recetas.get(id)
	}
	
	def ver(int id)
	{
		recetaElegida = getElegida(id)
		[usuario: usuario, receta:recetaElegida,es_favorita:checkFavorita()]
		
		
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

