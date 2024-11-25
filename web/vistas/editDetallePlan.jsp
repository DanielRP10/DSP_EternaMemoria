<%-- 
    Document   : editDetallePlan
    Created on : 7 nov 2024, 17:31:51
    Author     : predi
--%>


<%@page import="Modelo.DetallePlan"%>
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
                            <h5 class="mb-0">Modificar Detalle del Plan</h5>
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
                                DetallePlanDAO dao=new DetallePlanDAO();
                                int id=Integer.parseInt((String)request.getAttribute("idDP"));
                                DetallePlan dp=(DetallePlan)dao.list(id);
                             %>
                            <form action="ControladorDetallePlan">
                                Nombre: <br>
                                <input class="form-control" type="text" name="txtNombre" value="<%= dp.getNombreDetallePlan()%>"><br>
                                Descripcion: <br>
                                <input class="form-control" type="text" name="txtDescripcion" value="<%= dp.getDescripcion()%>"><br>
                                Cantidad:  <br>
                                <input class="form-control" type="text" name="txtCantidad" value="<%= dp.getCantidad()%>"><br>
                                ID Producto: <br>
                                <input class="form-control" type="text" name="txtIdProducto" value="<%= dp.getIdProducto()%>"><br>
                                ID Plan <br>
                                <input class="form-control" type="text" name="txtIdPlan" value="<%= dp.getIdPlan()%>"><br>
                                <input type="hidden" name="txtIdDetallePlan" value="<%= dp.getIdDetallePlanes()%>">
                                <input class="btn btn-primary" type="submit" name="accion" value="Actualizar">
                                <a class="btn btn-primary" href="ControladorDetallePlan?accion=listarDetallePlan">Regresar</a>
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


