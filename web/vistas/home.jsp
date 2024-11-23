<%-- 
    Document   : home
    Created on : 19 nov 2024, 14:46:29
    Author     : predi
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <title>Vendedores</title>
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
                <a href="ControladorClientes?accion=listar" class="menu-item">
                    <i class='bx bx-user'></i> Clientes
                </a>
                <a href="ControladorContrato?accion=listarContrato" class="menu-item">
                    <i class='bx bx-task'></i> Contrato
                </a>
                <a href="ControladorReservacion?accion=listarReservacion" class="menu-item">
                    <i class='bx bx-category'></i> Reservaciones
                </a>
                <a href="ControladorInventarios?accion=listar" class="menu-item">
                    <i class='bx bx-building'></i>Inventarios
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
                <a href="ControladorUsuarioCRUD?accion=listarUsuario" class="menu-item">
                    <i class='bx bx-user'></i> Usuario
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
                    <h5 class="mb-0">Bienvenido, Administrador</h5>
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
                    <div class="row">
                        <div class="col-md-6 d-flex flex-column align-items-center">
                            <h3>Reporte de Contratos</h3>
                            <div class="w-100">
                                <canvas id="contratosChart" style="max-height: 300px;"></canvas>
                            </div>
                        </div>
                        <div class="col-md-6 d-flex flex-column align-items-center">
                            <h3>Reporte de planes</h3>
                            <div class="w-100">
                                <canvas id="planesChart" style="max-height: 300px;"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 d-flex flex-column align-items-center">
                            <h3>Reporte de Reservaciones</h3>
                            <div class="w-100">
                                <canvas id="reservacionesChart" style="max-height: 300px;"></canvas>
                            </div>
                        </div>
<!--                        <div class="col-md-6 d-flex flex-column align-items-center">
                            <h3>Reporte de planes</h3>
                            <div class="w-100">
                                <canvas id="planesChart" style="max-height: 300px;"></canvas>
                            </div>
                        </div>-->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
        
        <script>
            document.getElementById('ventas-toggle').addEventListener('click', function(e) {
                e.preventDefault(); 
                const submenu = document.getElementById('ventas-submenu');
                submenu.classList.toggle('show'); 
            });
            async function fetchContratosData() {
                const response = await fetch('ControladorContrato?accion=datosGraficos');
                return await response.json();
            }

            async function renderChart() {
                const contratosData = await fetchContratosData();
                const clientes = contratosData.map(contrato => contrato.cliente);
                const planes = contratosData.map(contrato => contrato.plan);

                const ctx = document.getElementById('contratosChart').getContext('2d');
                new Chart(ctx, {
                    type: 'bar', 
                    data: {
                        labels: clientes, 
                        datasets: [{
                            label: 'Planes de Contratos',
                            data: planes, 
                            backgroundColor: 'rgba(75, 192, 192, 0.2)',
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: { position: 'top' },
                            tooltip: { enabled: true }
                        },
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            }

            renderChart();
            
            async function fetchPlanesData() {
                const response = await fetch('ControladorPlan?accion=datosGraficosPlan');
                return await response.json();
            }

            
            async function renderPlanesChart() {
                const planesData = await fetchPlanesData();
                const nombres = planesData.map(plan => plan.nombre); // Nombres de los planes
                const precios = planesData.map(plan => plan.precio); // Precios de los planes

                const ctx = document.getElementById('planesChart').getContext('2d');
                new Chart(ctx, {
                    type: 'pie', 
                    data: {
                        labels: nombres, 
                        datasets: [{
                            data: precios, 
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: { position: 'top' },
                            tooltip: { enabled: true }
                        }
                    }
                });
            }

            renderPlanesChart(); 
            
            async function fetchReservacionesData() {
                const response = await fetch('ControladorReservacion?accion=datosGraficosReservacion');
                return await response.json();
            }

            async function renderReservacionesChart() {
                const reservacionesData = await fetchReservacionesData();
                const fechas = reservacionesData.map(reservacion => reservacion.fecha); // Fechas de las reservaciones
                const clientes = reservacionesData.map(reservacion => reservacion.cliente); // IDs de los clientes

                const ctx = document.getElementById('reservacionesChart').getContext('2d');
                new Chart(ctx, {
                    type: 'doughnut', // Tipo de gráfico (puedes cambiarlo a 'line', 'pie', etc.)
                    data: {
                        labels: fechas, // Etiquetas (fechas)
                        datasets: [{
                            label: 'Reservaciones por Cliente',
                            data: clientes, // Cantidad de reservaciones o IDs de clientes
                            backgroundColor: 'rgba(153, 102, 255, 0.2)',
                            borderColor: 'rgba(153, 102, 255, 1)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: { position: 'top' },
                            tooltip: { enabled: true }
                        },
                        scales: {
                            y: { beginAtZero: true }
                        }
                    }
                });
            }

            renderReservacionesChart();
            
        </script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </body>
</html>

