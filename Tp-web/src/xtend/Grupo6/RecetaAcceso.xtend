package Grupo6

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
@Observable
abstract class RecetaAcceso {
	public Usuario usuarioCarga 
	def boolean puedeVerme(Usuario unUsuario)
	def boolean puedeModificarme(Usuario unUsuario)
}