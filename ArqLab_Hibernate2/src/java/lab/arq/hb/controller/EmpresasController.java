/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lab.arq.hb.controller;

import java.util.List;
import lab.arq.hb.pojos.Empresas;
import org.hibernate.Session;
import lab.arq.hb.utils.LabHbUtils;
import org.hibernate.Query;
import org.hibernate.Transaction;

/**
 *
 * @author sortiz
 */
public class EmpresasController {

    private Session session = null;

    public EmpresasController() {
        this.session = LabHbUtils.getSessionFactory().getCurrentSession();
    }

    public List<Empresas> getEmpresas() {
        this.session = LabHbUtils.getSessionFactory().getCurrentSession();
        Transaction tx = this.session.beginTransaction();
        Query queryEmpresas = this.session.createQuery("from Empresas as empresas");
        return (List<Empresas>) queryEmpresas.list();
    }

    public Empresas saveEmpresa(Empresas emp) {

        try {
            this.session = LabHbUtils.getSessionFactory().getCurrentSession();
            this.session.beginTransaction();
            this.session.save(emp);
            this.session.getTransaction().commit();
            return emp;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public Empresas updateEmpresa(String rut, String newNombre) {

        try {
            this.session = LabHbUtils.getSessionFactory().getCurrentSession();
            this.session.beginTransaction();
            Empresas emp = null;
            Query queryRut = this.session.createQuery("from Empresas as empresa where empresa.rut = '" + rut + "'");
            if (queryRut.list().size() == 1) {
                emp = (Empresas) queryRut.list().get(0);
                emp.setNombre(newNombre);
                this.session.update(emp);
                this.session.getTransaction().commit();
                return emp;
            }else{
                return null;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }
    
    public boolean removeEmpresa(String rut){
        try {
            this.session = LabHbUtils.getSessionFactory().getCurrentSession();
            this.session.beginTransaction();
            Empresas emp = null;
            Query queryRut = this.session.createQuery("from Empresas as empresa where empresa.rut = '" + rut + "'");
            if (queryRut.list().size() == 1) {
                emp = (Empresas) queryRut.list().get(0);                
                this.session.delete(emp);
                this.session.getTransaction().commit();
                return true;
            }else{
                return false;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }
}
