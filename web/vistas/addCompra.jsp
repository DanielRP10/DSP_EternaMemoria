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
        <h2 class="my-4">Agregar Nueva Compra</h2>
        <form action="ControladorCompras" method="post">
            Fecha:<br>
            <input class="form-control" type="date" name="txtFecha" required><br>
            Monto Total:<br>
            <input class="form-control" type="number" step="0.01" name="txtMonto" required><br>
            ID Cliente:<br>
            <input class="form-control" type="number" name="txtIdCli" required><br>
            ID Contrato:<br>
            <input class="form-control" type="number" name="txtIdCon" required><br>
            <input class="btn btn-primary" type="submit" name="accion" value="Agregar"> 
            <a class="btn btn-secondary" href="ControladorCompras?accion=listar">Cancelar</a>
       
        </form>
    </div>
</body>
</html>
