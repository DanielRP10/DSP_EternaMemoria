<%-- 
    Document   : listaPlan
    Created on : 4 nov 2024, 18:15:57
    Author     : predi
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Plan"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.PlanDAO"%>
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
            <nav class="sidebar">
                <div class="sidebar-header">
                    <h4>Panel Administrativo</h4>
                </div>
                <div class="sidebar-menu">
                    <div class="menu-section">
                        <div class="menu-section-title">Controles</div>
                        <a href="https://example.com/clientes" class="menu-item">
                            <i class='bx bx-user'></i> Clientes
                        </a>
                        <a href="ControladorContrato?accion=listarContrato" class="menu-item">
                            <i class='bx bx-task'></i> Contrato
                        </a>
                        <a href="ControladorReservacion?accion=listarReservacion" class="menu-item">
                            <i class='bx bx-category'></i> Reservaciones
                        </a>
                        <a href="https://example.com/agencias" class="menu-item">
                            <i class='bx bx-building'></i> Agencias
                        </a>
                    </div>

                    <div class="menu-section">
                        <div class="menu-section-title">Operaciones</div>
                        <div class="menu-item dropdown">
                            <a href="#" class="menu-item-toggle" id="ventas-toggle">
                                <i class='bx bx-cart'></i> Ventas <i class='bx bx-chevron-down ms-auto'></i>
                            </a>
                            <div class="dropdown-content" id="ventas-submenu">
                                <a href="ControladorVendedores?accion=listar" class="menu-item">Vendedores</a>
                                <a href="ControladorVentas?accion=listar" class="menu-item">Ventas</a>
                                <a href="ControladorDetallesVentas?accion=listar" class="menu-item">Detalles de Ventas</a>
                                <a href="ControladorPlan?accion=listarPlan" class="menu-item">Plan</a>
                                <a href="ControladorDetallePlan?accion=listarDetallePlan" class="menu-item">Detalle del Plan</a>
                            </div>
                        </div>
                        <a href="ControladorCuentaPago?accion=listarCuentaPago" class="menu-item">
                            <i class='bx bx-shopping-bag'></i> Pago
                        </a>
                        <a href="https://example.com/cobros" class="menu-item">
                            <i class='bx bx-money'></i> Cobros de Créditos
                        </a>
                        <a href="https://example.com/devoluciones" class="menu-item">
                            <i class='bx bx-revision'></i> Devoluciones
                        </a>
                    </div>

                    <div class="menu-section">
                        <div class="menu-section-title">Informes</div>
                        <a href="https://example.com/historial-producto" class="menu-item">
                            <i class='bx bx-history'></i> Historial de Producto
                        </a>
                        <a href="https://example.com/estado-cuenta" class="menu-item">
                            <i class='bx bx-spreadsheet'></i> Estado de Cuenta
                        </a>
                        <a href="https://example.com/informe-ventas" class="menu-item">
                            <i class='bx bx-line-chart'></i> Informe de Ventas
                        </a>
                    </div>

                    <div class="menu-section">
                        <div class="menu-section-title">Especiales</div>
                        <a href="https://example.com/usuarios" class="menu-item">
                            <i class='bx bx-group'></i> Usuarios
                        </a>
                        <a href="https://example.com/autorizaciones" class="menu-item">
                            <i class='bx bx-lock'></i> Autorizaciones
                        </a>
                        <a href="https://example.com/configuraciones" class="menu-item">
                            <i class='bx bx-cog'></i> Configuraciones
                        </a>
                    </div>

                    <div class="menu-section">
                        <div class="menu-section-title">Ayuda</div>
                        <a href="https://example.com/ayuda" class="menu-item">
                            <i class='bx bx-help-circle'></i> Ayuda
                        </a>
                        <a href="https://example.com/acerca-de" class="menu-item">
                            <i class='bx bx-info-circle'></i> Acerca de
                        </a>
                    </div>
                </div>
            </nav>

            <div class="main-content">
                <header class="header">
                    <div class="d-flex justify-content-between w-100">
                        <div>
                            <h5 class="mb-0">Lista de Plan</h5>
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
                            <a class="btn btn-success" href="ControladorPlan?accion=add">Agregar Nuevo</a>
                            <br>
                            <br>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th class="text-center">ID PLAN</th>
                                        <th class="text-center">NOMBRE PLAN</th>
                                        <th class="text-center">DESCRIPCION</th>
                                        <th class="text-center">PRECIO</th>
                                        <th class="text-center">ACCION</th>
                                    </tr>
                                </thead>
                                <%
                                    PlanDAO dao=new PlanDAO();
                                    List<Plan>list=dao.listarPlan();
                                    Iterator<Plan>iter=list.iterator();
                                    Plan plan=null;
                                    while(iter.hasNext()){
                                        plan=iter.next();
                                %>
                                <tbody>
                                    <tr>
                                        <td class="text-center"><%= plan.getIdPlan()%></td>
                                        <td class="text-center"><%= plan.getNombrePlan()%></td>
                                        <td class="text-center"><%= plan.getDescripcion()%></td>
                                        <td class="text-center"><%= plan.getPrecio()%></td>
                                        <td class="text-center">
                                            <a class="btn btn-warning" href="ControladorPlan?accion=editar&id=<%= plan.getIdPlan()%>">Editar</a>
                                            <a class="btn btn-danger" href="ControladorPlan?accion=eliminar&id=<%= plan.getIdPlan()%>">Eliminar</a>
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
        <script>
            document.getElementById('ventas-toggle').addEventListener('click', function(e) {
                e.preventDefault(); // Evita que el enlace siga el href
                const submenu = document.getElementById('ventas-submenu');
                submenu.classList.toggle('show'); // Alternar la clase 'show' para mostrar/ocultar
            });
        </script>
    </body>
</html>

