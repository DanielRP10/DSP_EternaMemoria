<%-- 
    Document   : addDetalleCompra
    Created on : 9 nov 2024, 11:16:54 p. m.
    Author     : macma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Agregar Detalle de Compra</title>
    <%
            if (session == null || session.getAttribute("usuario") == null) {
                response.sendRedirect("../index.jsp");
                return;
            }
        %>
</head>
<body>
    <div class="container">
        <h2 class="my-4">Agregar Nuevo Detalle de Compra</h2>
        <form action="ControladorDetallesCompra" method="post">
            Cantidad:<br>
            <input class="form-control" type="number" name="txtCantidad" required><br>
            Precio:<br>
            <input class="form-control" type="number" step="0.01" name="txtPrecio" required><br>
            ID Compra:<br>
            <input class="form-control" type="number" name="txtIdCompra" required><br>
            ID Producto:<br>
            <input class="form-control" type="number" name="txtIdProducto" required><br>
            <input class="btn btn-primary" type="submit" name="accion" value="Agregar"> 
            <a class="btn btn-secondary" href="ControladorDetallesCompra?accion=listar">Cancelar</a>
        </form>
    </div>
</body>
</html>
