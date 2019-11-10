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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Saluda humano</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form>
                        <div class="form-group">
                            <label >Humano escribe tu nombre</label>
                            <input type="text" class="form-control" name="nombreDelHumano" placeholder="Nombre">
                        </div>
                        <div class="form-group">
                            <label >Ahora humano escribe cuantos ciclos humanoides tines(edad)</label>
                            <input type="text" class="form-control" name="edadDelHumano" placeholder="Nombre">
                        </div>
                        <button type="submit" class="btn btn-primary">Envar</button>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-sm">
                    <div class="alert alert-primary" role="alert">
                        <%
                            String nombre=request.getParameter("nombreDelHumano");
                            String edad=request.getParameter("edadDelHumano");
                            String saludarAlHumano="Hola "+nombre+" a tus "+edad+" años ya esta viejo";
                            out.print(saludarAlHumano);
                        %>
                    </div>
                </div>

            </div>
        </div>
    </body>
</html>
