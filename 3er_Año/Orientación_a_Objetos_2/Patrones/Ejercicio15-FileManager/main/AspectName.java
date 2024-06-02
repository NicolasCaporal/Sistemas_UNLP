package ar.edu.info.unlp.ejercicio15;

public class AspectName extends Aspect {

    public AspectName(FileOO2 component) {
        super(component);
    }

    @Override
    public String prettyPrint(){
        return super.prettyPrint() + this.getName();
    }

}
