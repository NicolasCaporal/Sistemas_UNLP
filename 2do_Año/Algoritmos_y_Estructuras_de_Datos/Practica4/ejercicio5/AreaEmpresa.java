/* AreaEmpresa es una clase que representa a un área de la empresa mencionada y que
contiene la identificación de la misma representada con un String y una tardanza de transmisión de
mensajes interna representada con int. */

package practica4;

public class AreaEmpresa {
	private String id;
	private int tardanza;
	
	public AreaEmpresa(String id, int tardanza) {
		setId(id);
		setTardanza(tardanza);
	}
	
	public void setId (String id) {
		this.id = id;
	}
	
	public String getId () {
		return this.id;
	}
	
	public void setTardanza(int tardanza) {
		this.tardanza = tardanza;
	}
	
	public int getTardanza() {
		return this.tardanza;
	}
}
