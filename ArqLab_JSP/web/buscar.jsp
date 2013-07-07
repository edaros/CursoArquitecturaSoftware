
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
                    out.println("<p>SELECT * FROM mitabla WHERE clave='" + clave + "'</p>");
                    ResultSet buscar = instruccion.executeQuery("SELECT * FROM mitabla WHERE clave='" + clave + "'");

                    // mandando resultset a una tabla html
                    // y ciclo de lectura del resultset
                    if (buscar.next()) {
                        System.out.println(buscar.getString(1) + " : " + buscar.getString(2));
                        out.println("<TABLE Border=10 CellPadding=5><TR>");
                         out.println("<th bgcolor=Green>CLAVE</th><th bgcolor=White>NOMBRE</th><th bgcolor=Red>EDAD</th></TR>");
                         out.println("<TR>");
                        out.println("<TD>" + buscar.getString(1) + "</TD>");
                        out.println("<TD>" + buscar.getString(2) + "</TD>");
                        out.println("<TD>" + buscar.getString(3) + "</TD>");
                        out.println("</TR>");
                        out.println("</TABLE></CENTER></DIV></HTML>");
                    } else {

                        out.println("<h3>No se encuentra la clave " + clave + "</h3>");
                    }

                    // cerrando resultset;
                    buscar.close();
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
            out.println("<FORM ACTION=buscar.jsp METHOD=post>");
            out.println("<LABEL>clave:</LABEL>");
            out.println("<INPUT TYPE=text NAME=clave VALUE=''/>");
            out.println("<BR>");
            out.println("<INPUT TYPE=SUBMIT NAME=OK VALUE=BUSCAR><BR>");
            out.println("</FORM>");

        %>
    </body>
</html>
