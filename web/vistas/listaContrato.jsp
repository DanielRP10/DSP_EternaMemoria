<%-- 
    Document   : listaContrato
    Created on : 3 nov 2024, 19:31:58
    Author     : predi
--%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Contrato"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.ContratoDAO"%>
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
                            <h5 class="mb-0">Lista de Contrato</h5>
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
                            <a class="btn btn-success" href="ControladorContrato?accion=add">Agregar Nuevo</a>                           
                            <br>
                            <br>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th class="text-center">ID CONTRATO</th>
                                        <th class="text-center">FECHA CONTRATO</th>
<!--                                        <th class="text-center">ID CLIENTE</th>-->
                                        <th class="text-center">NOMBRE CLIENTE</th>
                                        <th class="text-center">ID PLAN</th>
                                        <th class="text-center">ID VENDEDOR</th>
                                        <th class="text-center">ACCION</th>
                                    </tr>
                                </thead>
                                <%
                                    ContratoDAO dao=new ContratoDAO();
                                    List<Contrato>list=dao.listarContrato();
                                    Iterator<Contrato>iter=list.iterator();
                                    Contrato contra=null;
                                    while(iter.hasNext()){
                                        contra=iter.next();
                                %>
                                <tbody>
                                    <tr>
                                        <td class="text-center"><%= contra.getIdContrato()%></td>
                                        <td class="text-center"><%= contra.getFechaContrato()%></td>
<!--                                        <td class="text-center"><//%= contra.getIdCliente()%></td>-->
                                        <td class="text-center"><%= contra.getNombreCliente()%></td>
                                        <td class="text-center"><%= contra.getIdPlan()%></td>
                                        <td class="text-center"><%= contra.getIdVendedor()%></td>
                                        <td class="text-center">
                                            <a class="btn btn-warning" href="ControladorContrato?accion=editar&id=<%= contra.getIdContrato()%>">Editar</a>
                                            <a class="btn btn-danger" href="ControladorContrato?accion=eliminar&id=<%= contra.getIdContrato()%>">Eliminar</a>
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
