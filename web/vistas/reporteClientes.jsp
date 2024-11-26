<%-- 
    Document   : reporteClientes
    Created on : 25 nov 2024, 11:07:06
    Author     : Jennifer Tatiana GF
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <title>Reporte de Clientes</title>
        <%
            if (session == null || session.getAttribute("usuario") == null) {
                response.sendRedirect("../index.jsp");
                return;
            }
        %>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap');

            .download-container {
                background: white;
                padding: 35px;
                border-radius: 12px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.08);
                text-align: center;
                max-width: 400px; 
                width: 100%; 
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                position: absolute; 
                top: 50%; 
                left: 55%; 
                transform: translate(-50%, -50%);
            }
            
            .download-button {
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 10px;
                background: #2c3e50;
                color: white;
                padding: 15px 30px;
                border-radius: 8px;
                border: none;
                cursor: pointer;
                font-size: 16px;
                font-weight: 500;
                transition: all 0.3s ease;
                text-decoration: none;
            }

            .download-button:hover {
                background: #34495e;
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(44,62,80,0.2);
            }

            .download-icon {
                width: 24px;
                height: 24px;
                fill: white;
            }
    
            h1 {
                color: #2c3e50;
                margin-bottom: 30px;
                font-size: 24px;
                font-weight: 600;
            }   

            .reports-list {
                margin-top: 25px;
                text-align: left;
            }
            
            .report-item {
                margin: 10px 0;
                padding: 18px;
                background: #f8f9fa;
                border-radius: 8px;
                transition: all 0.3s ease;
                color: #2c3e50;
                font-weight: 500;
                border: 1px solid #edf0f3;
            }

            .report-item:hover {
                background: #edf0f3;
                transform: translateY(-1px);
                box-shadow: 0 2px 8px rgba(44,62,80,0.1);
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
             <jsp:include page="sidebar.jsp" />
            <div class="main-content">
                <header class="header">
                    <div class="d-flex justify-content-between w-100">
                        <div>
                            <h5 class="mb-0">Reporte de Clientes</h5>
                        </div>
                        <div>
                            <a href="https://example.com/perfil" class="btn btn-outline-secondary btn-sm me-2">
                                <i class='bx bx-user-circle'></i> Perfil
                            </a>
                            <a href="${pageContext.request.contextPath}/ControladorUsuario?accion=CerrarSesion" class="btn btn-outline-danger btn-sm">
                                <i class='bx bx-log-out'></i> Cerrar Sesión
                            </a>
                        </div>
                    </div>
                </header>
                </div>
                <div class="download-container">
                    <h1>Reporte de clientes</h1>

                    <a href="../reportes/reportClientes.jsp" class="download-button">
                        Mostrar Reporte
                    </a>

                    <div class="reports-list">
                        <div class="report-item">
                            Información de los clientes, los contratos y pagos realizados por cada cliente.
                        </div>
                    </div>
                </div>
        </div>
            
    </body>
</html>

