/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package magasin;
import java.util.ArrayList;
/**
 *
 * @author s.bouhey
 */
public class BDDmagasin extends BDD{
        
    public BDDmagasin() {
    }

    public ArrayList<Object[]> bddFournisseurLister() {
        String requete = "SELECT nom FROM fournisseur;";
        RequeteSQL(requete);
        return transformResult(getResultSet());
    }
    
}

