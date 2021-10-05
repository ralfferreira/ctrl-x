package Conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
    
    public static Connection Conectar() throws SQLException{
        try{
            Class.forName("com.mysql.jdbc.Driver");            
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/db_ctrlx?serverTimezone=GMT", "root", "");
        }
        catch(ClassNotFoundException e){
            System.out.println("Erro ao conectar com o banco: " + e);
        }
        return null;
        
    }
    
}
