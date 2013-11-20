/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import ejb.InteresCalculatorEJB;
import javax.ejb.EJB;
import javax.jws.WebService;
import javax.ejb.Stateless;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

/**
 *
 * @author sortiz
 */

@Stateless()
@Path("calculator")
public class InteresCalculatorTest {
    
    @EJB
    private InteresCalculatorEJB ejbRef;// Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Web Service Operation")
    

    @GET
    @Path("{valor_prestamo}/{tiempo_prestamo}/{tipo_credito}")
    @Produces({"application/xml", "application/json"})
    public String calcularCredito(@PathParam("valor_prestamo") int valor_pestamo, 
    @PathParam("tiempo_prestamo") int tiempo_prestamo, @PathParam("tipo_credito") String tipo_credito) {
        return ejbRef.calcularCredito(valor_pestamo, tiempo_prestamo, tipo_credito);
    }
    
}
