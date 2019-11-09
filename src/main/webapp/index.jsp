<%-- 
    Document   : index
    Created on : 9/11/2019, 04:26:53 PM
    Author     : eugenio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            String nombreDelHumano="Eugenio";
            int edadDelHumano=30;
            String saludarAlHumano="Hola "+nombreDelHumano+" a tus "+edadDelHumano+" años ya estas viejo";
            out.println(saludarAlHumano);
        %>
    </body>
</html>
