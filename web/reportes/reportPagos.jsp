<%-- 
    Document   : reportPagos
    Created on : 24 nov 2024, 16:03:08
    Author     : Jennifer Tatiana GF
--%>

<%@page import="java.sql.Connection"%>
<%@page import="jakarta.servlet.ServletContext"%>
<%@page import="Config.Conexion"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.io.File"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.data.JRBeanCollectionDataSource"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          Connection con;
          Conexion conex = new Conexion();
          con = conex.getConnection();
          ServletContext context = request.getServletContext();
          File reporte = new File(context.getRealPath("/")+"/vistas/reportPagos.jasper");
          Map parametro= new HashMap();
          byte[] bytes = JasperRunManager.runReportToPdf(reporte.getPath(), parametro, con);
          response.setContentType("application/PDF");
          response.setContentLength(bytes.length);
          ServletOutputStream Salida = response.getOutputStream();
          Salida.write(bytes,0,bytes.length);
          Salida.flush();
          Salida.close();
        %>
    </body>
</html>
