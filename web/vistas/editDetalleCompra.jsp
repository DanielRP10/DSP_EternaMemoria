<%-- 
    Document   : editDetalleCompra
    Created on : 9 nov 2024, 11:17:18 p. m.
    Author     : macma
--%>

<%@page import="Modelo.DetalleCompras"%>
<%@page import="ModeloDAO.DetalleComprasDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Editar Detalle de Compra</title>
</head>
<body>
    <div class="container">
        <h2 class="my-4">Editar Detalle de Compra</h2>
        <%
            DetalleComprasDAO dao = new DetalleComprasDAO();
            int id = Integer.parseInt((String) request.getAttribute("iddetallecompra"));
            DetalleCompras detalle = dao.list(id);
        %>
        <form action="ControladorDetallesCompra" method="post">
            Cantidad:<br>
            <input class="form-control" type="number" name="txtCantidad" value="<%= detalle.getCantidad() %>" required><br>
            Precio:<br>
            <input class="form-control" type="number" step="0.01" name="txtPrecio" value="<%= detalle.getPrecio() %>" required><br>
            ID Compra:<br>
            <input class="form-control" type="number" name="txtIdCompra" value="<%= detalle.getIdCompra() %>" required><br>
            ID Producto:<br>
            <input class="form-control" type="number" name="txtIdProducto" value="<%= detalle.getIdProducto() %>" required><br>
            <input type="hidden" name="txtid" value="<%= detalle.getIdDetalleCompra() %>">
            <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"> 
            <a class="btn btn-secondary" href="ControladorDetallesCompra?accion=listar">Cancelar</a>
        </form>
    </div>
</body>
</html>
