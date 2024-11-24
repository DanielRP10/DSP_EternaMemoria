/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;

import Modelo.Usuario;
import ModeloDAO.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author predi
 */
public class ControladorUsuario extends HttpServlet {
    
    UsuarioDAO dao = new UsuarioDAO();
    Usuario u = new Usuario();
    int r;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String accion = request.getParameter("accion");
        if (accion.equals("Ingresar")) {
            String usuario = request.getParameter("txtUsuario");
            String password = request.getParameter("txtPassword");
            u.setUsuario(usuario);
            u.setPassword(password);
            r=dao.Validar(u);
            if (r == 1) {
                request.getSession().setAttribute("usuario", usuario);
                request.getRequestDispatcher("vistas/home.jsp").forward(request, response);
            }else{
                request.setAttribute("error", "Credenciales incorrectas. Intente de nuevo.");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
       }else if (accion.equals("CerrarSesion")) {
            request.getSession().invalidate();
            response.sendRedirect("index.jsp");
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
        processRequest(request, response);
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
