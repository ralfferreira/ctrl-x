package editarUser;

import Conexao.Conexao;
import Model.User;
import Senha.Senha;
import cadUser.cadUser;
import java.io.*;
import static java.lang.System.out;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

public class editarUser extends HttpServlet {
    
    public ArrayList<User> listar(Integer Id){
        
        ArrayList<User> Conteudo = new ArrayList<User>();
        
        try{
            String sqllistaCliente = "SELECT * FROM usuario WHERE cod_user =" + Id;
            Connection conn = Conexao.Conectar();
            Statement stlistaCliente = conn.createStatement();
            ResultSet rslistaCliente = stlistaCliente.executeQuery(sqllistaCliente);
            while(rslistaCliente.next()){
                User dados = new User();
                dados.setNome(rslistaCliente.getString("nome_user"));
                dados.setEmail(rslistaCliente.getString("email_user"));
                dados.setCPF(rslistaCliente.getString("cpf_user"));
                dados.setId(rslistaCliente.getInt("cod_user"));
                Conteudo.add(dados);
            }
            rslistaCliente.close();
            conn.close();
        }
        catch(Exception e){
            System.out.print("listarUser: ERRO");
            System.out.print(e.getMessage());
        }
        return Conteudo;
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        try{
            
            String Id = request.getParameter("txt_id");
            String CPF = request.getParameter("txt_cpf");
            String Nome = request.getParameter("txt_nome");
            String Email = request.getParameter("txt_email");
            String senha1 = request.getParameter("txt_senha");
            String sqlUpdate = new String();
            
            if(senha1.isEmpty()){
                sqlUpdate = 
                    "UPDATE usuario SET nome_user = '" + Nome + "', email_user = '" + Email + "', cpf_user = '" + CPF + "' WHERE cod_user = " + Id;
            }
            else{
                String passMD5 = Senha.passMD5(senha1);
                String passSHA512 = Senha.passSHA512(passMD5);

                sqlUpdate = 
                        "UPDATE usuario SET nome_user = '" + Nome + "', email_user = '" + Email + "', cpf_user = '" + CPF + "', senha_user = '" + passSHA512 + "' WHERE cod_user = " + Id;

            }

            Connection con = Conexao.Conectar();
            Statement stInsert = con.prepareStatement(sqlUpdate);
            stInsert.execute(sqlUpdate);
            response.sendRedirect("restrito/consultas_admin.jsp");
        }

        catch(SQLException e){
            out.print("Erro na alteração do cliente" + e);
        }      
        catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(cadUser.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}