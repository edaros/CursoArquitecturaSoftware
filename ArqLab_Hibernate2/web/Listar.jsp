<%-- 
    Document   : Listar
    Created on : 2/05/2013, 04:50:27 PM
    Author     : sortiz
--%>

<%@page import="lab.arq.hb.pojos.*" %>
<%@page import="lab.arq.hb.controller.*" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Empresas</title>
    </head>
    <body>
        <h1>Listado de Empresas</h1>
        <%
            EmpresasController empController = new EmpresasController();
            List<Empresas> empList = empController.getEmpresas();
            Iterator<Empresas> empIt = empList.iterator();
            out.println("<table border=10 cellpading=5><tr>");
            out.println("<td>RUT</td><td>Nombre</td><td>Dirección</td></tr>");
            while(empIt.hasNext()){
                Empresas e = empIt.next();
                out.println("<tr>");
                out.println("<td>" + e.getRut() + "</td>");
                out.println("<td>" + e.getNombre() + "</td>");
                out.println("<td>" + e.getDireccion()+ "</td>");
                out.println("</tr>");
            }
            out.println("</table>");
            %>
    </body>
</html>
