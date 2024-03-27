package ar.edu.unlp.info.oo2.biblioteca;

import java.util.List;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class JSONAdapter extends  VoorheesExporter{

    private JSONObject socioToJson(Socio socio){
        JSONObject objJSON = new JSONObject();
        objJSON.put("Nombre", socio.getNombre());
        objJSON.put("Legajo", socio.getLegajo());
        objJSON.put("Email", socio.getEmail());
        return objJSON;
    }

    @Override
    public String exportar(List<Socio> socios) {
        JSONArray arrayJSON = new JSONArray();
        socios.stream().forEach(socio -> arrayJSON.add(this.socioToJson(socio)));
        return arrayJSON.toJSONString();
    }
}
