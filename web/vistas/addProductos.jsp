<%-- 
    Document   : addProductos
    Created on : 9 nov 2024, 11:06:22 p. m.
    Author     : macma
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <title>Agregar Producto</title>
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
                            <h5 class="mb-0">Lista de Productos</h5>
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
                            <h1>Agregar Producto</h1>
                            <form action="ControladorProductos">
                                Nombre:<br>
                                <input class="form-control" type="text" name="txtNombre"><br>
                                Precio:<br>
                                <input class="form-control" type="number" name="txtPrecio" step="0.01"><br>
                                Descripción:<br>
                                <textarea class="form-control" name="txtDescripcion"></textarea><br>
                                ID Inventario:<br>
                                <input class="form-control" type="text" name="txtIdInventario"><br>
                                <input class="btn btn-primary" type="submit" name="accion" value="Agregar">
                                <a class="btn btn-primary" href="ControladorProductos?accion=listar">Regresar</a>
                            </form>
                        </div>

                        <!-- Sección Clientes -->
                        <div id="clientes-section" class="dashboard-section">
                            <div class="row">
                                <div class="col-md-6">
                                    <!-- Contenido adicional -->
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
