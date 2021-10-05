package excluirTrans;

import Conexao.Conexao;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class excluirTrans extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            PrintWriter out = response.getWriter();
            
            try{
                String cod_trans = request.getParameter("cod_trans");
                
                String sqlExcluir = "DELETE from transacao WHERE cod_trans = " + cod_trans;
                
                Connection Conn = Conexao.Conectar(); 
                Statement stExcluir = Conn.prepareStatement(sqlExcluir);
                stExcluir.execute(sqlExcluir);
                response.sendRedirect("restrito/transacoes_user.jsp");
            }
            catch(SQLException e) {
                out.print("Erro ao excluir os dados no banco: " + e);
            }
            
    }
}