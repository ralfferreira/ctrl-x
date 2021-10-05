package Formatador;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class Data {
    
    SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy"); 
    
    public String FormatarData(Date data){        
        String dataFormatada = formato.format(data);
        return dataFormatada;
    }
}
