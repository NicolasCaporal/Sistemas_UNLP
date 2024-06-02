package ar.edu.info.unlp.ejercicio15;

public class AspectLastModificationDate extends Aspect {

    public AspectLastModificationDate(FileOO2 component) {
        super(component);
    }

    @Override
    public String prettyPrint(){
        return super.prettyPrint() + this.getDateModified();
    }

}
