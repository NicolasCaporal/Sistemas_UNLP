package ar.edu.info.unlp.ejercicio01;

import java.util.List;
import java.util.ArrayList;

public class Twitter {
	private List<Usuario> usuarios;

	public Twitter(){
		this.usuarios = new ArrayList<Usuario>();
	}

	private boolean nombreLibre(String screenName){
		return !(this.usuarios.stream().anyMatch(usuario -> usuario.getScreenName().equals(screenName)));
	}
	public boolean crearUsuario(String screenName){
		if (this.nombreLibre(screenName)){
			usuarios.add(new Usuario(screenName));
			return true;
		}
		return false;
	}
	public boolean eliminarUsuario(String screeName){
		boolean encontro = false;
		for (Usuario usuario : this.usuarios){
			if (usuario.getScreenName().equals(screeName)){
				encontro = true;
                usuario.borrarTweets();
				this.usuarios.remove(usuario);
				break;
			}
		}
		return encontro;
	}

	public List<Usuario> getUsuarios(){
		return this.usuarios;
	}

}
