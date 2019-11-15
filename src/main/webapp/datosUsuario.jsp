<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Usuario</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">

                    <form>
                        <div class="form-group">
                            <label >User</label>
                            <input type="text" class="form-control" name="user" placeholder="user">
                        </div>
                        <div class="form-group">
                            <label >Password</label>
                            <input type="text" class="form-control" name="password1" placeholder="password">
                        </div>
                        <div class="form-group">
                            <label >Respita su password</label>
                            <input type="text" class="form-control" name="password2" placeholder="Repita su password">
                        </div>
                        <button type="submit" name="guardar" class="btn btn-primary">Guardar</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
