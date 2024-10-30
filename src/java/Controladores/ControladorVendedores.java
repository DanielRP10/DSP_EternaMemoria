/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;

import Modelo.Vendedor;
import ModeloDAO.VendedorDAO;
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
public class ControladorVendedores extends HttpServlet {
    String listar="vistas/listaVendedor.jsp";
    String add="vistas/addVendedor.jsp";
    String edit="vistas/editVendedor.jsp";
    Vendedor v=new Vendedor();
    VendedorDAO dao=new VendedorDAO();
    int id;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorVendedores</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorVendedores at " + request.getContextPath() + "</h1>");
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
            String telefono=request.getParameter("txtTelefono");
            String correo = request.getParameter("txtCorreo");
            String dui = request.getParameter("txtDUI");
            v.setNombre(nombre);
            v.setTelefono(telefono);
            v.setCorreo(correo);
            v.setDui(dui);
            dao.add(v);
            acceso=listar;
        }
        else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("idvend",request.getParameter("id"));
            acceso=edit;
        }
        
        else if(action.equalsIgnoreCase("Actualizar")){
            id=Integer.parseInt(request.getParameter("txtid"));
            String nombre=request.getParameter("txtNombre");
            String telefono=request.getParameter("txtTelefono");
            String correo=request.getParameter("txtCorreo");
            String dui=request.getParameter("txtDUI");
            v.setIdVendedor(id);
            v.setNombre(nombre);
            v.setTelefono(telefono);
            v.setCorreo(correo);
            v.setDui(dui);
            dao.edit(v);
            acceso=listar;
        }
        else if(action.equalsIgnoreCase("eliminar")){
            id=Integer.parseInt(request.getParameter("id"));
            v.setIdVendedor(id);
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
