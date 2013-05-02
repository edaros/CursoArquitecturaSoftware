<%-- 
    Document   : Insertar
    Created on : 2/05/2013, 05:11:45 PM
    Author     : sortiz
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insertar Empresa</title>
    </head>
    <body>
        <h1>Insertar Empresa</h1>
        <form action="Crear.jsp" method="post">
            <ul><li>Nombre:<input type="text" name="emp_nombre"/></li>
            <li>RUT:<input type="text" name="emp_rut"/></li>
            <li>Dirección:<input type="text" name="emp_direccion "/></li>
            </ul>
            <input type="submit" value="Guardar"/>
        </form>
    </body>
</html>
