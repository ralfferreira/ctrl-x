package Java2Json;

import com.google.gson.Gson;
import java.util.ArrayList;

public class Java2Json {    
    
    public String  ConverterStringParaJSON (ArrayList<String> lista) {
        ArrayList<String> Conteudo = lista;        
        Gson gson = new Gson();

        // converte objetos Java para JSON e retorna JSON como String
        String json = gson.toJson(Conteudo);
        
        return json;
    }
    
    public String  ConverterDoubleParaJSON (ArrayList<Double> lista) {
        ArrayList<Double> Conteudo = lista;        
        Gson gson = new Gson();

        // converte objetos Java para JSON e retorna JSON como String
        String json = gson.toJson(Conteudo);
        
        return json;
    }
    
}