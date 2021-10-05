package GraficoData;

import Model.Grafico_Info;
import Conexao.Conexao;

import java.sql.*;
import java.util.ArrayList;
import javax.servlet.http.*;

public class GraficoData extends HttpServlet {

    public ArrayList<Grafico_Info> ListarPorUser(Integer User){
        
        ArrayList<Grafico_Info> Conteudo = new ArrayList<Grafico_Info>();
        
        try{
            String sqllistaDados = 
                    "SELECT (SELECT SUM(valor_trans) FROM transacao WHERE cod_user = " + User + 
                    " AND tipo_trans = 'R') as rend, (SELECT SUM((valor_trans * 1)) FROM transacao WHERE cod_user = " + User + 
                    " AND tipo_trans = 'G') as gasto, SUM(CASE WHEN tipo_trans = \"G\" THEN (valor_trans * -1) ELSE valor_trans END) as saldo FROM transacao Trans WHERE Trans.cod_user = " + User;
            Connection conn = Conexao.Conectar();
            Statement stlistaDados = conn.createStatement();
            ResultSet rslistaDados = stlistaDados.executeQuery(sqllistaDados);
            while(rslistaDados.next()){
                Grafico_Info dados = new Grafico_Info();                
                dados.setGasto(rslistaDados.getDouble("gasto"));
                dados.setRend(rslistaDados.getDouble("rend"));
                dados.setSaldo(rslistaDados.getDouble("saldo"));
                Conteudo.add(dados);
            }
            rslistaDados.close();
            conn.close();
        }
        catch(Exception e){
            System.out.print("listarTrans: ERRO");
            System.out.print(e.getMessage());
        }
        return Conteudo;
    }
    
    public ArrayList<Grafico_Info> ListarPorTipo(Integer User, Integer Tipo){
        
        ArrayList<Grafico_Info> Conteudo = new ArrayList<Grafico_Info>();
        
        try{
            String sqllistaDados = 
                    "SELECT (SELECT SUM(valor_trans) FROM transacao WHERE cod_user = " + User + " AND cod_tipotrans = " + Tipo +
                    " AND tipo_trans = 'R') as rend, (SELECT SUM((valor_trans * 1)) FROM transacao WHERE cod_user = " + User + " AND cod_tipotrans = " + Tipo +
                    " AND tipo_trans = 'G') as gasto, SUM(CASE WHEN tipo_trans = \"G\" THEN (valor_trans * -1) ELSE valor_trans END) as saldo FROM transacao Trans WHERE Trans.cod_user = " + User + " AND cod_tipotrans = " + Tipo;
            Connection conn = Conexao.Conectar();
            Statement stlistaDados = conn.createStatement();
            ResultSet rslistaDados = stlistaDados.executeQuery(sqllistaDados);
            while(rslistaDados.next()){
                Grafico_Info dados = new Grafico_Info();                
                dados.setGasto(rslistaDados.getDouble("gasto"));
                dados.setRend(rslistaDados.getDouble("rend"));
                dados.setSaldo(rslistaDados.getDouble("saldo"));
                Conteudo.add(dados);
            }
            rslistaDados.close();
            conn.close();
        }
        catch(Exception e){
            System.out.print("listarTrans: ERRO");
            System.out.print(e.getMessage());
        }
        return Conteudo;
    }
    
    public ArrayList<Grafico_Info> CardInfo(Integer User, Integer Categoria){
        
        ArrayList<Grafico_Info> Conteudo = new ArrayList<Grafico_Info>();
        
        try{
            String sqllistaDados = new String();
            
            if(Categoria == 0){
                sqllistaDados = 
                    "SELECT" +
                    " (SELECT SUM(valor_trans) FROM transacao WHERE cod_user = " + User + " AND tipo_trans = 'R') as rend, " +
                    " (SELECT SUM((valor_trans * -1)) FROM transacao WHERE cod_user = " + User + " AND tipo_trans = 'G') as gasto, " +
                    " SUM(CASE WHEN tipo_trans = 'G' THEN (valor_trans * -1) ELSE valor_trans END) as saldo," +
                    " Meta.valor_meta as meta " +
                    " FROM transacao Trans " +
                    " LEFT JOIN meta Meta ON Meta.cod_user = Trans.cod_user" +
                    " WHERE Trans.cod_user = " + User;
            }
            else{
                sqllistaDados = 
                    "SELECT " +
                    "(SELECT SUM(valor_trans) FROM transacao WHERE cod_user = " + User + " AND tipo_trans = 'R' AND cod_tipotrans = " + Categoria + ") as rend, " +
                    "(SELECT SUM(valor_trans * -1) FROM transacao WHERE cod_user = " + User + " AND tipo_trans = 'G' AND cod_tipotrans = " + Categoria + ") as gasto, " +
                    "SUM(CASE WHEN tipo_trans = 'G' THEN (valor_trans * -1) ELSE valor_trans END) as saldo, " +
                    "Meta.valor_meta as meta " +
                    "FROM transacao Trans " +
                    "LEFT JOIN meta Meta ON Meta.cod_user = Trans.cod_user " +
                    "WHERE Trans.cod_user = " + User + " AND Trans.cod_tipotrans = " + Categoria;
            }
            Connection conn = Conexao.Conectar();
            Statement stlistaDados = conn.createStatement();
            ResultSet rslistaDados = stlistaDados.executeQuery(sqllistaDados);
            while(rslistaDados.next()){
                Grafico_Info dados = new Grafico_Info();                
                dados.setGasto(rslistaDados.getDouble("gasto"));
                dados.setRend(rslistaDados.getDouble("rend"));
                dados.setSaldo(rslistaDados.getDouble("saldo"));
                dados.setMeta(rslistaDados.getDouble("meta"));
                Conteudo.add(dados);
            }
            rslistaDados.close();
            conn.close();
        }
        catch(Exception e){
            System.out.print("listarTrans: ERRO");
            System.out.print(e.getMessage());
        }
        return Conteudo;
    }
    
    public ArrayList<Double> ConverterValor (ArrayList<Grafico_Info> lista, String opcao){
        
        double Valor;
        ArrayList<Double> Conteudo = new ArrayList<Double>();
        
        if(opcao.equals("Gasto")){
            for(Grafico_Info dado : lista){
                Valor = dado.getGasto();
                Conteudo.add(Valor);
            }
        }
        else if(opcao.equals("Rend")){
            for(Grafico_Info dado : lista){
                Valor = dado.getRend();
                Conteudo.add(Valor);
            }
        }
        else if(opcao.equals("Saldo")){
            for(Grafico_Info dado : lista){
                Valor = dado.getSaldo();
                Conteudo.add(Valor);
            }
        }
        else {
            for(Grafico_Info dado : lista){
                Valor = dado.getMeta();
                Conteudo.add(Valor);
            }
        }

        return Conteudo;
    }
    
}
 