package listarUser;

import Model.User;
import Conexao.Conexao;

import java.sql.*;
import java.util.ArrayList;
import javax.servlet.http.*;

public class listarUser extends HttpServlet {

    public ArrayList<User> Listar(){
        
        ArrayList<User> Conteudo = new ArrayList<User>();
        
        try{
            String sqllistaCliente = "SELECT * FROM usuario";
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
            System.out.print("listarUser:ERRO");
            System.out.print(e.getMessage());
        }
        return Conteudo;
    }
}
