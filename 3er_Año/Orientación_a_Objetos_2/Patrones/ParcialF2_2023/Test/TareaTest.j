public class TareaTest{

    private TareaCompleja almuerzo;
    private TareaCompleja compras;
    private TareaSimple super;
    private TareaSimple verduleria;
    private TareaSimple cocinar;
    private TareaSimple mesa;

    @forEach
    public void setup(){
        super = new TareaSimple("Ir al supermercado", 3, "Comprar algo");
        super.setInicio(9);
        super.setFin(11);
        verduleria = new TareaSimple("Ir a la verduleria", 1, "Papa y tomate");
        verduleria.setInicio(11);
        verduleria.setFin(12);
        compras("Ir de compras");
        compras.addTarea(super);
        compras.addTarea(verduleria);
        cocinar = new TareaSimple("Cocinar", 2, "Pastel de papa");
        mesa = new TareaSimple("Preparar la mesa", 1, "2 platos");
        almuerzo = new TareaCompleja("preparar almuerzo");
        almuerzo.addTarea(compras);
        almuerzo.addTarea(cocinar);
        almuerzo.addTarea(mesa);
    }


    @Test 
    public void testAvance(){
        assertEquals(); //Falta
    }

}