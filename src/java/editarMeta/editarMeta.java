package editarMeta;

import Conexao.Conexao;
import Model.Meta;
import java.io.*;
import static java.lang.System.out;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.http.*;

public class editarMeta extends HttpServlet {

    public ArrayList<Meta> listar(Integer Id){
        
        ArrayList<Meta> Conteudo = new ArrayList<Meta>();
        
        try{
            String sqllistaMeta = "SELECT * FROM meta WHERE cod_meta = " + Id;
            Connection conn = Conexao.Conectar();
            Statement stlistaMeta = conn.createStatement();
            ResultSet rslistaMeta = stlistaMeta.executeQuery(sqllistaMeta);
            while(rslistaMeta.next()){
                Meta dados = new Meta();  
                dados.setId(rslistaMeta.getInt("cod_meta"));
                dados.setDescricao(rslistaMeta.getString("desc_meta"));
                dados.setDt_Inicio(rslistaMeta.getDate("data_inicio"));
                dados.setDt_Termino(rslistaMeta.getDate("data_limite"));
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
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        try{            
            String Descricao = request.getParameter("txt_desc");
            String Dt_ini = request.getParameter("txt_data_inicio");
            String Dt_fim = request.getParameter("txt_data_limite");
            String Valor = request.getParameter("txt_valor");
            String Tipo = request.getParameter("txt_categoria");
            String Id = request.getParameter("txt_id");

            String sqlUpdate = 
                "UPDATE meta "
                + "SET desc_meta = '" + Descricao + "', data_inicio = '" + Dt_ini + "', data_limite = '" + Dt_fim + "', valor_meta = " + Valor + ", cod_tipotrans = " + Tipo + " WHERE cod_meta = " + Id;

            Connection con = Conexao.Conectar();
            Statement stInsert = con.prepareStatement(sqlUpdate);
            stInsert.execute(sqlUpdate);
            response.sendRedirect("restrito/objetivos_user.jsp");
        }

        catch(SQLException e){
            out.print("Erro na alteração da meta" + e);
        }              
    }
}