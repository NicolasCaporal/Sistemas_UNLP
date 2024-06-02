package ar.edu.info.unlp.ejercicio15;

public class AspectDateCreated extends Aspect {

    public AspectDateCreated(FileOO2 component) {
        super(component);
    }

    @Override
    public String prettyPrint(){
        return super.prettyPrint() + this.getDateCreated();
    }

}
