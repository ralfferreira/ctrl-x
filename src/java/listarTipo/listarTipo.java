package listarTipo;

import Model.Categoria;
import Conexao.Conexao;

import java.sql.*;
import java.util.ArrayList;
import javax.servlet.http.*;

public class listarTipo extends HttpServlet {

    public ArrayList<Categoria> ListarPorUser(Integer User){
        
        ArrayList<Categoria> Conteudo = new ArrayList<Categoria>();
        
        try{
            String sqllistaTipo = "SELECT * FROM tipo_trans WHERE cod_tipotrans = 1 OR cod_user = " + User;
            Connection conn = Conexao.Conectar();
            Statement stlistaTipo = conn.createStatement();
            ResultSet rslistaTipo = stlistaTipo.executeQuery(sqllistaTipo);
            while(rslistaTipo.next()){
                Categoria dados = new Categoria();  
                dados.setId(rslistaTipo.getInt("cod_tipotrans"));
                dados.setNome(rslistaTipo.getString("nome_tipo"));
                dados.setUser(rslistaTipo.getInt("cod_user"));
                Conteudo.add(dados);
            }
            rslistaTipo.close();
            conn.close();
        }
        catch(Exception e){
            System.out.print("listarTipo: ERRO");
            System.out.print(e.getMessage());
        }
        return Conteudo;
    }
}
