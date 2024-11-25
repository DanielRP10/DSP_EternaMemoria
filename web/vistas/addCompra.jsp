<%-- 
    Document   : addCompra
    Created on : 9 nov 2024, 10:50:26 p. m.
    Author     : macma
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <title>Agregar Compra</title>
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

        <div class="main-content">
            <header class="header">
                <div class="d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">Agregar Nueva Compra</h5>
                    <a href="ControladorUsuario?accion=CerrarSesion" class="btn btn-outline-danger btn-sm">
                        <i class='bx bx-log-out'></i> Cerrar Sesión
                    </a>
                </div>
            </header>
            
            <div class="content">
                <div class="container mt-4">
                    <form action="ControladorCompras" method="post" class="needs-validation" novalidate>
                        <!-- Campo Fecha -->
                        <div class="mb-3">
                            <label for="fecha" class="form-label">Fecha:</label>
                            <input id="fecha" class="form-control" type="date" name="txtFecha" required>
                            <div class="invalid-feedback">Por favor, ingrese una fecha válida.</div>
                        </div>

                        <!-- Campo Monto Total -->
                        <div class="mb-3">
                            <label for="monto" class="form-label">Monto Total:</label>
                            <input id="monto" class="form-control" type="number" step="0.01" name="txtMonto" required>
                            <div class="invalid-feedback">Por favor, ingrese un monto válido.</div>
                        </div>

                        <!-- Campo ID Cliente -->
                        <div class="mb-3">
                            <label for="idCliente" class="form-label">ID Cliente:</label>
                            <input id="idCliente" class="form-control" type="number" name="txtIdCli" required>
                            <div class="invalid-feedback">Por favor, ingrese un ID de cliente válido.</div>
                        </div>

                        <!-- Campo ID Contrato -->
                        <div class="mb-3">
                            <label for="idContrato" class="form-label">ID Contrato:</label>
                            <input id="idContrato" class="form-control" type="number" name="txtIdCon" required>
                            <div class="invalid-feedback">Por favor, ingrese un ID de contrato válido.</div>
                        </div>

                        <!-- Botones de acción -->
                        <div class="d-flex justify-content-between">
                            <button type="submit" class="btn btn-primary" name="accion" value="Agregar">Agregar</button>
                            <a class="btn btn-secondary" href="ControladorCompras?accion=listar">Cancelar</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts de validación -->
    <script>
        // Habilitar validación de formularios de Bootstrap
        (function () {
            'use strict';
            var forms = document.querySelectorAll('.needs-validation');
            Array.prototype.slice.call(forms).forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        })();
    </script>
</body>
</html>
