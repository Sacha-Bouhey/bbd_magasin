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
    
    public ArrayList<Object[]> bddProduitSommeMagasin() {
        String requete = "SELECT produit.nom, disposer.quantite as 'quantité en magasin', stocker.quantite as 'quantité en stock' FROM produit LEFT JOIN disposer ON produit.id = disposer.id_produit LEFT JOIN stocker ON produit.id = stocker.id_produit;";
        RequeteSQL(requete);
        return transformResult(getResultSet());
    }    
}

