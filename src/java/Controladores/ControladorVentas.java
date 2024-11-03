/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;

import Modelo.Venta;
import ModeloDAO.VentaDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author Jennifer Tatiana GF
 */
public class ControladorVentas extends HttpServlet {
    String listar="vistas/listaVentas.jsp";
    String add="vistas/addVentas.jsp";
    String edit="vistas/editVentas.jsp";
    Venta V=new Venta();
    VentaDAO dao=new VentaDAO();
    int id;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorVentas</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorVentas at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso="";
        String action=request.getParameter("accion");
        if(action.equalsIgnoreCase("listar")){
            acceso=listar;          
        }else if(action.equalsIgnoreCase("add")){
            acceso=add;
        }
        else if(action.equalsIgnoreCase("Agregar")){
            String fechaStr = request.getParameter("txtFecha");
            LocalDate fecha = LocalDate.parse(fechaStr, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            double monto= Double.parseDouble(request.getParameter("txtMonto"));
            int idCli = Integer.parseInt(request.getParameter("txtIdCli"));
            int idCon = Integer.parseInt(request.getParameter("txtIdCon"));
            V.setFecha(fecha);
            V.setMontoTotal(monto);
            V.setIdCliente(idCli);
            V.setIdContrato(idCon);
            dao.add(V);
            acceso=listar;
        }
        else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("idvent",request.getParameter("id"));
            acceso=edit;
        }
        
        else if(action.equalsIgnoreCase("Actualizar")){
            id=Integer.parseInt(request.getParameter("txtid"));
            String fechaStr = request.getParameter("txtFecha");
            LocalDate fecha = LocalDate.parse(fechaStr, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            double monto= Double.parseDouble(request.getParameter("txtMonto"));
            int idCli = Integer.parseInt(request.getParameter("txtIdCli"));
            int idCon = Integer.parseInt(request.getParameter("txtIdCon"));
            V.setIdVenta(id);
            V.setFecha(fecha);
            V.setMontoTotal(monto);
            V.setIdCliente(idCli);
            V.setIdContrato(idCon);
            dao.edit(V);
            acceso=listar;
        }
        else if(action.equalsIgnoreCase("eliminar")){
            id=Integer.parseInt(request.getParameter("id"));
            V.setIdVenta(id);
            dao.eliminar(id);
            acceso=listar;
        }
        
        RequestDispatcher vista=request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
}
