<%-- 
    Document   : editdetVentas
    Created on : 1 nov 2024, 14:03:30
    Author     : Jennifer Tatiana GF
--%>
<%@page import="Modelo.DetalleVenta"%>
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
                            <h5 class="mb-0">Lista de Detalles de Ventas</h5>
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
                                DetalleVentaDAO dao=new DetalleVentaDAO();
                                int id=Integer.parseInt((String)request.getAttribute("iddev"));
                                DetalleVenta dev=(DetalleVenta)dao.list(id);

                             %>
                            <h1>Modificar Detalles de Ventas</h1>
                            <form action="ControladorDetallesVentas">
                                Detalle Ventas:<br>
                                <input class="form-control" type="text" name="txtdetalleVenta" value="<%= dev.getDetalleVenta()%>"><br>
                                ID Venta: <br>
                                <input class="form-control" type="text" name="txtIdV" value="<%= dev.getIdVenta()%>"><br>
                                ID Producto: <br>
                                <input class="form-control" type="text" name="txtIdP" value="<%= dev.getIdProducto()%>"><br>
                                <input type="hidden" name="txtid" value="<%= dev.getIdDetalleVentas()%>">
                                <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"> 
                                <a class="btn btn-primary" href="ControladorDetallesVentas?accion=listar">Regresar</a>
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
