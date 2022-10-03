/*
5- Se dispone de la clase Partido (en la carpeta tema2). Un objeto partido representa un
encuentro entre dos equipos (local y visitante). Un objeto partido puede crearse sin
valores iniciales o enviando en el mensaje de creación el nombre del equipo local, el
nombre del visitante, la cantidad de goles del local y del visitante (en ese orden). Un objeto
partido sabe responder a los siguientes mensajes:

getLocal() retorna el nombre (String) del equipo local
getVisitante() retorna el nombre (String) del equipo visitante
getGolesLocal() retorna la cantidad de goles (int) del equipo local
getGolesVisitante() retorna la cantidad de goles (int) del equipo visitante
setLocal(X) modifica el nombre del equipo local al “String” X
setVisitante(X) modifica el nombre del equipo visitante al “String” X
setGolesLocal(X) modifica la cantidad de goles del equipo local al “int” X
setGolesVisitante(X) modifica la cantidad de goles del equipo visitante al “int” X
hayGanador() retorna un boolean que indica si hubo (true) o no hubo (false) ganador
getGanador() retorna el nombre (String) del ganador del partido (si no hubo retorna
un String vacío).
hayEmpate() retorna un boolean que indica si hubo (true) o no hubo (false) empate


Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en
el campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con
nombre de visitante “ZZZ” o alcanzar los 20 partidos. 

Luego de la carga:
- Para cada partido, armar e informar una representación String del estilo:
{EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante }
- Calcular e informar la cantidad de partidos que ganó River.
- Calcular e informar el total de goles que realizó Boca jugando de local.
 */

package Practica2;

import PaqueteLectura.GeneradorAleatorio;


public class Ejercicio5Practica2 {
     
    public static Partido leerPartido(){
        Partido aux = new Partido();
        
        aux.setGolesLocal(GeneradorAleatorio.generarInt(10));
        if (aux.getGolesLocal() > 7){
            aux.setLocal("CABJ");
        } else {
            aux.setLocal(GeneradorAleatorio.generarString(4));
        }
        
        aux.setGolesVisitante(GeneradorAleatorio.generarInt(5));
        
        if (aux.getGolesVisitante() == 4){
            aux.setVisitante("CARP");
        } else if (aux.getGolesVisitante() == 9) {
            aux.setVisitante("ZZZ");
        } else {
        aux.setVisitante(GeneradorAleatorio.generarString(4));
        }
        
        return aux;
    }
    
    public static String imprimirPartido(Partido p){
        String s;
        
        s = (p.getLocal() + " " + p.getGolesLocal() + " VS " + p.getGolesVisitante() + " " + p.getVisitante());
        
        return s; 
    }
    
    public static void main (String[] args){
        
        GeneradorAleatorio.iniciar();
        
        int dimF = 20;       
        Partido [] vector = new Partido [dimF];
        int dimL = 0;
        Partido p = leerPartido();
        
        while ((p.getVisitante() != "ZZZ") && (dimL < dimF)){
            vector[dimL] = p;
            dimL++;
            p = leerPartido();
        }
    
        
        int ganadosRiBer = 0;
        int golesBoquita = 0;
        for (int i = 0; i < dimL; i++){
            System.out.println(imprimirPartido(vector[i]));
            
            if (vector[i].getGanador() == "CARP")
                ganadosRiBer++;
            
            if (vector[i].getLocal() == "CABJ") {
                golesBoquita = (golesBoquita + vector[i].getGolesLocal());
            
            } else if (vector[i].getVisitante() == "CABJ") {
                golesBoquita = (golesBoquita + vector[i].getGolesVisitante());
            }          
        }
        
        System.out.println();
        System.out.println("El Club Atletico Boca Juniors hizo " + golesBoquita + " goles.");
        System.out.println("Seremos menos malos que los demás. Juan Roman Riquelme");
        System.out.println();
        System.out.println("RiBer ganó " + ganadosRiBer + " partidos.");
        System.out.println("RiBer fue RiBEr, se le cayó la bombacha. Diego Armando Maradona");
        System.out.println();      
    }
}
