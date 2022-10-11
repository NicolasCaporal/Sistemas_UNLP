
package Practica4;

public class Trabajador extends Persona {
        private String tarea;
        
        public Trabajador (String nombre, int dni, int edad, String tarea){
            super(nombre, dni, edad);
            this.tarea = tarea;
        }

        public String getTarea() {
            return tarea;
        }

        public void setTarea(String tarea) {
            this.tarea = tarea;
        }
        
        public String toString (){
            String aux1 = super.toString() + " ";
            String aux2 = "Soy " + tarea + ".";
            return aux1 + aux2;
        }
    
}
