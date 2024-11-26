<%-- 
    Document   : listaReservacion
    Created on : 1 nov 2024, 15:25:02
    Author     : predi
--%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Reservacion"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.ReservacionDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <title>Lista Reservacion</title>
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
                            <h5 class="mb-0">Lista de Reservaciones</h5>
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
                            <a class="btn btn-success" href="ControladorReservacion?accion=add">Agregar Nuevo</a>
                            <br>
                            <br>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th class="text-center">ID RESERVACION</th>
                                        <th class="text-center">FECHA</th>
                                        <th class="text-center">HORA</th>
                                        <th class="text-center">NOMBRE CLIENTE</th>
                                        <th class="text-center">ACCION</th>
                                    </tr>
                                </thead>
                                <%
                                    ReservacionDAO dao=new ReservacionDAO();
                                    List<Reservacion>list=dao.listarReservacion();
                                    Iterator<Reservacion>iter=list.iterator();
                                    Reservacion res=null;
                                    while(iter.hasNext()){
                                        res=iter.next();
                                %>
                                <tbody>
                                    <tr>
                                        <td class="text-center"><%= res.getIdReservacion()%></td>
                                        <td class="text-center"><%= res.getFecha()%></td>
                                        <td class="text-center"><%= res.getHora()%></td>
                                        <td class="text-center"><%= res.getIdCliente()+"-"+res.getNombreCliente()%></td>
                                        <td class="text-center">
                                            <a class="btn btn-warning" href="ControladorReservacion?accion=editar&id=<%= res.getIdReservacion()%>">Editar</a>
                                            <a class="btn btn-danger" href="ControladorReservacion?accion=eliminar&id=<%= res.getIdReservacion()%>">Eliminar</a>
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
