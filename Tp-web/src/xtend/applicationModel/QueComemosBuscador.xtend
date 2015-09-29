package applicationModel

import Grupo6.FiltroStrategyPorSobrePeso
import Grupo6.Receta
import Grupo6.RepositorioRecetas
import Tests.SharedTestComponents
import Grupo6.Usuario
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.List
import Grupo6.RepoUsuarios
import Grupo6.RecetaAccesoPrivado
import Grupo6.Grupo

@Accessors
@Observable
class QueComemosBuscador {
	RepositorioRecetas repositorio
	Receta recetaSeleccionada
	Usuario usuarioLogIn
	Integer calMin
	Integer calMax
	String nombre
	String ingrediente
	String dificultad
	String temporada
	List<Receta> resultado
	boolean aceptarFiltro
	static QueComemosBuscador instance = null
	
	static  def QueComemosBuscador getInstance(){
		if(instance == null)
		{
			instance = new QueComemosBuscador
		}
		instance
	}
	new() {
	}
	
	def init(){
		resultado = new ArrayList<Receta>

		usuarioLogIn = RepoUsuarios.getInstance.usuarioLogueado
		if (usuarioLogIn != null) {
			usuarioLogIn.setAltura(120)
			usuarioLogIn.setPeso(1.88)
			usuarioLogIn.filtros.add(new FiltroStrategyPorSobrePeso)
		}else{
			usuarioLogIn = SharedTestComponents.getUsuarioConSobrepeso
			usuarioLogIn.nombre = "usuario sin registrar"
		}
		repositorio = RepositorioRecetas.getInstance

		val recetaAux = new Receta()
		recetaAux.setAcceso(new RecetaAccesoPrivado(usuarioLogIn))
		recetaAux.nombre = "Receta privada propia"
		recetaAux.calorias = 9200
		recetaAux.dificultad = "Media"
		recetaAux.temporada = "Primavera"
		repositorio.recetas.add(recetaAux)

		val otroUsuarioDelGrupo = new Usuario(100, 1.80)
		otroUsuarioDelGrupo.nombre = "Lana Lang"

		var miGrupo = new Grupo()
		miGrupo.nombre = "Grupo Copado"
		miGrupo.agregarUsuario(otroUsuarioDelGrupo)
		miGrupo.agregarUsuario(usuarioLogIn)

		val recetaDeOtro = new Receta()
		recetaDeOtro.setAcceso(new RecetaAccesoPrivado(otroUsuarioDelGrupo))
		recetaDeOtro.nombre = "Receta privada de otro usuario de mi grupo"
		recetaDeOtro.calorias = 1200
		recetaDeOtro.dificultad = "Baja"
		recetaDeOtro.temporada = "Verano"

		repositorio.recetas.add(recetaDeOtro)
	}

	def getDificultades() {
		var aux = newArrayList
		aux.add("Baja")
		aux.add("Media")
		aux.add("Alta")
		aux
	}

	def getTemporadas() {
		var aux = newArrayList
		aux.add("Otoño")
		aux.add("Invierno")
		aux.add("Primavera")
		aux.add("Verano")
		aux.add("Todos los dias")
		aux
	}

	def void agregarFavorita() {
		usuarioLogIn.agregarAFavoritas(recetaSeleccionada)
	}

	def void search() {
		if (aceptarFiltro.equals(true)) {
			resultado = repositorio.filtrarConFiltrosUsuario(usuarioLogIn)
		} else {
			resultado = repositorio.getRecetasVisiblesPor(usuarioLogIn).toList
			resultado = repositorio.buscarPorNombreReceta(nombre, resultado)
			resultado = repositorio.buscarPorCalorias(calMin, calMax, resultado)
			resultado = repositorio.buscarPorDificultad(dificultad, resultado)
			resultado = repositorio.buscarPorTemporada(temporada, resultado)
			resultado = repositorio.buscarPorIngrediente(ingrediente, resultado)
		}
	}
		
	def void clear(){
		resultado = newArrayList
		nombre = null
		calMin = null
		calMax = null
		dificultad = null
		temporada = null
		ingrediente = null
	}
}
