package excluirTipo;

import Conexao.Conexao;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class excluirTipo extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            PrintWriter out = response.getWriter();
            
            try{
                String cod_tipotrans = request.getParameter("cod_tipotrans");
                
                String sqlExcluir = "DELETE from tipo_trans WHERE cod_tipotrans = " + cod_tipotrans;
                
                Connection Conn = Conexao.Conectar(); 
                Statement stExcluir = Conn.prepareStatement(sqlExcluir);
                stExcluir.execute(sqlExcluir);
                response.sendRedirect("restrito/categorias_user.jsp");
            }
            catch(SQLException e) {
                out.print("Erro ao excluir os dados no banco: " + e);
            }
            
    }
}