<%-- 
    Document   : editProductos
    Created on : 9 nov 2024, 11:06:54 p. m.
    Author     : macma
--%>

<%@page import="Modelo.Productos"%>
<%@page import="ModeloDAO.ProductosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <title>Editar Producto</title>
    </head>
    <body>
        <div class="wrapper">
            <div class="main-content">
                <header class="header">
                    <h5 class="mb-0">Editar Producto</h5>
                </header>
                <div class="content">
                    <div class="container-fluid">
                        <%
                            ProductosDAO dao = new ProductosDAO();
                            int id = Integer.parseInt((String) request.getAttribute("idProducto"));
                            Productos producto = dao.list(id);
                        %>
                        <form action="ControladorProductos">
                            Nombre:<br>
                            <input class="form-control" type="text" name="txtNombre" value="<%= producto.getNombre() %>"><br>
                            Precio: <br>
                            <input class="form-control" type="number" name="txtPrecio" step="0.01" value="<%= producto.getPrecio() %>"><br>
                            Descripción: <br>
                            <input class="form-control" type="text" name="txtDescripcion" value="<%= producto.getDescripcion() %>"><br>
                            ID Inventario: <br>
                            <input class="form-control" type="text" name="txtIdInventario" value="<%= producto.getIdInventario() %>"><br>
                            <input type="hidden" name="txtIdProducto" value="<%= producto.getIdProducto() %>">
                            <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"> 
                            <a class="btn btn-secondary" href="ControladorProductos?accion=listar">Regresar</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
