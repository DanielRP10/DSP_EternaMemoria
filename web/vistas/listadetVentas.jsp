<%-- 
    Document   : listadetVentas
    Created on : 1 nov 2024, 13:53:27
    Author     : Jennifer Tatiana GF
--%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.DetalleVenta"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.DetalleVentaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <title>JSP Page</title>
        <%
            if (session == null || session.getAttribute("usuario") == null) {
                response.sendRedirect("../index.jsp");
                return;
            }
        %>
    </head>
    <body>
        <div class="wrapper">
             <jsp:include page="sidebar.jsp" />
            <div class="main-content">
                <header class="header">
                    <div class="d-flex justify-content-between w-100">
                        <div>
                            <h5 class="mb-0">Lista de Detalles de ventas</h5>
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

                <div class="content">
                    <div class="container-fluid">
                        <!-- Sección Default -->
                        <div id="default-section" class="dashboard-section active">
                            <a class="btn btn-success" href="ControladorDetallesVentas?accion=add">Agregar Nuevo</a>
                            <br>
                            <br>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th class="text-center">ID DETALLE VENTA</th>
                                        <th class="text-center">DETALLE VENTA</th>
                                        <th class="text-center">ID VENTA</th>
                                        <th class="text-center">ID PRODUCTO</th>
                                        <th class="text-center">ACCIONES</th>
                                    </tr>
                                </thead>
                                <%
                                    DetalleVentaDAO dao=new DetalleVentaDAO();
                                    List<DetalleVenta>list=dao.listar();
                                    Iterator<DetalleVenta>iter=list.iterator();
                                    DetalleVenta dev=null;
                                    while(iter.hasNext()){
                                        dev=iter.next();
                                %>
                                <tbody>
                                     <tr>
                                        <td class="text-center"><%= dev.getIdDetalleVentas()%></td>
                                        <td class="text-center"><%= dev.getDetalleVenta()%></td>
                                         <td class="text-center"><%= dev.getIdVenta()%></td>
                                          <td class="text-center"><%= dev.getIdProducto()%></td>
                                        <td class="text-center">
                                            <a class="btn btn-warning" href="ControladorDetallesVentas?accion=editar&id=<%= dev.getIdDetalleVentas()%>">Editar</a>
                                            <a class="btn btn-danger" href="ControladorDetallesVentas?accion=eliminar&id=<%= dev.getIdDetalleVentas()%>">Eliminar</a>
                                        </td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>

                        <!-- Sección Clientes -->
                        <div id="clientes-section" class="dashboard-section">
                            <div class="row">
                                <div class="col-md-6">
                                    
                                </div>
                            </div>
                        </div>

                        <!-- Otras secciones similares para cada opción del menú -->
                    </div>
                </div>
            </div>
        </div>
       
    </body>
</html>
