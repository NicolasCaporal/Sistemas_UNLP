package ar.edu.unlp.info.oo2.accesobd;

import java.util.Collection;
import java.util.List;

public class DatabaseProxy implements DatabaseAccess{

    private boolean auth;
    private String apiKey;
    private DatabaseRealAccess realDatabase;

    public DatabaseProxy(String apiKey, DatabaseRealAccess realDatabase){
        this.apiKey = apiKey;
        this.auth = false;
        this.realDatabase = realDatabase;
    }

    public boolean login(String apiKey){
        if (this.apiKey.equals(apiKey)){
            this.auth = true;
        }
        return this.auth;
    }

    public void logout(){
        this.auth = false;
    }

    public boolean checkAuthentication(){
        return this.auth;
    }

    @Override
    public Collection<String> getSearchResults(String queryString) {
        if (!this.checkAuthentication()){
            throw new RuntimeException("403 Forbidden: Access denied");
        }
        return this.realDatabase.getSearchResults(queryString);
    }

    @Override
    public int insertNewRow(List<String> rowData) {
        if (!this.checkAuthentication()){
            throw new RuntimeException("403 Forbidden: Access denied");
        }
        return this.realDatabase.insertNewRow(rowData);
    }
}
