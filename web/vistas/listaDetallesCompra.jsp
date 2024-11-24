<%-- 
    Document   : listaDetallesCompra
    Created on : 9 nov 2024, 11:17:41 p. m.
    Author     : macma
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.DetalleCompras"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.DetalleComprasDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Lista de Detalles de Compra</title>
    <%
            if (session == null || session.getAttribute("usuario") == null) {
                response.sendRedirect("../index.jsp");
                return;
            }
        %>
</head>
<body>
    <div class="container">
        <h2 class="my-4">Lista de Detalles de Compra</h2>
        <a class="btn btn-success mb-3" href="ControladorDetallesCompra?accion=add">Agregar Nuevo Detalle de Compra</a>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th class="text-center">ID DETALLE</th>
                    <th class="text-center">CANTIDAD</th>
                    <th class="text-center">PRECIO</th>
                    <th class="text-center">ID COMPRA</th>
                    <th class="text-center">ID PRODUCTO</th>
                    <th class="text-center">ACCIONES</th>
                </tr>
            </thead>
            <%
                DetalleComprasDAO dao = new DetalleComprasDAO();
                List<DetalleCompras> list = dao.listar();
                Iterator<DetalleCompras> iter = list.iterator();
                while (iter.hasNext()) {
                    DetalleCompras detalle = iter.next();
            %>
            <tbody>
                <tr>
                    <td class="text-center"><%= detalle.getIdDetalleCompra() %></td>
                    <td class="text-center"><%= detalle.getCantidad() %></td>
                    <td class="text-center"><%= detalle.getPrecio() %></td>
                    <td class="text-center"><%= detalle.getIdCompra() %></td>
                    <td class="text-center"><%= detalle.getIdProducto() %></td>
                    <td class="text-center">
                        <a class="btn btn-warning" href="ControladorDetallesCompra?accion=editar&id=<%= detalle.getIdDetalleCompra() %>">Editar</a>
                        <a class="btn btn-danger" href="ControladorDetallesCompra?accion=eliminar&id=<%= detalle.getIdDetalleCompra() %>">Eliminar</a>
                    </td>
                </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
