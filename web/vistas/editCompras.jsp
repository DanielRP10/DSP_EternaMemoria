<%-- 
    Document   : editCompras
    Created on : 9 nov 2024, 11:12:38 p. m.
    Author     : macma
--%>

<%@page import="Modelo.Compras"%>
<%@page import="ModeloDAO.ComprasDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <title>Editar Compra</title>
    <%
        // Validar sesión activa
        if (session == null || session.getAttribute("usuario") == null) {
            response.sendRedirect("../index.jsp");
            return;
        }

        // Obtener datos de la compra a editar
        ComprasDAO dao = new ComprasDAO();
        int id = Integer.parseInt((String) request.getAttribute("idcompra"));
        Compras compra = dao.list(id);
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
                        <h5 class="mb-0">Editar Compra</h5>
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
                    <h2 class="my-4">Editar Compra</h2>
                    <form action="ControladorCompras" method="post">
                        <!-- Campo Fecha -->
                        <div class="mb-3">
                            <label for="txtFecha" class="form-label">Fecha</label>
                            <input id="txtFecha" class="form-control" type="date" name="txtFecha" value="<%= compra.getFecha() %>" required>
                        </div>

                        <!-- Campo Monto Total -->
                        <div class="mb-3">
                            <label for="txtMonto" class="form-label">Monto Total</label>
                            <input id="txtMonto" class="form-control" type="number" step="0.01" name="txtMonto" value="<%= compra.getMontoTotal() %>" required>
                        </div>

                        <!-- Campo ID Cliente -->
                        <div class="mb-3">
                            <label for="txtIdCli" class="form-label">ID Cliente</label>
                            <input id="txtIdCli" class="form-control" type="number" name="txtIdCli" value="<%= compra.getIdCliente() %>" required>
                        </div>

                        <!-- Campo ID Contrato -->
                        <div class="mb-3">
                            <label for="txtIdCon" class="form-label">ID Contrato</label>
                            <input id="txtIdCon" class="form-control" type="number" name="txtIdCon" value="<%= compra.getIdContrato() %>" required>
                        </div>

                        <!-- Campo Oculto para el ID de la Compra -->
                        <input type="hidden" name="txtid" value="<%= compra.getIdCompra() %>">

                        <!-- Botones -->
                        <div class="d-flex">
                            <input class="btn btn-primary me-2" type="submit" name="accion" value="Actualizar">
                            <a class="btn btn-secondary" href="ControladorCompras?accion=listar">Cancelar</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
