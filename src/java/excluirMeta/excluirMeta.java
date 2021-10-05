package excluirMeta;

import Conexao.Conexao;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class excluirMeta extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            PrintWriter out = response.getWriter();
            
            try{
                int id1 = Integer.parseInt(request.getParameter("cod_meta"));
                
                String sqlExcluir = "DELETE from meta WHERE cod_meta = " + id1;
                
                Connection Conn = Conexao.Conectar(); 
                Statement stExcluir = Conn.prepareStatement(sqlExcluir);
                stExcluir.execute(sqlExcluir);
                response.sendRedirect("restrito/objetivos_user.jsp");
            }
            catch(SQLException e) {
                out.print("Erro ao excluir os dados no banco: " + e);
            }
            
    }
}