<%-- 
    Document   : listaDetallesCompra
    Created on : 9 nov 2024, 11:17:41 p. m.
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
        <link href="https://cdn.jsdelivr.net/npm/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <title>Lista de Detalles de Compra</title>
        <%
            if (session == null || session.getAttribute("usuario") == null) {
                response.sendRedirect("../index.jsp");
                return;
            }
        %>
    </head>
    <body>
        <div class="wrapper">
            <!-- Sidebar -->
            <jsp:include page="sidebar.jsp" />

            <!-- Main Content -->
            <div class="main-content">
                <!-- Header -->
                <header class="header">
                    <div class="d-flex justify-content-between w-100">
                        <div>
                            <h5 class="mb-0">Lista de Detalles de Compra</h5>
                        </div>
                        <div>
                            <a href="https://example.com/perfil" class="btn btn-outline-secondary btn-sm me-2">
                                <i class='bx bx-user-circle'></i> Perfil
                            </a>
                            <a href="ControladorUsuario?accion=CerrarSesion" class="btn btn-outline-danger btn-sm">
                                <i class='bx bx-log-out'></i> Cerrar Sesión
                            </a>
                        </div>
                    </div>
                </header>

                <!-- Content -->
                <div class="content">
                    <div class="container-fluid">
                        <!-- Sección Detalles de Compra -->
                        <div id="detalle-compras-section" class="dashboard-section active">
                            <a class="btn btn-success" href="ControladorDetallesCompra?accion=add">Agregar Nuevo Detalle de Compra</a>
                            <br><br>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th class="text-center">ID DETALLE</th>
                                        <th class="text-center">CANTIDAD</th>
                                        <th class="text-center">PRECIO</th>
                                        <th class="text-center">ID COMPRA</th>
                                        <th class="text-center">NOMBRE PRODUCTO</th>
                                        <th class="text-center">ACCIONES</th>
                                    </tr>
                                </thead>
                                <%
                                    DetalleComprasDAO dao = new DetalleComprasDAO();
                                    List<DetalleCompras> list = dao.listar();
                                    Iterator<DetalleCompras> iter = list.iterator();
                                    DetalleCompras detalle = null;
                                    while (iter.hasNext()) {
                                        detalle = iter.next();
                                %>
                                <tbody>
                                    <tr>
                                        <td class="text-center"><%= detalle.getIdDetalleCompra() %></td>
                                        <td class="text-center"><%= detalle.getCantidad() %></td>
                                        <td class="text-center"><%= detalle.getPrecio() %></td>
                                        <td class="text-center"><%= detalle.getIdCompra() %></td>
                                        <td class="text-center"><%= detalle.getIdProducto()+"-"+detalle.getNombrePro() %></td>
                                        <td class="text-center">
                                            <a class="btn btn-warning" href="ControladorDetallesCompra?accion=editar&id=<%= detalle.getIdDetalleCompra() %>">Editar</a>
                                            <a class="btn btn-danger" href="ControladorDetallesCompra?accion=eliminar&id=<%= detalle.getIdDetalleCompra() %>">Eliminar</a>
                                        </td>
                                    </tr>
                                <% } %>
                                </tbody>
                            </table>
                        </div>

                        <!-- Otras secciones similares -->
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
