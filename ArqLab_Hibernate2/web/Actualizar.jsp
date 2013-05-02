<%-- 
    Document   : Actualizar.jsp
    Created on : 2/05/2013, 05:54:25 PM
    Author     : sortiz
--%>
<%@page import="lab.arq.hb.pojos.*" %>
<%@page import="lab.arq.hb.controller.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Actualizar empresa </title>
    </head>
    <body>
        <%
            Empresas emp = new Empresas();
            EmpresasController empController = new EmpresasController();
            emp = empController.updateEmpresa(request.getParameter("emp_rut"),
                    request.getParameter("emp_nombre"));
            if ( emp != null) {
                out.println("<h1>Creada empresa con datos</h1>");
                out.println("<table border=10 cellpading=5><tr>");
                out.println("<td>RUT</td><td>Nombre</td><td>Dirección</td></tr>");
                out.println("<tr>");
                out.println("<td>" + emp.getRut() + "</td>");
                out.println("<td>" + emp.getNombre() + "</td>");
                out.println("<td>" + emp.getDireccion() + "</td>");
                out.println("</tr>");
                out.println("</table>");
            } else {
                out.println("<h1>No se ha podido modificar la empresa con rut" + request.getParameter("emp_rut") + " </h1>");
            }
        %>
    </body>
</html>
