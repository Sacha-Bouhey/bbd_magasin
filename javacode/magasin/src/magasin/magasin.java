package magasin;

import java.util.ArrayList;

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
        ArrayList<Object[]> fournisseurs = magasin.bddFournisseurLister();
        
        for(Object[] row  : fournisseurs) {
            for(Object column : row ){
                System.out.println(column);
            }
        }
    }
    
}
