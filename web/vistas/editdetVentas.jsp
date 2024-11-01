<%-- 
    Document   : editdetVentas
    Created on : 1 nov 2024, 14:03:30
    Author     : Jennifer Tatiana GF
--%>
<%@page import="Modelo.DetalleVenta"%>
<%@page import="ModeloDAO.DetalleVentaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-6">
            <%
              DetalleVentaDAO dao=new DetalleVentaDAO();
              int id=Integer.parseInt((String)request.getAttribute("iddev"));
              DetalleVenta dev=(DetalleVenta)dao.list(id);
            %>
            <h1>Modificar Detalle de Venta</h1>
            <form action="ControladorDetallesVentas">
                Detalle Ventas:<br>
                <input class="form-control" type="text" name="txtdetalleVenta" value="<%= dev.getDetalleVenta()%>"><br>
                
                <input type="hidden" name="txtid" value="<%= dev.getIdDetalleVentas()%>">
                <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"> 
                <a href="ControladorDetallesVentas?accion=listar">Regresar</a>
            </form>
          </div>
          
        </div>
    </body>
</html>
