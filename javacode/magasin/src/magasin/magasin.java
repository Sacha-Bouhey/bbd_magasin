package magasin;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
/**
 *
 * @author s.bouhey
 */
public class magasin {

    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        BDD maBDD = new BDD();
        maBDD.Connexion("localhost", "root", "@123+aze$");
    }
    
}
