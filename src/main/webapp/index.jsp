<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Lista de empleados</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("login.jsp");
            }
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
        %>
        <div class="container">
            <nav class="navbar navbar-light bg-light">
                <a class="navbar-brand">Programador novato</a>
                <form class="form-inline" action="logout.jsp">
                    <a><i class="fa fa-user-circle" aria-hidden="true"></i> <%= sesion.getAttribute("user")%></a>
                    <button class="btn btn-outline-danger my-2 my-sm-0 ml-2" type="submit">Log out</button>
                </form>
            </nav>
            <div class="row mt-2">
                <div class="col-sm">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col" colspan="4" class="text-center"><h3>Empleados</h3></th>
                                <th scope="col" >
                                    <a href="crear.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i></a>
                                </th>

                            </tr>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Direccion</th>
                                <th scope="col">Telefono</th>
                                <th scope="col">Acciones</th>
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
                                <td>
                                    <a href="editar.jsp?id=<%= rs.getString(1)%>&nombre=<%= rs.getString(2)%>&direccion=<%= rs.getString(3)%>&telefono=<%= rs.getString(4)%>"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                    <a href="borrar.jsp?id=<%= rs.getString(1)%>" class="ml-1"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                </td>
                            </tr>                                    
                            <%
                                    }
                                } catch (Exception e) {
                                    out.print("error mysql " + e);
                                }

                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
