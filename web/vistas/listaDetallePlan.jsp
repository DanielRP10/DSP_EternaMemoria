<%-- 
    Document   : listaDetallePlan
    Created on : 7 nov 2024, 17:31:15
    Author     : predi
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.DetallePlan"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.DetallePlanDAO"%>
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
                            <h5 class="mb-0">Lista de DetallePlan</h5>
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
                            <a class="btn btn-success" href="ControladorDetallePlan?accion=add">Agregar Nuevo</a>
                            <br>
                            <br>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th class="text-center">ID DETALLE</th>
                                        <th class="text-center">NOMBRE</th>
                                        <th class="text-center">DESCRIPCION</th>
                                        <th class="text-center">CANTIDAD</th>
                                        <th class="text-center">ID PRODUCTO</th>
                                        <th class="text-center">ID PLAN</th>
                                        <th class="text-center">ACCION</th>
                                    </tr>
                                </thead>
                                <%
                                    DetallePlanDAO dao=new DetallePlanDAO();
                                    List<DetallePlan>list=dao.listarDetallePlan();
                                    Iterator<DetallePlan>iter=list.iterator();
                                    DetallePlan dp=null;
                                    while(iter.hasNext()){
                                        dp=iter.next();
                                %>
                                <tbody>
                                    <tr>
                                        <td class="text-center"><%= dp.getIdDetallePlanes()%></td>
                                        <td class="text-center"><%= dp.getNombreDetallePlan()%></td>
                                        <td class="text-center"><%= dp.getDescripcion()%></td>
                                        <td class="text-center"><%= dp.getCantidad()%></td>
                                        <td class="text-center"><%= dp.getIdProducto()%></td>
                                        <td class="text-center"><%= dp.getIdPlan()%></td>
                                        <td class="text-center">
                                            <a class="btn btn-warning" href="ControladorDetallePlan?accion=editar&id=<%= dp.getIdDetallePlanes()%>">Editar</a>
                                            <a class="btn btn-danger" href="ControladorDetallePlan?accion=eliminar&id=<%= dp.getIdDetallePlanes()%>">Eliminar</a>
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

