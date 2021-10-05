package listarMeta;

import Model.Meta;
import Conexao.Conexao;

import java.sql.*;
import java.util.ArrayList;
import javax.servlet.http.*;

public class listarMeta extends HttpServlet {

    public ArrayList<Meta> ListarPorUser(Integer User){
        
        ArrayList<Meta> Conteudo = new ArrayList<Meta>();
        
        try{
            String sqllistaMeta = 
                    "SELECT M.cod_meta, M.desc_meta, M.data_inicio, M.data_limite, M.valor_meta, M.cod_tipotrans, C.nome_tipo, M.cod_user "
                    + "FROM meta M "
                    + "LEFT JOIN tipo_trans C ON C.cod_tipotrans = M.cod_tipotrans "
                    + "WHERE M.cod_user = " + User;
            Connection conn = Conexao.Conectar();
            Statement stlistaMeta = conn.createStatement();
            ResultSet rslistaMeta = stlistaMeta.executeQuery(sqllistaMeta);
            while(rslistaMeta.next()){
                Meta dados = new Meta();  
                dados.setId(rslistaMeta.getInt("M.cod_meta"));
                dados.setDescricao(rslistaMeta.getString("M.desc_meta"));
                dados.setDt_Inicio(rslistaMeta.getDate("M.data_inicio"));
                dados.setDt_Termino(rslistaMeta.getDate("M.data_limite"));
                dados.setValor(rslistaMeta.getDouble("M.valor_meta"));                
                dados.setUser(rslistaMeta.getInt("M.cod_user"));
                dados.setNome_Cat(rslistaMeta.getString("C.nome_tipo"));                                
                
                if(dados.getNome_Cat() == null){                    
                    dados.setNome_Cat("Geral");
                }
                else{
                    dados.setCategoria(rslistaMeta.getInt("M.cod_tipotrans"));
                }
                
                Conteudo.add(dados);
            }
            rslistaMeta.close();
            conn.close();
        }
        catch(Exception e){
            System.out.print("listarMeta: ERRO");
            System.out.print(e.getMessage());
        }
        return Conteudo;
    }
    
    public ArrayList<Meta> ListarPorTipo(Integer User, Integer Tipo){
        
        ArrayList<Meta> Conteudo = new ArrayList<Meta>();
        
        try{
            String sqllistaMeta = "SELECT * FROM meta WHERE cod_user = " + User + "AND cod_tipotrans = " + Tipo;
            Connection conn = Conexao.Conectar();
            Statement stlistaMeta = conn.createStatement();
            ResultSet rslistaMeta = stlistaMeta.executeQuery(sqllistaMeta);
            while(rslistaMeta.next()){
                Meta dados = new Meta();  
                dados.setId(rslistaMeta.getInt("cod_meta"));
                dados.setDescricao(rslistaMeta.getString("desc_meta"));
                dados.setValor(rslistaMeta.getDouble("valor_meta"));
                dados.setCategoria(rslistaMeta.getInt("cod_tipotrans"));
                dados.setUser(rslistaMeta.getInt("cod_user"));
                Conteudo.add(dados);
            }
            rslistaMeta.close();
            conn.close();
        }
        catch(Exception e){
            System.out.print("listarMeta: ERRO");
            System.out.print(e.getMessage());
        }
        return Conteudo;
    }
}