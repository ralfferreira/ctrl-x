package editarTrans;

import Conexao.Conexao;
import Model.Transacao;
import java.io.*;
import static java.lang.System.out;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.http.*;

public class editarTrans extends HttpServlet {
    
    public ArrayList<Transacao> listar(String Id){
        
        ArrayList<Transacao> Conteudo = new ArrayList<Transacao>();
        
        try{
            String sqllistaTrans = "SELECT * FROM transacao WHERE cod_trans = " + Id;
            Connection conn = Conexao.Conectar();
            Statement stlistaTrans = conn.createStatement();
            ResultSet rslistaTrans = stlistaTrans.executeQuery(sqllistaTrans);
            while(rslistaTrans.next()){
                Transacao dados = new Transacao();                
                dados.setId(rslistaTrans.getInt("cod_trans"));
                dados.setDescricao(rslistaTrans.getString("desc_trans"));
                dados.setData(rslistaTrans.getDate("data_trans"));
                dados.setValor(rslistaTrans.getDouble("valor_trans"));
                dados.setTipo(rslistaTrans.getString("tipo_trans"));
                dados.setCategoria(rslistaTrans.getInt("cod_tipotrans"));
                dados.setUser(rslistaTrans.getInt("cod_user"));
                Conteudo.add(dados);
            }
            rslistaTrans.close();
            conn.close();
        }
        catch(Exception e){
            System.out.print("listarTrans: ERRO");
            System.out.print(e.getMessage());
        }
        return Conteudo;
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        try{            
            String Id = request.getParameter("txt_codtrans");
            String Descricao = request.getParameter("txt_notas");
            String Data = request.getParameter("txt_data");
            String Valor = request.getParameter("txt_valor");
            String Tipo = request.getParameter("txt_tipo");
            String Categoria = request.getParameter("txt_categoria");
            String User = request.getParameter("txt_user");

            String sqlUpdate = 
                    "UPDATE transacao SET desc_trans = '" + Descricao + "', data_trans = '" + Data + "', valor_trans = " + Valor + ", tipo_trans = '" + Tipo + "', cod_tipotrans = " + Categoria + ", cod_user = " + User + " WHERE cod_trans = " + Id;

            Connection con = Conexao.Conectar();
            Statement stInsert = con.prepareStatement(sqlUpdate);
            stInsert.execute(sqlUpdate);
            response.sendRedirect("restrito/transacoes_user.jsp");
        }

        catch(SQLException e){
            out.print("Erro na alteração da transação" + e);
        }              
    }
}