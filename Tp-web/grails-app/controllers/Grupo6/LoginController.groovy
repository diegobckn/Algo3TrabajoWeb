package Grupo6

import applicationModel.QueComemosLogin
import org.omg.CORBA.UserException

class LoginController {

//	static scope = "session"
	def AplicationModelUser = new QueComemosLogin()
	def usuario = null
	
	static allowedMethods = [
		sumar: 'POST',
		buscar: 'POST'
		
	]

	def index() {
		
		checkUsuario()
		[usuario:new Usuario()]
	}
	
	def getUsuarioDeSesion(){
		def Usuario usuarioBuscado = new Usuario()
		
		if(session.nombreUsuario && session.claveUsuario){
			usuarioBuscado.nombre = session.nombreUsuario
			usuarioBuscado.clave = session.claveUsuario
			usuario = repoUsuario.get(usuarioBuscado)
		}else{
		usuario = null
		}
	}
	
	def checkUsuario(){
		def messageError
		getUsuarioDeSesion()
		if(usuario !=null){
			render(view:"logueado", model:[usuario:usuario])//para no permitir doble inicio se session
		}
	
		
		
	}
	
	
	def loguear(){
		def messageError
		try {
			AplicationModelUser.usuario = params.nombre
			AplicationModelUser.clave = params.clave
			
			AplicationModelUser.checkLogin()
//			repoUsuario.chequearUsuario(params.nombre, params.clave)
//			usuario = repoUsuario.usuarioLogueado
			
			usuario = AplicationModelUser.repoUsuarios.usuarioLogueado
			session.nombreUsuario = usuario.nombre
			session.claveUsuario = usuario.clave
			session.logueadoOk = true
			
			redirect (controller: "Principal",action: "index")
		} catch (RuntimeException e) {
			messageError = "Datos incorrectos"
		}
			render(view:"index", model:[usuario:usuario,messageError:messageError])
	}
	
	def desloguear(){
		def messageError
		usuario = new Usuario()
		
		session.nombreUsuario = ""
		session.claveUsuario = ""
		session.logueadoOk = false
			
			render(view:"index",
				model:[usuario:usuario])
		
	}


}

