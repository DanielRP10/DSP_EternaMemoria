<%-- 
    Document   : editPlan
    Created on : 4 nov 2024, 18:15:20
    Author     : predi
--%>

<%@page import="Modelo.Plan"%>
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
            <jsp:include page="sidebar.jsp" />
            <div class="main-content">
                <header class="header">
                    <div class="d-flex justify-content-between w-100">
                        <div>
                            <h5 class="mb-0">Modificar Plan</h5>
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
                            <%
                                PlanDAO dao=new PlanDAO();
                                int id=Integer.parseInt((String)request.getAttribute("idplan"));
                                Plan p=(Plan)dao.list(id);
                             %>
                            <form action="ControladorPlan">
                                Nombre del Plan:<br>
                                <input class="form-control" type="text" name="txtNombrePlan" value="<%= p.getNombrePlan()%>"><br>
                                Descripcion <br>
                                <input class="form-control" type="text" name="txtDescripcion" value="<%= p.getDescripcion()%>"><br>
                                Precio <br>
                                <input class="form-control" type="text" name="txtPrecio" value="<%= p.getPrecio()%>"><br>
                                <input type="hidden" name="txtIdPlan" value="<%= p.getIdPlan()%>">
                                <input class="btn btn-primary" type="submit" name="accion" value="Actualizar">
                                <a class="btn btn-primary" href="ControladorPlan?accion=listarPlan">Regresar</a>
                            </form>
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
