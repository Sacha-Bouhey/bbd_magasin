/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package magasin;

/**
 *
 * @author s.bouhey
 */
public class BDDmagasin extends BDD{
        
    public BDDmagasin() {
    }

    public Object bddFournisseurLister() {
        String requete = "SELECT nom FROM fournisseur;";
        RequeteSQL(requete);
        return transformResult(getResultSet());
    }
    
}

