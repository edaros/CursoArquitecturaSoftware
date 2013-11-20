/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import ejb.ManufacturerEJB;
import entity.Manufacturer;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.netbeans.saas.RestResponse;
import org.netbeans.saas.google.GoogleMapService;

/**
 *
 * @author sortiz
 */
public class ManufacturerServlet extends HttpServlet {

    @EJB
    private ManufacturerEJB manufacturerEJB;

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            List<Manufacturer> list;
            list = manufacturerEJB.findAll();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManufacturerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            Iterator<Manufacturer> it = list.iterator();
            while (it.hasNext()) {
                Manufacturer m = it.next();
                out.println("<b>ID</b>");
                out.println(m.getManufacturerId());
                out.println("<b>Nombre</b>");
                out.println(m.getName());
                out.println("<br>");
            }

            try {
                String address = "16 Network Circle, Menlo Park";
                java.lang.Integer zoom = 15;
                String iframe = "false";

                RestResponse result = GoogleMapService.getGoogleMap(address, zoom, iframe);
                //TODO - Uncomment the print Statement below to print result.
                out.println("The SaasService returned: "+result.getDataAsString());
            } catch (Exception ex) {
                ex.printStackTrace();
            }

            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
