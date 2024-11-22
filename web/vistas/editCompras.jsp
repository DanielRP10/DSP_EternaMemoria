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
    <title>Editar Compra</title>
    <%
            if (session == null || session.getAttribute("usuario") == null) {
                response.sendRedirect("../index.jsp");
                return;
            }
        %>
</head>
<body>
    <div class="container">
        <h2 class="my-4">Editar Compra</h2>
        <%
            ComprasDAO dao = new ComprasDAO();
            int id = Integer.parseInt((String) request.getAttribute("idcompra"));
            Compras compra = dao.list(id);
        %>
        <form action="ControladorCompras" method="post">
            Fecha:<br>
            <input class="form-control" type="date" name="txtFecha" value="<%= compra.getFecha() %>" required><br>
            Monto Total:<br>
            <input class="form-control" type="number" step="0.01" name="txtMonto" value="<%= compra.getMontoTotal() %>" required><br>
            ID Cliente:<br>
            <input class="form-control" type="number" name="txtIdCli" value="<%= compra.getIdCliente() %>" required><br>
            ID Contrato:<br>
            <input class="form-control" type="number" name="txtIdCon" value="<%= compra.getIdContrato() %>" required><br>
            <input type="hidden" name="txtid" value="<%= compra.getIdCompra() %>">
            <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"> 
            <a class="btn btn-secondary" href="ControladorCompras?accion=listar">Cancelar</a>
        </form>
    </div>
</body>
</html>
