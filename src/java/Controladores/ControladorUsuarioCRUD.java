/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controladores;

import Interfaces.Validar;
import Modelo.Usuario;
import ModeloDAO.UsuarioDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author predi
 */
public class ControladorUsuarioCRUD extends HttpServlet {

    String listar="vistas/listaUsuario.jsp";
    String add="vistas/addUsuario.jsp";
    String edit="vistas/editUsuario.jsp";
    int id;
    Usuario u = new Usuario();
    UsuarioDAO dao = new UsuarioDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorUsuarioCRUD</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorUsuarioCRUD at " + request.getContextPath() + "</h1>");
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
        if (action.equalsIgnoreCase("listarUsuario")) {
            acceso=listar;
        }else if(action.equalsIgnoreCase("add")){
            acceso=add;
        }else if(action.equalsIgnoreCase("Agregar")){
            String usuario = request.getParameter("txtUsuario");
            String password = request.getParameter("txtPassword");
            int idVen = Integer.parseInt(request.getParameter("txtIdVendedor"));
            
            String hashPassword = BCrypt.hashpw(password, BCrypt.gensalt());
            
            u.setUsuario(usuario);
            u.setPassword(hashPassword);
            u.setIdVendedor(idVen);
            
            dao.add(u);
            
            acceso=listar;
        }else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("iduser", request.getParameter("id"));
            acceso=edit;
        }else if (action.equalsIgnoreCase("Actualizar")){
            int idLogin = Integer.parseInt(request.getParameter("txtIdLogin"));
            String usuario = request.getParameter("txtUsuario");
            String password = request.getParameter("txtPassword");
            int idVen = Integer.parseInt(request.getParameter("txtIdVendedor"));
            
            String hashPassword = BCrypt.hashpw(password, BCrypt.gensalt());
            
            u.setIdLogin(idLogin);
            u.setUsuario(usuario);
            u.setPassword(hashPassword);
            u.setIdVendedor(idVen);
            
            dao.edit(u);
            
            acceso=listar;
        }else if (action.equalsIgnoreCase("eliminar")){
            id=Integer.parseInt(request.getParameter("id"));
            u.setIdLogin(id);
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
