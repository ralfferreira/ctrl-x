package cadTipo;

import Conexao.Conexao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class cadTipo extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        try{
            String Descricao = request.getParameter("txt_categoria");
            String ID = request.getParameter("txt_user");
            
            String sqlInsert = 
            "INSERT INTO tipo_trans (nome_tipo, cod_user) "
            + "VALUES('" + Descricao + "'," + ID + ")";

            Connection con = Conexao.Conectar();
            Statement stInsert = con.prepareStatement(sqlInsert);
            stInsert.execute(sqlInsert);            
            response.sendRedirect("restrito/categorias_user.jsp");
        }
        catch(SQLException e){
            out.print("Erro no cadastro de tipo de transação" + e);
        }
    }
}
