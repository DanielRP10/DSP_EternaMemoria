<%-- 
    Document   : listaVendedor
    Created on : 30 oct 2024, 10:52:06
    Author     : Jennifer Tatiana GF
--%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Vendedor"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.VendedorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <title>Lista Vendedor</title>
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
                            <h5 class="mb-0">Lista de Vendedores</h5>
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
                            <a class="btn btn-success" href="ControladorVendedores?accion=add">Agregar Nuevo</a>
                            <br>
                            <br>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th class="text-center">ID VENDEDOR</th>
                                        <th class="text-center">NOMBRE</th>
                                        <th class="text-center">TELEFONO</th>
                                        <th class="text-center">CORREO</th>
                                        <th class="text-center">DUI</th>
                                        <th class="text-center">ACCIONES</th>
                                    </tr>
                                </thead>
                                <%
                                    VendedorDAO dao=new VendedorDAO();
                                    List<Vendedor>list=dao.listar();
                                    Iterator<Vendedor>iter=list.iterator();
                                    Vendedor vend=null;
                                    while(iter.hasNext()){
                                        vend=iter.next();
                                %>
                                <tbody>
                                    <tr>
                                        <td class="text-center"><%= vend.getIdVendedor()%></td>
                                        <td class="text-center"><%= vend.getNombre()%></td>
                                        <td><%= vend.getTelefono()%></td>
                                        <td><%= vend.getCorreo()%></td>
                                        <td><%= vend.getDui()%></td>
                                        <td class="text-center">
                                            <a class="btn btn-warning" href="ControladorVendedores?accion=editar&id=<%= vend.getIdVendedor()%>">Editar</a>
                                            <a class="btn btn-danger" href="ControladorVendedores?accion=eliminar&id=<%= vend.getIdVendedor()%>"
                                               onclick="return confirmarEliminacion()">Eliminar</a>
                                               
                                               <script>
                                                    function confirmarEliminacion() {
                                                        return confirm('¿Estás seguro de que deseas eliminar este vendedor?');
                                                    }
                                                </script>
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
