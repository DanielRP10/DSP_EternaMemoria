<%-- 
    Document   : listaInventario
    Created on : 3 nov 2024, 14:57:24
    Author     : Jennifer Tatiana GF
--%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Inventario"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.InventarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <title>Lista Inventario</title>
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
                            <h5 class="mb-0">Lista de Inventario</h5>
                        </div>
                        <div>
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
                            <a class="btn btn-success" href="ControladorInventarios?accion=add">Agregar Nuevo</a>
                            <br>
                            <br>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th class="text-center">ID INVENTARIO</th>
                                        <th class="text-center">DESCRIPCION</th>
                                        <th class="text-center">CANTIDAD</th>
                                        <th class="text-center">ACCIONES</th>
                                    </tr>
                                </thead>
                                <%
                                    InventarioDAO dao=new InventarioDAO();
                                    List<Inventario>list=dao.listar();
                                    Iterator<Inventario>iter=list.iterator();
                                    Inventario in=null;
                                    while(iter.hasNext()){
                                        in=iter.next();

                                %>
                                <tbody>
                                    <tr>
                                        <td class="text-center"><%= in.getIdInventario()%></td>
                                        <td class="text-center"><%= in.getDescripcion()%></td>
                                        <td><%= in.getCantidad()%></td>
                                        <td class="text-center">
                                            <a class="btn btn-warning" href="ControladorInventarios?accion=editar&id=<%= in.getIdInventario()%>">Editar</a>
                                            <a class="btn btn-danger" href="ControladorInventarios?accion=eliminar&id=<%= in.getIdInventario()%>">Eliminar</a>
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
