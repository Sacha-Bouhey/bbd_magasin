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
        BDDmagasin magasin = new BDDmagasin();
        
        magasin.Connexion("jdbc:mysql://localhost/magasin", "root", "@123+aze$");
        Object tableau = magasin.bddFournisseurLister();
    }
    
}
