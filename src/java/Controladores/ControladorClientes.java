/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;

import Modelo.Cliente;
import ModeloDAO.ClienteDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Jennifer Tatiana GF
 */
public class ControladorClientes extends HttpServlet {
    String listar="vistas/listaCliente.jsp";
    String add="vistas/addCliente.jsp";
    String edit="vistas/editCliente.jsp";
    Cliente c=new Cliente();
    ClienteDAO dao=new ClienteDAO();
    int id;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorClientes</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorClientes at " + request.getContextPath() + "</h1>");
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
            String nombre=request.getParameter("txtNombre");
            String apellido = request.getParameter("txtApellido");
            String telefono=request.getParameter("txtTelefono");
            String dui = request.getParameter("txtDUI");
            c.setNombre(nombre);
            c.setApellido(apellido);
            c.setTelefono(telefono);
            c.setDui(dui);
            dao.add(c);
            acceso=listar;
        }
        else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("idCli",request.getParameter("id"));
            acceso=edit;
        }
        
        else if(action.equalsIgnoreCase("Actualizar")){
            int idCl=Integer.parseInt(request.getParameter("txtidC"));
            String nombre=request.getParameter("txtNombre");
            String apellido = request.getParameter("txtApellido");
            String telefono=request.getParameter("txtTelefono");
            String dui=request.getParameter("txtDUI");
            c.setIdCliente(idCl);
            c.setNombre(nombre);
            c.setApellido(apellido);
            c.setTelefono(telefono);
            c.setDui(dui);
            dao.edit(c);
            acceso=listar;
        }
        
        else if(action.equalsIgnoreCase("eliminar")){
            id=Integer.parseInt(request.getParameter("id"));
            c.setIdCliente(id);
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
