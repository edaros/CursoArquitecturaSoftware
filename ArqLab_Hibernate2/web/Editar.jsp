<%-- 
    Document   : Editar
    Created on : 2/05/2013, 05:44:07 PM
    Author     : sortiz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Empresa</title>
    </head>
    <body>
        <h1>Editar empresa</h1>
    </body><form name="editar" action="Actualizar.jsp" method="POST">
        <table border="1">
            <thead>
                <tr>
                    <th>Rut</th>
                    <th>Nombre</th>
                </tr>
            </thead>
            <tbody>               
                <tr>
                    <td><input type="text" name="emp_rut"/></td>
                    <td><input type="text" name="emp_nombre"/></td>
                </tr>
            </tbody>
        </table>
        <input type="submit" value="Actualizar"/>
    </form>
</html>
