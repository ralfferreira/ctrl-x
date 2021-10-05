package cadMeta;

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

public class cadMeta extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        try{
            String Descricao = request.getParameter("txt_desc");
            String Dt_ini = request.getParameter("txt_data_inicio");
            String Dt_fim = request.getParameter("txt_data_limite");
            String Valor = (String) request.getParameter("txt_valor");
            String User = request.getParameter("txt_user");
            String Tipo = (String) request.getParameter("txt_tipo");            
            
            String sqlInsert = 
            "INSERT INTO meta (desc_meta, data_inicio, data_limite, valor_meta, cod_tipotrans, cod_user) "
            + "VALUES('" + Descricao + "', '" + Dt_ini + "', '" + Dt_fim + "', " + Valor + ", " + Tipo + ", " + User + ")";

            Connection con = Conexao.Conectar();
            Statement stInsert = con.prepareStatement(sqlInsert);
            stInsert.execute(sqlInsert);            
            response.sendRedirect("restrito/objetivos_user.jsp");
        }
        catch(SQLException e){
            out.print("Erro no cadastro de meta" + e);
        }
    }
}
