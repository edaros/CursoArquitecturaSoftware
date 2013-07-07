
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<html>
    <body>
        <%
            // declarando y creando objetos globales
            String user = "root";
            String pwd = "MYSQL";
            Connection canal = null;
            ResultSet tabla = null;
            Statement instruccion = null;
            String sitiobase = "jdbc:mysql://localhost:3306/mibase?" + "user=" + user + "&password=" + pwd;
            String strcon = "com.mysql.jdbc.Driver";
            // detectando y cargando el objeto submit de html
            if (request.getParameter("OK") != null) {
                // abriendo canal o enlace en su propio try-catch
                String clave = request.getParameter("clave");

                try {
                    Class.forName(strcon);
                    //instruccion=canal.createStatement();
                    canal = DriverManager.getConnection(sitiobase);
                    instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                            ResultSet.CONCUR_UPDATABLE);
                    //} catch(java.lang.ClassNotFoundException e){}
                    // catch(SQLException e) {};
                    //leyendo tabla en disco y pasandola al resultset
                    //try {
                    // empezando a construir una tabla html
                    out.println("DELETE FROM mitabla WHERE clave='" + clave + "'");
                    int borrar = instruccion.executeUpdate("DELETE FROM mitabla WHERE clave='" + clave + "'");

                    // mandando resultset a una tabla html
                    // y ciclo de lectura del resultset
                    if (borrar ==1 ) {
                         out.println("<h3>Se ha borrado al fila con clave" + clave + "</h3>");
                    } else {

                        out.println("<h3>No se encuentra la clave " + clave + "</h3>");
                    }
                    instruccion.close();
                    canal.close();
                } //fin try no usar ;
                catch (SQLException sqlEx) {
                    System.out.println("SQL Exception: " + sqlEx.toString());
                } catch (ClassNotFoundException classEx) {
                    System.out.println("Class Not Found Exception: "
                            + classEx.toString());
                } catch (Exception Ex) {
                    System.out.println("Exception: " + Ex.toString());
                }
            };
            // construyendo forma dinamica
            out.println("<FORM ACTION=borrar.jsp METHOD=post>");
            out.println("<LABEL>clave:</LABEL>");
            out.println("<INPUT TYPE=text NAME=clave VALUE=''/>");
            out.println("<BR>");
            out.println("<INPUT TYPE=SUBMIT NAME=OK VALUE=BORRAR><BR>");
            out.println("</FORM>");

        %>
    </body>
</html>
