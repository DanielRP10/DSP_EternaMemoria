/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;

import Modelo.Plan;
import ModeloDAO.PlanDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author predi
 */
public class ControladorPlan extends HttpServlet {

    String listar="vistas/listaPlan.jsp";
    String add="vistas/addPlan.jsp";
    String edit="vistas/editPlan.jsp";
    int id;
    Plan p = new Plan();
    PlanDAO dao = new PlanDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorPlan</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorPlan at " + request.getContextPath() + "</h1>");
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
        if (action.equalsIgnoreCase("listarPlan")) {
            acceso=listar;
        }else if(action.equalsIgnoreCase("add")){
            acceso=add;
        }else if(action.equalsIgnoreCase("Agregar")){
            String nombrePlan = request.getParameter("txtNombrePlan");
            String descripcion = request.getParameter("txtDescripcion");
            double precio = Double.parseDouble(request.getParameter("txtPrecio"));
            
            p.setNombrePlan(nombrePlan);
            p.setDescripcion(descripcion);
            p.setPrecio(precio);
            
            dao.add(p);
            
            acceso=listar;
        }else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("idplan", request.getParameter("id"));
            acceso=edit;
        }else if (action.equalsIgnoreCase("Actualizar")){
            int idPlan = Integer.parseInt(request.getParameter("txtIdPlan"));
            String nombrePlan = request.getParameter("txtNombrePlan");
            String descripcion = request.getParameter("txtDescripcion");
            double precio = Double.parseDouble(request.getParameter("txtPrecio"));
            
            p.setIdPlan(idPlan);
            p.setNombrePlan(nombrePlan);
            p.setDescripcion(descripcion);
            p.setPrecio(precio);
            
            dao.edit(p);
            
            acceso=listar;
        }else if (action.equalsIgnoreCase("eliminar")){
            id=Integer.parseInt(request.getParameter("id"));
            p.setIdPlan(id);
            dao.eliminar(id);
            acceso=listar;
        }
        
        if (action.equalsIgnoreCase("datosGraficosPlan")) {
            // Configuración de respuesta JSON
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            List<Plan> planes = dao.listarPlan(); 

            // Construcción del JSON
            StringBuilder json = new StringBuilder("[");
            for (Plan plan : planes) {
                json.append("{")
                    .append("\"nombre\":\"").append(plan.getNombrePlan()).append("\",")
                    .append("\"precio\":").append(plan.getPrecio())
                    .append("},");
            }
            if (json.charAt(json.length() - 1) == ',') {
                json.deleteCharAt(json.length() - 1); 
            }
            json.append("]");
            out.print(json.toString());
            out.flush();
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
