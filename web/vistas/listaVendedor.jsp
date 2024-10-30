<%-- 
    Document   : listaVendedor
    Created on : 30 oct 2024, 10:52:06
    Author     : Jennifer Tatiana GF
--%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Vendedor"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.VendedorDAO"%>
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
            <h1>Vendedores</h1>
            <a class="btn btn-success" href="ControladorVendedores?accion=add">Agregar Nuevo</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">ID VENDEDOR</th>
                        <th class="text-center">NOMBRE</th>
                        <th class="text-center">TELEFONO</th>
                        <th class="text-center">CORREO</th>
                        <th class="text-center">DUI</th>
                    </tr>
                </thead>
                <%
                    VendedorDAO dao=new VendedorDAO();
                    List<Vendedor>list=dao.listar();
                    Iterator<Vendedor>iter=list.iterator();
                    Vendedor vend=null;
                    while(iter.hasNext()){
                        vend=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= vend.getIdVendedor()%></td>
                        <td class="text-center"><%= vend.getNombre()%></td>
                        <td><%= vend.getTelefono()%></td>
                        <td><%= vend.getCorreo()%></td>
                        <td><%= vend.getDui()%></td>
                        <td class="text-center">
                            <a class="btn btn-warning" href="ControladorVendedores?accion=editar&id=<%= vend.getIdVendedor()%>">Editar</a>
                            <a class="btn btn-danger" href="ControladorVendedores?accion=eliminar&id=<%= vend.getIdVendedor()%>">Eliminar</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>
