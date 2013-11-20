/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entity.TasaInteres;
import javax.ejb.Stateless;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.ws.rs.*;

/**
 *
 * @author sortiz
 */
@Stateless
public class InteresCalculatorEJB {
    
    @PersistenceUnit
    private EntityManagerFactory emf;
    
    
    public String calcularCredito(int valor_pestamo, int tiempo_prestamo, String tipo_credito) {
        TasaInteres ts;
        ts = (TasaInteres) emf.createEntityManager().createNamedQuery("TasaInteres.findByNombreLinea")
    .setParameter("nombreLinea", tipo_credito).getSingleResult();
        
        if (ts==null){
            return "-1";
        }
        return this.calcularValorCouta(Double.parseDouble(ts.getTasaInteres().toString()), tiempo_prestamo, valor_pestamo);
    }

    private String calcularValorCouta(double interes, int plazo, int valor){
           return Double.toString(valor * Math.pow(1 + interes, plazo)) ;
    }

}
