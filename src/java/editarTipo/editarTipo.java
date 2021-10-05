package editarTipo;

import Conexao.Conexao;
import Model.Categoria;
import java.io.*;
import static java.lang.System.out;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.http.*;

public class editarTipo extends HttpServlet {
    
    public ArrayList<Categoria> listar(String Id){
        
        ArrayList<Categoria> Conteudo = new ArrayList<Categoria>();
        
        try{
            String sqllistaTipo = "SELECT * FROM tipo_trans WHERE cod_tipotrans = " + Id;
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
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        try{            
            String Id = request.getParameter("txt_id");
            String Nome = request.getParameter("txt_categoria");
            String User = request.getParameter("txt_user");            

            String sqlUpdate = "UPDATE tipo_trans SET nome_tipo = '" + Nome + "', cod_user = " + User + " WHERE cod_tipotrans = " + Id;

            Connection con = Conexao.Conectar();
            Statement stInsert = con.prepareStatement(sqlUpdate);
            stInsert.execute(sqlUpdate);
            response.sendRedirect("restrito/categorias_user.jsp");
        }

        catch(SQLException e){
            out.print("Erro na alteração da categoria" + e);
        }              
    }
}