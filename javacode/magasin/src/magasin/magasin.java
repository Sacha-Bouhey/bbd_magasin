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
        
        magasin.Connexion("jdbc:mysql://localhost/magasin", "s.bouhey", "@123+aze$");
        ArrayList<Object[]> fournisseurs = magasin.bddFournisseurLister();
        
        tableMaker(fournisseurs);
        tableMaker(magasin.bddProduitSommeMagasin());
        
        }
    
    public static void tableMaker(ArrayList<Object[]> sqlResult) {
            StringBuilder table = new StringBuilder();
            for (Object[] row : sqlResult) {
                for (Object column : row) {
                    table.append(column).append("\t");
                }
                table.append("\n");
            }
        
        System.out.println(table.toString());
        
    }
    
}
