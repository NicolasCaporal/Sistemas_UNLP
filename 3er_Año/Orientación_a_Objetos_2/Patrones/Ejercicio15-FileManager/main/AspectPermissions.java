package ar.edu.info.unlp.ejercicio15;

public class AspectPermissions extends Aspect {

    public AspectPermissions(FileOO2 component) {
        super(component);
    }

    @Override
    public String prettyPrint(){
        return super.prettyPrint() + this.getPermissions();
    }

}
