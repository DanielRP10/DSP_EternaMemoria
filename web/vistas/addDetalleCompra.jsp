<%-- 
    Document   : addDetalleCompra
    Created on : 9 nov 2024, 11:16:54 p. m.
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
        <title>Agregar Detalle de Compra</title>
        <%
            if (session == null || session.getAttribute("usuario") == null) {
                response.sendRedirect("../index.jsp");
                return;
            }
        %>
    </head>
    <body>
        <div class="wrapper">
            <!-- Sidebar -->
            <jsp:include page="sidebar.jsp" />

            <!-- Main Content -->
            <div class="main-content">
                <header class="header">
                    <div class="d-flex justify-content-between w-100">
                        <div>
                            <h5 class="mb-0">Agregar Detalle de Compra</h5>
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
                        <!-- Formulario para agregar detalle de compra -->
                        <div id="default-section" class="dashboard-section active">
                            <h1>Agregar Nuevo Detalle de Compra</h1>
                            <form action="ControladorDetallesCompra" method="post">
                                <div class="mb-3">
                                    <label for="txtCantidad" class="form-label">Cantidad:</label>
                                    <input id="txtCantidad" class="form-control" type="number" name="txtCantidad" required>
                                </div>
                                <div class="mb-3">
                                    <label for="txtPrecio" class="form-label">Precio:</label>
                                    <input id="txtPrecio" class="form-control" type="number" step="0.01" name="txtPrecio" required>
                                </div>
                                <div class="mb-3">
                                    <label for="txtIdCompra" class="form-label">ID Compra:</label>
                                    <input id="txtIdCompra" class="form-control" type="number" name="txtIdCompra" required>
                                </div>
                                <div class="mb-3">
                                    <label for="txtIdProducto" class="form-label">ID Producto:</label>
                                    <input id="txtIdProducto" class="form-control" type="number" name="txtIdProducto" required>
                                </div>
                                <div class="d-flex justify-content-start gap-2">
                                    <input class="btn btn-primary" type="submit" name="accion" value="Agregar">
                                    <a class="btn btn-secondary" href="ControladorDetallesCompra?accion=listar">Cancelar</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
