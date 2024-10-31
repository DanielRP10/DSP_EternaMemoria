<%-- 
    Document   : listaVentas
    Created on : 31 oct 2024, 13:08:14
    Author     : Jennifer Tatiana GF
--%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Venta"%>
<%@page import="java.util.List"%>
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
            <h1>Ventas</h1>
            <a class="btn btn-success" href="ControladorVentas?accion=add">Agregar Nuevo</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">ID VENTA</th>
                        <th class="text-center">FECHA</th>
                        <th class="text-center">MONTO</th>
                    </tr>
                </thead>
                <%
                    VentaDAO dao=new VentaDAO();
                    List<Venta>list=dao.listar();
                    Iterator<Venta>iter=list.iterator();
                    Venta vent=null;
                    while(iter.hasNext()){
                        vent=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= vent.getIdVenta()%></td>
                        <td class="text-center"><%= vent.getFecha()%></td>
                        <td><%= vent.getMontoTotal()%></td>
                        <td class="text-center">
                            <a class="btn btn-warning" href="ControladorVentas?accion=editar&id=<%= vent.getIdVenta()%>">Editar</a>
                            <a class="btn btn-danger" href="ControladorVentas?accion=eliminar&id=<%= vent.getIdVenta()%>">Eliminar</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>
