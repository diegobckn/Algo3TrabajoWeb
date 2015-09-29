package applicationModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import Grupo6.RepoUsuarios

@Accessors
@Observable
class QueComemosLogin {
	String usuario = ""
	String clave = ""
	RepoUsuarios repoUsuarios
	
	new() {
		repoUsuarios = RepoUsuarios.getInstance
	}
	
	def checkLogin(){
		repoUsuarios.chequearUsuario(usuario,clave)
	}
	
	
}