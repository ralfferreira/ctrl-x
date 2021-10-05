package cadTrans;

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

public class cadTrans extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        try{
            String Descricao = request.getParameter("txt_notas");
            Double Valor = Double.parseDouble(request.getParameter("txt_valor"));
            String Data = request.getParameter("txt_data");
            String Tipo = request.getParameter("txt_tipo");
            String Categoria = (String) request.getParameter("txt_categoria");            
            String User = (String) request.getParameter("txt_user");
            
            String sqlInsert = 
            "INSERT INTO transacao (desc_trans, valor_trans, data_trans, tipo_trans, cod_tipotrans, cod_user) "
            + "VALUES('" + Descricao + "'," + Valor + ",'" + Data + "', '" + Tipo + "', " + Categoria + "," + User + ")";
            
            Connection con = Conexao.Conectar();
            Statement stInsert = con.prepareStatement(sqlInsert);
            stInsert.execute(sqlInsert);            
            response.sendRedirect("restrito/restrito_user.jsp");
        }
        catch(SQLException e){
            out.print("Erro no cadastro de transação " + e);
        }   
    }
}
