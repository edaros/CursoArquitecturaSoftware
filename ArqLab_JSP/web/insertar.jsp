
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
            if (request.getParameter("OK") !=null) {
                // abriendo canal o enlace en su propio try-catch
                String clave = request.getParameter("clave");
                String nombre = request.getParameter("nombre");
                String edad =  request.getParameter("edad");
                                
                
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
                    out.println("INSERT INTO mitabla VALUES('" + clave + "','" + nombre + "','" + edad + "')");
                    int insert = instruccion.executeUpdate("INSERT INTO mitabla VALUES('" + clave + "','" + nombre + "','" + edad + "')");
                    if(insert > 0){
                        out.println("<h3>Insert OK</h3>");
                    }
                    out.println("<TABLE Border=10 CellPadding=5><TR>");
                    out.println("<th bgcolor=Green>CLAVE</th><th bgcolor=White>NOMBRE</th><th bgcolor=Red>EDAD</th></TR>");
                    // mandando resultset a una tabla html
                    // y ciclo de lectura del resultset
                    tabla = instruccion.executeQuery("select * from mitabla");
                    while (tabla.next()) {
                        System.out.println(tabla.getString(1) + " : " + tabla.getString(2));
                        out.println("<TR>");
                        out.println("<TD>" + tabla.getString(1) + "</TD>");
                        out.println("<TD>" + tabla.getString(2) + "</TD>");
                        out.println("<TD>" + tabla.getString(3) + "</TD>");
                        out.println("</TR>");
                    }; // fin while
                    out.println("</TABLE></CENTER></DIV></HTML>");
                    // cerrando resultset;
                    tabla.close();
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
            try {
                Class.forName(strcon);
                //instruccion=canal.createStatement();
                canal = DriverManager.getConnection(sitiobase);
                instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_UPDATABLE);
                ResultSet currClave = instruccion.executeQuery("select max(clave) from mitabla");
                String currClaveVal = "0";
                if(currClave.next()){
                    currClaveVal = currClave.getString(1);
                }
                int nextClave = Integer.parseInt(currClaveVal) + 1;
                out.println("<FORM ACTION=insertar.jsp METHOD=post>");
                out.println("<LABEL>clave:</LABEL>");
                out.println("<INPUT TYPE=text NAME=clave VALUE=" + Integer.toString(nextClave) + " readonly/>");
                out.println("<BR>");
                out.println("<LABEL>nombre: </LABEL>");
                out.println("<INPUT TYPE=text NAME=nombre SIZE=50/>");
                out.println("<BR>");
                out.println("<LABEL>edad: </LABEL>");
                out.println("<INPUT TYPE=text NAME=edad SIZE=20/>");
                out.println("<BR>");
                out.println("<INPUT TYPE=SUBMIT NAME=OK VALUE=INSERTAR><BR>");
                out.println("</FORM>");
            } //fin try no usar ;
            catch (SQLException sqlEx) {
                System.out.println("SQL Exception: " + sqlEx.toString());
            } catch (ClassNotFoundException classEx) {
                System.out.println("Class Not Found Exception: "
                        + classEx.toString());
            } catch (Exception Ex) {
                System.out.println("Exception: " + Ex.toString());
            }
        %>
    </body>
</html>
