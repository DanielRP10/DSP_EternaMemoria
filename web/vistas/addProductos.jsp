<%-- 
    Document   : addProductos
    Created on : 9 nov 2024, 11:06:22 p. m.
    Author     : macma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Agregar Producto</title>
    <%
            if (session == null || session.getAttribute("usuario") == null) {
                response.sendRedirect("../index.jsp");
                return;
            }
        %>
</head>
<body>
    <div class="container">
        <h1>Agregar Producto</h1>
        <form action="ControladorProductos">
            Nombre:<br>
            <input class="form-control" type="text" name="txtNombre"><br>
            Precio:<br>
            <input class="form-control" type="number" name="txtPrecio" step="0.01"><br>
            Descripción:<br>
            <textarea class="form-control" name="txtDescripcion"></textarea><br>
            ID Inventario:<br>
            <input class="form-control" type="text" name="txtIdInventario"><br>
            <input class="btn btn-primary" type="submit" name="accion" value="Agregar">
            <a class="btn btn-primary" href="ControladorProductos?accion=listar">Regresar</a>
        </form>
    </div>
</body>
</html>
