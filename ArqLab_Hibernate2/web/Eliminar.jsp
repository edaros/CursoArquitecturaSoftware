<%-- 
    Document   : Eliminar
    Created on : 2/05/2013, 06:17:51 PM
    Author     : sortiz
--%>
<%@page import="lab.arq.hb.pojos.*" %>
<%@page import="lab.arq.hb.controller.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Eliminar empresa </title>
    </head>
    <body>
        <%
            Empresas emp = new Empresas();
            EmpresasController empController = new EmpresasController();
            if(empController.removeEmpresa(request.getParameter("emp_rut"))){
                out.println("<h1>Eliminada empresa</h1>");
                out.println("<table border=10 cellpading=5><tr>");
                out.println("<td>RUT</td>");
                out.println("<tr>");
                out.println("<td>" + request.getParameter("emp_rut") + "</td>");
                out.println("</tr>");
                out.println("</table>");
            } else {
                out.println("<h1>No se ha podido eliminar la empresa con rut" + request.getParameter("emp_rut") + " </h1>");
            }
        %>
    </body>
</html>
