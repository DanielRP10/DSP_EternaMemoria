<%-- 
    Document   : listadetVentas
    Created on : 1 nov 2024, 13:53:27
    Author     : Jennifer Tatiana GF
--%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.DetalleVenta"%>
<%@page import="java.util.List"%>
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
            <h1>Detalle de Ventas</h1>
            <a class="btn btn-success" href="ControladorDetallesVentas?accion=add">Agregar Nuevo</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">ID DETALLE VENTA</th>
                        <th class="text-center">DETALLE VENTAS</th>
                    </tr>
                </thead>
                <%
                    DetalleVentaDAO dao=new DetalleVentaDAO();
                    List<DetalleVenta>list=dao.listar();
                    Iterator<DetalleVenta>iter=list.iterator();
                    DetalleVenta dev=null;
                    while(iter.hasNext()){
                        dev=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= dev.getIdDetalleVentas()%></td>
                        <td class="text-center"><%= dev.getDetalleVenta()%></td>
                        <td class="text-center">
                            <a class="btn btn-warning" href="ControladorDetallesVentas?accion=editar&id=<%= dev.getIdDetalleVentas()%>">Editar</a>
                            <a class="btn btn-danger" href="ControladorDetallesVentas?accion=eliminar&id=<%= dev.getIdDetalleVentas()%>">Eliminar</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>
