package ar.edu.unlp.info.oo2.accesobd;

import java.util.Collection;
import java.util.List;

public interface DatabaseAccess {
    public Collection<String> getSearchResults(String queryString);

    int insertNewRow(List<String> rowData);
}