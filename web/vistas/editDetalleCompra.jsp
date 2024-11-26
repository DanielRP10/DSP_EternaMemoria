<%-- 
    Document   : editDetalleCompra
    Created on : 9 nov 2024, 11:17:18 p. m.
    Author     : macma
--%>

<%@page import="Modelo.DetalleCompras"%>
<%@page import="ModeloDAO.DetalleComprasDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <title>Editar Detalle de Compra</title>
    <%
        // Validar sesión activa
        if (session == null || session.getAttribute("usuario") == null) {
            response.sendRedirect("../index.jsp");
            return;
        }

        // Obtener datos del detalle de compra a editar
        DetalleComprasDAO dao = new DetalleComprasDAO();
        int id = Integer.parseInt((String) request.getAttribute("iddetallecompra"));
        DetalleCompras detalle = dao.list(id);
    %>
</head>
<body>
    <div class="wrapper">
        <!-- Incluir el menú lateral -->
        <jsp:include page="sidebar.jsp" />

        <div class="main-content">
            <header class="header">
                <div class="d-flex justify-content-between w-100">
                    <div>
                        <h5 class="mb-0">Editar Detalle de Compra</h5>
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
                    <h2 class="my-4">Editar Detalle de Compra</h2>
                    <form action="ControladorDetallesCompra" method="post">
                        <!-- Campo Cantidad -->
                        <div class="mb-3">
                            <label for="txtCantidad" class="form-label">Cantidad</label>
                            <input id="txtCantidad" class="form-control" type="number" name="txtCantidad" value="<%= detalle.getCantidad() %>" required>
                        </div>

                        <!-- Campo Precio -->
                        <div class="mb-3">
                            <label for="txtPrecio" class="form-label">Precio</label>
                            <input id="txtPrecio" class="form-control" type="number" step="0.01" name="txtPrecio" value="<%= detalle.getPrecio() %>" required>
                        </div>

                        <!-- Campo ID Compra -->
                        <div class="mb-3">
                            <label for="txtIdCompra" class="form-label">ID Compra</label>
                            <input id="txtIdCompra" class="form-control" type="number" name="txtIdCompra" value="<%= detalle.getIdCompra() %>" required>
                        </div>

                        <!-- Campo ID Producto -->
                        <div class="mb-3">
                            <label for="txtIdProducto" class="form-label">ID Producto</label>
                            <input id="txtIdProducto" class="form-control" type="number" name="txtIdProducto" value="<%= detalle.getIdProducto() %>" required>
                        </div>

                        <!-- Campo Oculto para el ID del Detalle de Compra -->
                        <input type="hidden" name="txtid" value="<%= detalle.getIdDetalleCompra() %>">

                        <!-- Botones -->
                        <div class="d-flex">
                            <input class="btn btn-primary me-2" type="submit" name="accion" value="Actualizar">
                            <a class="btn btn-secondary" href="ControladorDetallesCompra?accion=listar">Cancelar</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
