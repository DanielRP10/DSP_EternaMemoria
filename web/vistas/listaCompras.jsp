<%-- 
    Document   : listaCompras
    Created on : 9 nov 2024, 11:13:04 p. m.
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
        <link href="https://cdn.jsdelivr.net/npm/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <title>Lista de Compras</title>
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
                            <h5 class="mb-0">Lista de Compras</h5>
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
                        <!-- Sección Compras -->
                        <div id="compras-section" class="dashboard-section active">
                            <a class="btn btn-success" href="ControladorCompras?accion=add">Agregar Nueva Compra</a>
                            <a class="btn btn-success" href="reportes/reportCompras.jsp">Reporte de Compras</a>
                            <br><br>
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
                                    Compras compra = null;
                                    while (iter.hasNext()) {
                                        compra = iter.next();
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

                        <!-- Otras secciones similares -->
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
