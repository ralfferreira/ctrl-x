package excluirUser;

import Conexao.Conexao;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class excluirUser extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            PrintWriter out = response.getWriter();
            
            try{
                int id1 = Integer.parseInt(request.getParameter("Id"));
                
                String sqlExcluir = "DELETE from usuario WHERE cod_user = " + id1;
                
                Connection Conn = Conexao.Conectar(); 
                Statement stExcluir = Conn.prepareStatement(sqlExcluir);
                stExcluir.execute(sqlExcluir);
                response.sendRedirect("restrito/consultas_admin.jsp");
            }
            catch(SQLException e) {
                out.print("Erro ao excluir os dados no banco: " + e);
            }
            
    }
}