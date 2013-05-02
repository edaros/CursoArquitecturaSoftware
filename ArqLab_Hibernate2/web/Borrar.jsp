<%-- 
    Document   : Borrar
    Created on : 2/05/2013, 06:12:05 PM
    Author     : sortiz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Empresa</title>
    </head>
    <body>
        <h1>Editar empresa</h1>
    <form name="eliminar" action="Eliminar.jsp" method="POST">
        <table border="1">
            <thead>
                <tr>
                    <th>Rut</th>
                </tr>
            </thead>
            <tbody>               
                <tr>
                    <td><input type="text" name="emp_rut"/></td>
                </tr>
            </tbody>
        </table>
        <input type="submit" value="Eliminar"/>
    </form>
    </body>
</html>
