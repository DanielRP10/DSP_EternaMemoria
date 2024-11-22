<%-- 
    Document   : listaCompras
    Created on : 9 nov 2024, 11:13:04 p. m.
    Author     : macma
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Compras"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.ComprasDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Lista de Compras</title>
    <%
            if (session == null || session.getAttribute("usuario") == null) {
                response.sendRedirect("../index.jsp");
                return;
            }
        %>
</head>
<body>
    <div class="container">
        <h2 class="my-4">Lista de Compras</h2>
        <a class="btn btn-success mb-3" href="ControladorCompras?accion=add">Agregar Nueva Compra</a>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th class="text-center">ID COMPRA</th>
                    <th class="text-center">FECHA</th>
                    <th class="text-center">MONTO TOTAL</th>
                    <th class="text-center">ID CLIENTE</th>
                    <th class="text-center">ID CONTRATO</th>
                    <th class="text-center">ACCIONES</th>
                </tr>
            </thead>
            <%
                ComprasDAO dao = new ComprasDAO();
                List<Compras> list = dao.listar();
                Iterator<Compras> iter = list.iterator();
                while (iter.hasNext()) {
                    Compras compra = iter.next();
            %>
            <tbody>
                <tr>
                    <td class="text-center"><%= compra.getIdCompra() %></td>
                    <td class="text-center"><%= compra.getFecha() %></td>
                    <td class="text-center"><%= compra.getMontoTotal() %></td>
                    <td class="text-center"><%= compra.getIdCliente() %></td>
                    <td class="text-center"><%= compra.getIdContrato() %></td>
                    <td class="text-center">
                        <a class="btn btn-warning" href="ControladorCompras?accion=editar&id=<%= compra.getIdCompra() %>">Editar</a>
                        <a class="btn btn-danger" href="ControladorCompras?accion=eliminar&id=<%= compra.getIdCompra() %>">Eliminar</a>
                    </td>
                </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
