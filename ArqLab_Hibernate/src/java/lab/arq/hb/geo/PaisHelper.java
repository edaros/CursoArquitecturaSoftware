/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lab.arq.hb.geo;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author sortiz
 */
public class PaisHelper {
     Session session = null;

 public PaisHelper() {
  this.session = GeoHbUtil.getSessionFactory().getCurrentSession();
  //this.session.u
 }
 
 public List getPNombre(int startID, int endID) {
  List<Pais> paisList = null;
  try {
   org.hibernate.Transaction tx = session.beginTransaction();
   Query q = session.createQuery("from Pais as pais where cast(pais.PId as int) between '" + startID + "' and '" + endID + "'");
   paisList = (List<Pais>) q.list();
   tx.commit();
  } catch (Exception e) {
   e.printStackTrace();
  }
  return paisList;
 }

 // Obtiene los actores en un film particular
 public List getCiudadByID(int PId) {
  List<Ciudad> ciudadList = null;
  try {
   org.hibernate.Transaction tx = session.beginTransaction();

    Query q = session.createQuery("from Ciudad as ciudad where ciudad.pais in (select pais.PId from Pais as pais where pais.PId='" + PId + "')");
   ciudadList = (List<Ciudad>) q.list();

  } catch (Exception e) {
   e.printStackTrace();
  }

  return ciudadList;
 }
 
 
 //Métodos para no poner código java en el JSPX
 int startId;
 int endId;

 int PId;

 public void setAttributeStartID(int startId){
  this.startId = startId;
 }
 public void setAttributeEndID(int endId){
  this.endId = endId;
 }
 public List getPNombreList(){
  return getPNombre(startId,endId);
 }
 public void setAttributeCiudadByID(int PId){
  this.PId = PId;
 }
 public List getCiudadByID() {
  return getCiudadByID(PId);
 }
    
}
