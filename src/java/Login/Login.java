package Login;

import Conexao.Conexao;
import Senha.Senha;

import java.io.*;
import java.security.NoSuchAlgorithmException;
import javax.servlet.http.*;
import javax.servlet.ServletException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Login extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try{
            Connection con = Conexao.Conectar();
            response.setContentType("text/html; charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            
            HttpSession session = request.getSession();
            
            String email = request.getParameter("txt_email");
            String senha = request.getParameter("txt_senha");
            
            String passMD5 = Senha.passMD5(senha);
            
            String passSHA512 = Senha.passSHA512(passMD5);

            String sqlLogin = "SELECT * FROM usuario WHERE email_user = '" + email + "' AND senha_user = '" + passSHA512 + "'";

            Statement stLogin = con.createStatement();
            ResultSet rsLogin = stLogin.executeQuery(sqlLogin);

            if(rsLogin.next()){
                if(rsLogin.getString("email_user").equals("rcs.team@codnet.com")){
                    session.setAttribute("erro",3);
                    session.setAttribute("logado",true);
                    session.setAttribute("nome",rsLogin.getString("nome_user"));
                    session.setAttribute("id",rsLogin.getInt("cod_user"));
                    response.sendRedirect("restrito/restrito_admin.jsp");            
                } 
                else {                
                    session.setAttribute("erro",0);
                    session.setAttribute("logado",true);
                    session.setAttribute("nome",rsLogin.getString("nome_user"));
                    session.setAttribute("id",rsLogin.getInt("cod_user"));
                    response.sendRedirect("restrito/restrito_user.jsp");
                }
            }
            else{
                session.setAttribute("erro",1);
                session.setAttribute("logado",false);
                response.sendRedirect("login.jsp");
            }            
        }
        catch(SQLException e){
            out.println("Erro na conexao: " + e);
        } 
        catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Integer LogarAposCad(String email, String senha) throws SQLException, NoSuchAlgorithmException{
        
        Connection con = Conexao.Conectar();

        String passMD5 = Senha.passMD5(senha);
        String passSHA512 = Senha.passSHA512(passMD5);

        String sqlLogin = "SELECT * FROM usuario WHERE email_user = '" + email + "' AND senha_user = '" + passSHA512 + "'";

        Statement stLogin = con.createStatement();
        ResultSet rsLogin = stLogin.executeQuery(sqlLogin);

        if(rsLogin.next()){
            Integer cod_user = rsLogin.getInt("cod_user");
            return cod_user;
        }
        else{
            Integer erro = 0;
            return erro;
        }
    }
}