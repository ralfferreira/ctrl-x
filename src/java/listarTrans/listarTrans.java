package listarTrans;

import Model.Transacao;
import Conexao.Conexao;

import java.sql.*;
import java.util.ArrayList;
import javax.servlet.http.*;

public class listarTrans extends HttpServlet {

    public ArrayList<Transacao> ListarPorUser(Integer User){
        
        ArrayList<Transacao> Conteudo = new ArrayList<Transacao>();
        
        try{
            String sqllistaTrans = 
                    "SELECT T.cod_trans, T.desc_trans, T.data_trans, T.valor_trans, T.tipo_trans, T.cod_tipotrans, C.nome_tipo, T.cod_user "
                    + "FROM transacao T "
                    + "INNER JOIN tipo_trans C ON C.cod_tipotrans = T.cod_tipotrans "
                    + "WHERE T.cod_user = " + User;
            Connection conn = Conexao.Conectar();
            Statement stlistaTrans = conn.createStatement();
            ResultSet rslistaTrans = stlistaTrans.executeQuery(sqllistaTrans);
            while(rslistaTrans.next()){
                Transacao dados = new Transacao();                
                dados.setId(rslistaTrans.getInt("T.cod_trans"));
                dados.setDescricao(rslistaTrans.getString("T.desc_trans"));
                dados.setData(rslistaTrans.getDate("T.data_trans"));
                dados.setValor(rslistaTrans.getDouble("T.valor_trans"));
                dados.setTipo(rslistaTrans.getString("T.tipo_trans"));
                dados.setCategoria(rslistaTrans.getInt("T.cod_tipotrans"));
                dados.setNome(rslistaTrans.getString("C.nome_tipo"));
                dados.setUser(rslistaTrans.getInt("T.cod_user"));
                
                if(dados.getTipo().equals("G")){
                    dados.setTipo("Gasto");
                }
                else{
                    dados.setTipo("Rendimento");
                }
                
                Conteudo.add(dados);
            }
            rslistaTrans.close();
            conn.close();
        }
        catch(Exception e){
            System.out.print("listarTrans: ERRO");
            System.out.print(e.getMessage());
        }
        return Conteudo;
    }
    
    public ArrayList<Transacao> ListarPorTipo(Integer User, Integer Tipo){
        
        ArrayList<Transacao> Conteudo = new ArrayList<Transacao>();
        
        try{
            String sqllistaTrans = 
                    "SELECT T.cod_trans, T.desc_trans, T.data_trans, T.valor_trans, T.tipo_trans, T.cod_tipotrans, C.nome_tipo, T.cod_user "
                    + "FROM transacao T "
                    + "INNER JOIN tipo_trans C ON C.cod_tipotrans = T.cod_tipotrans "
                    + "WHERE T.cod_user = " + User + " AND C.cod_tipotrans = " + Tipo;
            Connection conn = Conexao.Conectar();
            Statement stlistaTrans = conn.createStatement();
            ResultSet rslistaTrans = stlistaTrans.executeQuery(sqllistaTrans);
            while(rslistaTrans.next()){
                Transacao dados = new Transacao();                
                dados.setId(rslistaTrans.getInt("T.cod_trans"));
                dados.setDescricao(rslistaTrans.getString("T.desc_trans"));
                dados.setData(rslistaTrans.getDate("T.data_trans"));
                dados.setValor(rslistaTrans.getDouble("T.valor_trans"));
                dados.setTipo(rslistaTrans.getString("T.tipo_trans"));
                dados.setCategoria(rslistaTrans.getInt("T.cod_tipotrans"));
                dados.setNome(rslistaTrans.getString("C.nome_tipo"));
                dados.setUser(rslistaTrans.getInt("T.cod_user"));
                
                if(dados.getTipo().equals("G")){
                    dados.setTipo("Gasto");
                }
                else{
                    dados.setTipo("Rendimento");
                }
                
                Conteudo.add(dados);
            }
            rslistaTrans.close();
            conn.close();
        }
        catch(Exception e){
            System.out.print("listarTrans: ERRO");
            System.out.print(e.getMessage());
        }
        return Conteudo;
    }
}
 