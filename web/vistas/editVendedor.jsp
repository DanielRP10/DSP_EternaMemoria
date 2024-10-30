<%-- 
    Document   : editVendedor
    Created on : 30 oct 2024, 10:52:26
    Author     : Jennifer Tatiana GF
--%>
<%@page import="Modelo.Vendedor"%>
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
            <div class="col-lg-6">
            <%
              VendedorDAO dao=new VendedorDAO();
              int id=Integer.parseInt((String)request.getAttribute("idvend"));
              Vendedor v=(Vendedor)dao.list(id);
            %>
            <h1>Modificar Vendedor</h1>
            <form action="ControladorVendedores">
                Nombre:<br>
                <input class="form-control" type="text" name="txtNombre" value="<%= v.getNombre()%>"><br>
                Telefono: <br>
                <input class="form-control" type="text" name="txtTelefono" value="<%= v.getTelefono()%>"><br>
                Correo:<br>
                <input class="form-control" type="email" name="txtCorreo" value="<%= v.getCorreo()%>"><br>
                Telefono: <br>
                <input class="form-control" type="text" name="txtDUI" value="<%= v.getDui()%>"><br>
                
                <input type="hidden" name="txtid" value="<%= v.getIdVendedor()%>">
                <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"> 
                <a href="ControladorVendedores?accion=listar">Regresar</a>
            </form>
          </div>
          
        </div>
    </body>
</html>
