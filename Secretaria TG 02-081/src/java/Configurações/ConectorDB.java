package Configurações;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author felip
 */
public class ConectorDB {
    
    // O método agora INFORMA que pode lançar um SQLException
    public static Connection conectar() throws ClassNotFoundException, SQLException {
        
        //  Carrega o driver 
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        //  Tenta conectar e retorna a conexão.
        return DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/tg_02081",
                "root",
                ""
        );
        
    }
}
    

