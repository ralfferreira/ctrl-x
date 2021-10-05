package cadUser;

import Conexao.Conexao;
import Login.Login;
import Senha.Senha;
import java.security.NoSuchAlgorithmException;
import java.util.logging.*;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class cadUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        try{
            String CPF = request.getParameter("txt_cpf");
            String Nome = request.getParameter("txt_nome");
            String Email = request.getParameter("txt_email");
            String senha1 = request.getParameter("txt_senha");

            String passMD5 = Senha.passMD5(senha1);
            String passSHA512 = Senha.passSHA512(passMD5);

            String sqlInsert = "INSERT INTO usuario (nome_user, email_user, cpf_user, senha_user) VALUES('" + Nome + "','" + Email + "','" + CPF + "','" + passSHA512 + "')";

            Connection con = Conexao.Conectar();
            Statement stInsert = con.prepareStatement(sqlInsert);
            stInsert.execute(sqlInsert);

            Login login = new Login();

            Integer Result = login.LogarAposCad(Email, senha1);

            if(Result.equals(0)){
                response.sendRedirect("index.jsp");
            }
            else{                                                
                request.getSession().setAttribute("logado", true);
                request.getSession().setAttribute("nome", Nome);
                request.getSession().setAttribute("email", Email);
                request.getSession().setAttribute("id", Result);
                response.sendRedirect("restrito/restrito_user.jsp");
            }                    
        }

        catch(SQLException e){
            out.print("Erro no cadastro do cliente" + e);
        }      
        catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(cadUser.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}