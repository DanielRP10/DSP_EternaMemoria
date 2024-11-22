<%-- 
    Document   : listaProductos
    Created on : 9 nov 2024, 11:07:16 p. m.
    Author     : macma
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Productos"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.ProductosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <title>Lista de Productos</title>
        <%
            if (session == null || session.getAttribute("usuario") == null) {
                response.sendRedirect("../index.jsp");
                return;
            }
        %>
    </head>
    <body>
        <div class="wrapper">
            <div class="main-content">
                <header class="header">
                    <h5 class="mb-0">Lista de Productos</h5>
                </header>
                <div class="content">
                    <div class="container-fluid">
                        <a class="btn btn-success" href="ControladorProductos?accion=add">Agregar Nuevo Producto</a>
                        <br><br>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th class="text-center">ID PRODUCTO</th>
                                    <th class="text-center">NOMBRE</th>
                                    <th class="text-center">PRECIO</th>
                                    <th class="text-center">DESCRIPCIÓN</th>
                                    <th class="text-center">ID INVENTARIO</th>
                                    <th class="text-center">ACCIONES</th>
                                </tr>
                            </thead>
                            <%
                                ProductosDAO dao = new ProductosDAO();
                                List<Productos> list = dao.listar();
                                Iterator<Productos> iter = list.iterator();
                                while (iter.hasNext()) {
                                    Productos producto = iter.next();
                            %>
                            <tbody>
                                <tr>
                                    <td class="text-center"><%= producto.getIdProducto() %></td>
                                    <td class="text-center"><%= producto.getNombre() %></td>
                                    <td class="text-center"><%= producto.getPrecio() %></td>
                                    <td><%= producto.getDescripcion() %></td>
                                    <td class="text-center"><%= producto.getIdInventario() %></td>
                                    <td class="text-center">
                                        <a class="btn btn-warning" href="ControladorProductos?accion=editar&id=<%= producto.getIdProducto() %>">Editar</a>
                                        <a class="btn btn-danger" href="ControladorProductos?accion=eliminar&id=<%= producto.getIdProducto() %>">Eliminar</a>
                                    </td>
                                </tr>
                            <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
