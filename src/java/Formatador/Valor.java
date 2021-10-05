package Formatador;

import java.text.NumberFormat;
import java.util.Locale;

public class Valor {
    
    Locale localeBR = new Locale("pt","BR");
    NumberFormat dinheiro = NumberFormat.getCurrencyInstance(localeBR);
    
    public String FormatarValor(double valor){
        String valorConvertido = dinheiro.format(valor);
        return valorConvertido;
    }

}
