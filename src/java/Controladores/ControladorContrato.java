/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;

import Modelo.Contrato;
import ModeloDAO.ContratoDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author predi
 */
public class ControladorContrato extends HttpServlet {

    String listar="vistas/listaContrato.jsp";
    String add="vistas/addContrato.jsp";
    String edit="vistas/editContrato.jsp";
    int id;
    Contrato c = new Contrato();
    ContratoDAO dao = new ContratoDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorContrato</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorContrato at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("listarContrato")) {
            acceso=listar;
        }else if(action.equalsIgnoreCase("add")){
            acceso=add;
        }else if(action.equalsIgnoreCase("Agregar")){
            String fechaStr = request.getParameter("txtFechaContrato");
            LocalDate fecha = LocalDate.parse(fechaStr, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            int idCli = Integer.parseInt(request.getParameter("txtIdCli"));
            int idPlan = Integer.parseInt(request.getParameter("txtIdPlan"));
            int idVendedor = Integer.parseInt(request.getParameter("txtIdVendedor"));
            
            c.setFechaContrato(fecha);
            c.setIdCliente(idCli);
            c.setIdPlan(idPlan);
            c.setIdVendedor(idVendedor);
            
            dao.add(c);
            
            acceso=listar;
        }else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("idCon", request.getParameter("id"));
            acceso=edit;
        }else if (action.equalsIgnoreCase("Actualizar")){
            int idContrato = Integer.parseInt(request.getParameter("txtIdContrato"));
            String fechaStr = request.getParameter("txtFechaContrato");
            LocalDate fecha = LocalDate.parse(fechaStr, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            int idCli = Integer.parseInt(request.getParameter("txtIdCli"));
            int idPlan = Integer.parseInt(request.getParameter("txtIdPlan"));
            int idVendedor = Integer.parseInt(request.getParameter("txtIdVendedor"));
            
            c.setIdContrato(idContrato);
            c.setFechaContrato(fecha);
            c.setIdCliente(idCli);
            c.setIdPlan(idPlan);
            c.setIdVendedor(idVendedor);
            
            dao.edit(c);
            
            acceso=listar;
        }else if (action.equalsIgnoreCase("eliminar")){
            id=Integer.parseInt(request.getParameter("id"));
            c.setIdContrato(id);
            dao.eliminar(id);
            acceso=listar;
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
