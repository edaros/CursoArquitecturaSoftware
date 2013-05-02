<%-- 
    Document   : Crear
    Created on : 2/05/2013, 05:16:52 PM
    Author     : sortiz
--%>
<%@page import="lab.arq.hb.pojos.*" %>
<%@page import="lab.arq.hb.controller.*" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear empresa</title>
    </head>
    <body>
        <%
            Empresas emp = new Empresas();
            emp.setRut(request.getParameter("emp_rut"));           
            emp.setNombre(request.getParameter("emp_nombre"));
            emp.setDireccion(request.getParameter("emp_direccion"));
            EmpresasController empController = new EmpresasController();
            if (empController.saveEmpresa(emp) != null) {
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
                out.println("<h1>No se ha podido crear la empresa, mirar los logs</h1>");
            }
        %>
    </body>
</html>
