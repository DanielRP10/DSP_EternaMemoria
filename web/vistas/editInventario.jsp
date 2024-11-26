<%-- 
    Document   : editInventario
    Created on : 3 nov 2024, 14:57:59
    Author     : Jennifer Tatiana GF
--%>
<%@page import="Modelo.Inventario"%>
<%@page import="ModeloDAO.InventarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <title>Editar Inventario</title>
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
                            <h5 class="mb-0">Lista de Inventario</h5>
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
                                InventarioDAO dao=new InventarioDAO();
                                int id=Integer.parseInt((String)request.getAttribute("idI"));
                                Inventario i=(Inventario)dao.list(id);
                              %>
                              <h1>Modificar Inventario</h1>
                              <form action="ControladorInventarios">
                                  Descripcion:<br>
                                  <input class="form-control" type="text" name="txtDes" value="<%= i.getDescripcion()%>"><br>
                                  Cantidad: <br>
                                  <input class="form-control" type="number" name="txtC" value="<%= i.getCantidad()%>"><br>

                                  <input type="hidden" name="txtid" value="<%= i.getIdInventario()%>">
                                  <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"> 
                                  <a class="btn btn-primary"  href="ControladorInventarios?accion=listar">Regresar</a>
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
