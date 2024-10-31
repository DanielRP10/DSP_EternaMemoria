<%-- 
    Document   : editVentas
    Created on : 31 oct 2024, 13:08:04
    Author     : Jennifer Tatiana GF
--%>
<%@page import="Modelo.Venta"%>
<%@page import="ModeloDAO.VentaDAO"%>
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
              VentaDAO dao=new VentaDAO();
              int id=Integer.parseInt((String)request.getAttribute("idvent"));
              Venta V=(Venta)dao.list(id);
            %>
            <h1>Modificar Vendedor</h1>
            <form action="ControladorVentas">
                Fecha:<br>
                <input class="form-control" type="date" name="txtFecha" value="<%= V.getFecha()%>"><br>
                Monto: <br>
                <input class="form-control" type="number" name="txtMonto" step="0.10" value="<%= V.getMontoTotal()%>"><br>
                
                <input type="hidden" name="txtid" value="<%= V.getIdVenta()%>">
                <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"> 
                <a href="ControladorVentas?accion=listar">Regresar</a>
            </form>
          </div>
          
        </div>
    </body>
</html>
