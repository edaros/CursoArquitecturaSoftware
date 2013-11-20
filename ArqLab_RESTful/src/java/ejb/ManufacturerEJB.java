/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;

/**
 *
 * @author sortiz
 */

@Stateless
public class ManufacturerEJB {
    
    @PersistenceUnit
    private EntityManagerFactory emf;
    

    public List findAll(){ 
        return emf.createEntityManager()
                .createNamedQuery("Manufacturer.findAll").getResultList();
    }

}
