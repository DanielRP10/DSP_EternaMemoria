<%-- 
    Document   : addVendedor
    Created on : 30 oct 2024, 10:51:25
    Author     : Jennifer Tatiana GF
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-6">
                <h1>Agregar Vendedor</h1>
                <form action="ControladorVendedores">
                    Nombre:<br>
                    <input class="form-control" type="text" name="txtNombre"><br>
                    Teléfono: <br>
                    <input class="form-control" type="text" name="txtTelefono"><br>
                    Correo:<br>
                    <input class="form-control" type="text" name="txtCorreo"><br>
                    DUI:<br>
                    <input class="form-control" type="text" name="txtDUI"><br>
                    <input class="btn btn-primary" type="submit" name="accion" value="Agregar">
                    <a class="btn btn-primary" href="ControladorVendedores?accion=listar">Regresar</a>
                </form>
            </div>

        </div>
    </body>
</html>
