package Grupo6

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.UserException

@Accessors
@Observable
class RepoUsuarios {

	List<Usuario> usuariosAprobados = new ArrayList<Usuario>
	List<Usuario> usuariosPendientes = new ArrayList<Usuario>
	Usuario usuarioLogueado = null
	static RepoUsuarios instance

	new() {
		this.crearUsuariosDefault()
	}

	def static RepoUsuarios getInstance() {
		if (instance == (null)) {
			instance = new RepoUsuarios()
		}
		instance
	}

	def void add(Usuario unUsuario) {
		usuariosPendientes.add(unUsuario)
	}

	def void remove(Usuario unUsuario) {
		if (unUsuario.nombre != "") {
			usuariosAprobados.remove(usuariosAprobados.findFirst[it.nombre == unUsuario.nombre])
			usuariosPendientes.remove(usuariosPendientes.findFirst[it.nombre == unUsuario.nombre])
		}
	}

	def void update(Usuario unUsuario) {
		var usu = usuariosAprobados.findFirst[it.nombre == unUsuario.nombre]
		if (usu == null) {
			usu = usuariosPendientes.findFirst[it.nombre == unUsuario.nombre]
		}
		if (usu != null) {
			usu.modificar(unUsuario)
		}
	}

	def Usuario get(Usuario unUsuario) {
		usuariosAprobados.findFirst[it.nombre == unUsuario.nombre]
	}

	def List<Usuario> list(Usuario usuarioEjemplo) {
		usuariosAprobados.filter[coincidenCondiciones(it, usuarioEjemplo.condicionesPreexistentes)].toList
	}

	def boolean coincidenCondiciones(Usuario usuario, List<CondicionPreexistente> preexistentes) {
		preexistentes.isEmpty() // || usuario.condicionesPreexistentes.forall[ it.]  .stream().anyMatch(condicion -> preexistentes.contains(condicion));
	}

//
//	def List<Usuario> listPendinds(Usuario unUsuario) {
//		usuariosPendientes.filter[coincidenCondiciones(it, usuarioEjemplo.condicionesPreexistentes)].toList
//	}
//
//	private boolean coincidenCondiciones(Usuario unUsuario, List<condicionesPreexistentes> condiciones) {
//		return condiciones.isEmpty() || unUsuario.condicionesPreexistentes.stream().anyMatch(condicion -> condiciones.contains(condicion));
//	}
	def void approve(Usuario unUsuario) {
		var usu = usuariosPendientes.findFirst[it.nombre == unUsuario.nombre]
		if (usu != null) {
			usuariosAprobados.add(unUsuario)
			usuariosPendientes.remove(usu)
		}
	}

	def void deny(Usuario unUsuario) {
		var usu = usuariosPendientes.findFirst[it.nombre == unUsuario.nombre]
		if (usu != null) {
			usuariosPendientes.remove(usu)
		}
	}

	def crearUsuariosDefault() {
		val user1 = new Usuario(0, 0)
		user1.nombre = "Clark Kent"
		user1.clave = "cLark"

		val user2 = new Usuario(0, 0)
		user2.nombre = "Lana Lang"
		user2.clave = "lAna"

		val user3 = new Usuario(0, 0)
		user3.nombre = "Lex Luthor"
		user3.clave = "lEx"

		usuariosAprobados.add(user1)
		usuariosAprobados.add(user2)
		usuariosAprobados.add(user3)
	}

	def chequearUsuario(String nombre, String clave) {
		var res = usuariosAprobados.filter[u|u.nombre.equals(nombre) && u.clave.equals(clave)]
		if (res.size > 0) {
			usuarioLogueado = res.get(0)
		} else {
			throw new UserException("Datos incorrectos")
		}
	}

}
