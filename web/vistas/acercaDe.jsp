<%-- 
    Document   : acercaDe
    Created on : 25 nov 2024, 08:42:04
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
        <title>Acerca De</title>
        <%
            if (session == null || session.getAttribute("usuario") == null) {
                response.sendRedirect("../index.jsp");
                return;
            }
        %>
    </head>
    
    <style>
        :root {
            --primary: #3498db;
            --accent: #2980b9;
            --text: #2c3e50;
            --light: #ebf5fb;   
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: var(--text);
            background: linear-gradient(135deg, var(--light) 0%, #fff 100%);
            min-height: 100vh;
        }

        .container {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                min-height: 100vh;
        }

        .about-header {
            text-align: center;
            margin-bottom: 1rem;
            animation: fadeIn 1s ease-in;
        }

        .logo {
            width: 110px;  
            height: 120px; 
            margin-bottom: 1rem;
        }

        .version-badge {
            background: var(--primary);
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            display: inline-block;
            margin: 1rem 0;
            font-weight: bold;
        }

        .info-grid {
            display: flex;
            justify-content: space-between;
            gap: 2rem;
            margin-top: 3rem;
        }

        .info-card {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .info-card:hover {
            transform: translateY(-5px);
        }

        .info-card h3 {
            color: var(--primary);
            margin-bottom: 1rem;
            border-bottom: 2px solid var(--accent);
            padding-bottom: 0.5rem;
        }
</style>
    
    
    <body>
        <div class="wrapper">
             <jsp:include page="sidebar.jsp" />
            <div class="main-content">
                <header class="header">
                    <div class="d-flex justify-content-between w-100">
                        <div>
                            <h5 class="mb-0">Acerca De</h5>
                        </div>
                        <div>
                            <a href="${pageContext.request.contextPath}/ControladorUsuario?accion=CerrarSesion" class="btn btn-outline-danger btn-sm">
                                <i class='bx bx-log-out'></i> Cerrar Sesión
                            </a>
                        </div>
                    </div>
                </header>
            </div>
            <div class="container">
                <header class="about-header">
                  <img src="../img/Logo.png" alt="Logo de EternaMemoria" class="logo" width="120" height="120" style="filter: invert(45%) sepia(57%) saturate(357%) hue-rotate(164deg) brightness(91%) contrast(98%);">
                  <h1>EternaMemoria</h1>
                  <span class="version-badge">Versión 1.0.0</span>
                  <p>Sistema de Gestión de Funeraria</p>
                </header>

                <div class="info-grid">
                  <div class="info-card">
                    <h3>Información del Sistema</h3>
                    <ul>
                      <li>Nombre: EternaMemoria</li>
                      <li>Versión: 1.0.0</li>
                      <li>Fecha de Lanzamiento: 2024</li>
                    </ul>
                  </div>

                  <div class="info-card">
                    <h3>Características</h3>
                    <ul>
                      <li>Gestión de servicios Funerarios</li>
                      <li>Generaciónde informes</li>
                      <li>Interfaz fácil de usar</li>
                    </ul>
                  </div>
                </div>
        </div>
    </div>
        <script>
            document.addEventListener('DOMContentLoaded', () => {
              const cards = document.querySelectorAll('.info-card');

              cards.forEach((card, index) => {
                card.style.animationDelay = `${index * 0.2}s`;
                card.style.animation = 'fadeIn 0.8s ease-out forwards';
              });
            });
        </script>
        
        
    </body>
</html>
