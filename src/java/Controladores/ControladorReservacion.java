/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;

import Modelo.Reservacion;
import ModeloDAO.ReservacionDAO;
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
public class ControladorReservacion extends HttpServlet {

    String listar="vistas/listaReservacion.jsp";
    String add="vistas/addReservacion.jsp";
    String edit="vistas/editReservacion.jsp";
    int id;
    Reservacion r = new Reservacion();
    ReservacionDAO dao = new ReservacionDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorReservacion</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorReservacion at " + request.getContextPath() + "</h1>");
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
        if (action.equalsIgnoreCase("listarReservacion")) {
            acceso=listar;
        }else if(action.equalsIgnoreCase("add")){
            acceso=add;
        }else if(action.equalsIgnoreCase("Agregar")){
            String fechaStr = request.getParameter("txtFecha");
            LocalDate fecha = LocalDate.parse(fechaStr, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            String horaStr = request.getParameter("txtHora");
            LocalTime hora = LocalTime.parse(horaStr, DateTimeFormatter.ofPattern("HH:mm"));
            int idCli = Integer.parseInt(request.getParameter("txtIdCli"));
            
            r.setFecha(fecha);
            r.setHora(hora);
            r.setIdCliente(idCli);
            
            dao.add(r);
            
            acceso=listar;
        }else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("idRe", request.getParameter("id"));
            acceso=edit;
        }else if (action.equalsIgnoreCase("Actualizar")){
            int idReser = Integer.parseInt(request.getParameter("txtIdReser"));
            String fechaStr = request.getParameter("txtFecha");
            LocalDate fecha = LocalDate.parse(fechaStr, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            String horaStr = request.getParameter("txtHora");
            LocalTime hora = LocalTime.parse(horaStr, DateTimeFormatter.ofPattern("HH:mm"));
            int idCli = Integer.parseInt(request.getParameter("txtIdCli"));
            
            r.setIdReservacion(idReser);
            r.setFecha(fecha);
            r.setHora(hora);
            r.setIdCliente(idCli);
            
            dao.edit(r);
            
            acceso=listar;
        }else if (action.equalsIgnoreCase("eliminar")){
            id=Integer.parseInt(request.getParameter("id"));
            r.setIdReservacion(id);
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
