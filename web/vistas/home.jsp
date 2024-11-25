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
        <jsp:include page="sidebar.jsp" />

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
             
            async function fetchContratosData() {
                const response = await fetch('ControladorContrato?accion=datosGraficos'); // Endpoint del controlador
                return await response.json(); // JSON retornado por el servlet
            }

            async function renderChart() {
                const contratosData = await fetchContratosData(); // Llamada al servidor

                // Extrae nombres de vendedores y totales de contratos
                const nombresVendedores = contratosData.map(contrato => contrato.nombreVendedor);
                const totalContratos = contratosData.map(contrato => contrato.totalContratos);

                // Renderiza el gráfico
                const ctx = document.getElementById('contratosChart').getContext('2d');
                new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: nombresVendedores, // Etiquetas en el eje X
                        datasets: [{
                            label: 'Total de Contratos por Vendedor',
                            data: totalContratos, // Valores en el eje Y
                            backgroundColor: 'rgba(75, 192, 192, 0.2)', // Color de fondo
                            borderColor: 'rgba(75, 192, 192, 1)', // Color del borde
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

            // Llama a la función para inicializar el gráfico
            renderChart();

//---------------------------------------grafica de planes----------------------------------------------            
            async function fetchPlanesData() {
                const response = await fetch('ControladorPlan?accion=datosGraficosPlan'); // Ajusta esta ruta según tu configuración
                return await response.json();
            }

            async function renderPlanesChart() {
                const planesData = await fetchPlanesData();
                const nombres = planesData.map(plan => plan.nombre); // Nombres de los planes
                const totales = planesData.map(plan => plan.totalPlanes); // Total de clientes por plan

                const ctx = document.getElementById('planesChart').getContext('2d');
                new Chart(ctx, {
                    type: 'pie', 
                    data: {
                        labels: nombres, 
                        datasets: [{
                            data: totales, 
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
//-------------------------------------------grafica de reservaciones ------------------------------------------------            
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
                            backgroundColor: [
                                'rgba(244, 164, 96, 0.2)',   // Sandy Brown
                                'rgba(32, 178, 170, 0.2)',   // Light Sea Green
                                'rgba(135, 206, 235, 0.2)',  // Sky Blue
                                'rgba(255, 182, 193, 0.2)',  // Light Pink
                                'rgba(255, 240, 245, 0.2)',  // Lavender Blush
                                'rgba(221, 160, 221, 0.2)'   // Plum
                            ],
                            borderColor: [
                                'rgba(244, 164, 96, 1)',     // Sandy Brown
                                'rgba(32, 178, 170, 1)',     // Light Sea Green
                                'rgba(135, 206, 235, 1)',    // Sky Blue
                                'rgba(255, 182, 193, 1)',    // Light Pink
                                'rgba(255, 240, 245, 1)',    // Lavender Blush
                                'rgba(221, 160, 221, 1)'     // Plum
                            ],
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