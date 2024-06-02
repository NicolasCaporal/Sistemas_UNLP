package ar.edu.info.unlp.ejercicio15;

import java.time.LocalDate;

public class File implements FileOO2{
    private String name;
    private String extension;
    private double size;
    private LocalDate creationDate;
    private LocalDate lastModificationDate;
    private String permissions;

    public File(String name, String extension, double size, LocalDate creationDate, LocalDate lastModificationDate, String permissions) {
        this.name = name;
        this.extension = extension;
        this.size = size;
        this.creationDate = creationDate;
        this.lastModificationDate = lastModificationDate;
        this.permissions = permissions;
    }

    @Override
    public String prettyPrint() {
        return "Archivo:";
    }

    @Override
    public String getName() {
        return this.name;
    }

    @Override
    public String getExtension() {
        return this.extension;
    }

    @Override
    public String getSize() {
        return String.valueOf(this.size);
    }

    @Override
    public String getDateCreated() {
        return this.creationDate.toString();
    }

    @Override
    public String getDateModified() {
        return this.lastModificationDate.toString();
    }

    @Override
    public String getPermissions() {
        return this.permissions;
    }
}
