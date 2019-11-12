<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Lista de empleados</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Direccion</th>
                                <th scope="col">Telefono</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {

                                    Class.forName("com.mysql.jdbc.Driver");
                                    con = DriverManager.getConnection("jdbc:mysql://localhost/jsp?user=eugenio&password=123456");
                                    st = con.createStatement();
                                    rs = st.executeQuery("SELECT * FROM `empledos`;");
                                    while (rs.next()) {
                            %>
                            <tr>
                                <th scope="row"><%= rs.getString(1)%></th>
                                <td><%= rs.getString(2)%></td>
                                <td><%= rs.getString(3)%></td>
                                <td><%= rs.getString(4)%></td>
                            </tr>                                    
                            <%
                                    }
                                } 
                                catch (Exception e) {
                                    out.print("error mysql "+e);
                                }

                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
