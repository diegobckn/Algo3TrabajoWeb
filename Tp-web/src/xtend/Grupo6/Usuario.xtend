package Grupo6

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Date
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Usuario implements IAceptaSugerencias {
	double peso
	double altura
	char sexo
	String nombre
	String clave
	Date fechaDeNacimiento
	List<String> preferencias
	List<String> comidasQueNoGustan
	List<CondicionPreexistente> condicionesPreexistentes
	List<Receta> recetasFavoritas
	List<Grupo> grupos
	boolean guardarSiempreFavoritas
	List<IFiltroStrategy> filtros
	RutinaEjercicio rutinaDeEjercicio
	
	new(){
		this.nombre = ""
	}
	
	new(String nombre){
		this.nombre = nombre
	}

	new(double elPeso, double laAltura) {
		peso = elPeso
		altura = laAltura
		fechaDeNacimiento = new Date()
		preferencias = new ArrayList<String>()
		comidasQueNoGustan = new ArrayList<String>()
		condicionesPreexistentes = new ArrayList<CondicionPreexistente>()
		recetasFavoritas = new ArrayList<Receta>()
		grupos = new ArrayList<Grupo>()
		guardarSiempreFavoritas = false
		filtros = new ArrayList<IFiltroStrategy> 
	}

	def double getIMC() {
		return peso / Math.pow(altura, 2);
	}

	def void validarObligatorios() {
		if (this.nombre.length < 4) {
			throw new BusinessException("El nombre debe tener mas de 4 caracteres")
		}

		if (this.fechaDeNacimiento < (new Date())) {
			throw new BusinessException("La fecha de nacimiento debe ser anterior a hoy")
		}

		condicionesPreexistentes.forEach [
			it.validarObligatorios(this)
		]
	}

	def void validarSexo() {
		condicionesPreexistentes.forEach [
			it.validarSexo(this)
		]
	}

	def void validarPreferencias() {
		condicionesPreexistentes.forEach [
			it.validarPreferencias(this)
		]
	}

	def void validar() {
		validarObligatorios()
		validarSexo()
		validarPreferencias()
	}

	def boolean getEsRutinaSaludable() {
		val imc = getIMC() as double

		if (imc >= 18 && imc <= 30) {
			return true
		} else {
			if(condicionesPreexistentes.length == 0) return false

			return condicionesPreexistentes.forall[it.getEsRutinaSaludable(this)]
		}

	}

	override getEsRecetaAptaParaMi(Receta unaReceta) {
		return condicionesPreexistentes.forall[it.getEsRecetaApta(unaReceta)]
	}

	override getEsSugeridaParaMi(Receta unaReceta) {
		val ver = unaReceta.puedeVerme(this)
		val apta = this.getEsRecetaAptaParaMi(unaReceta)
		val gusta = ! comidasQueNoGustan.exists[unaReceta.verSiTiene(new Alimento(it), 0)]

		return ver && apta && gusta
	}

	def void agregarAFavoritas(Receta unaReceta) {
		if (!recetasFavoritas.contains(unaReceta))
			recetasFavoritas.add(unaReceta)
			else{
				recetasFavoritas.remove(unaReceta)
			}
	}
	
	override getTieneSobrepeso() {
		return this.getIMC() > 25.0
	}

	def void modificar(Usuario unUsuario) {
		this.peso = unUsuario.peso
		this.altura = unUsuario.altura
		this.sexo = unUsuario.sexo
		this.nombre = unUsuario.nombre
		this.fechaDeNacimiento = unUsuario.fechaDeNacimiento
		this.preferencias = unUsuario.preferencias
		this.comidasQueNoGustan = unUsuario.comidasQueNoGustan
		this.condicionesPreexistentes = unUsuario.condicionesPreexistentes
		this.recetasFavoritas = unUsuario.recetasFavoritas
		this.grupos = unUsuario.grupos
	}

}
