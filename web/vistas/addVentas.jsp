<%-- 
    Document   : addVentas
    Created on : 31 oct 2024, 13:07:52
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
                <h1>Agregar Venta</h1>
                <form action="ControladorVentas">
                    Fecha:<br>
                    <input class="form-control" type="date" name="txtFecha"><br>
                    Monto: <br>
                    <input class="form-control" type="number" name="txtMonto" step="0.01"><br>
                    <input class="btn btn-primary" type="submit" name="accion" value="Agregar">
                    <a class="btn btn-primary" href="ControladorVentas?accion=listar">Regresar</a>
                </form>
            </div>

        </div>
    </body>
</html>
