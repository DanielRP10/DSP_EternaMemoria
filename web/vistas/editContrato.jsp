<%-- 
    Document   : editContrato
    Created on : 3 nov 2024, 19:32:29
    Author     : predi
--%>

<%@page import="Modelo.Contrato"%>
<%@page import="ModeloDAO.ContratoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <title>Editar Contrato</title>
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
                            <h5 class="mb-0">Modificar Contrato</h5>
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
                        <!-- Sección Default -->
                        <div id="default-section" class="dashboard-section active">
                            <%
                                ContratoDAO dao=new ContratoDAO();
                                int id=Integer.parseInt((String)request.getAttribute("idCon"));
                                Contrato c=(Contrato)dao.list(id);
                             %>
                            <form action="ControladorContrato">
                                Fecha de Contrato:<br>
                                <input class="form-control" type="date" name="txtFechaContrato" value="<%= c.getFechaContrato()%>"<br>
                                ID Cliente: <br>
                                <input class="form-control" type="text" name="txtIdCli" value="<%= c.getIdCliente()%>"<br>
                                ID Plan: <br>
                                <input class="form-control" type="text" name="txtIdPlan" value="<%= c.getIdPlan()%>"><br>
                                ID Vendedor: <br>
                                <input class="form-control" type="text" name="txtIdVendedor" value="<%= c.getIdVendedor()%>"><br>
                                <input type="hidden" name="txtIdContrato" value="<%= c.getIdContrato()%>">
                                <input class="btn btn-primary" type="submit" name="accion" value="Actualizar">
                                <a class="btn btn-primary" href="ControladorContrato?accion=listarContrato">Regresar</a>
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

