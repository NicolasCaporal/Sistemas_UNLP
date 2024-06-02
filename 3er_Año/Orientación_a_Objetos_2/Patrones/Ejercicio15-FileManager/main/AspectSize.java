package ar.edu.info.unlp.ejercicio15;

public class AspectSize extends Aspect {

    public AspectSize(FileOO2 component) {
        super(component);
    }

    @Override
    public String prettyPrint(){
        return super.prettyPrint() + this.getSize();
    }

}
