/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;

import Modelo.DetalleVenta;
import ModeloDAO.DetalleVentaDAO;
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
public class ControladorDetallesVentas extends HttpServlet {
    String listar="vistas/listadetVentas.jsp";
    String add="vistas/adddetVentas.jsp";
    String edit="vistas/editdetVentas.jsp";
    DetalleVenta dv=new DetalleVenta();
    DetalleVentaDAO dao=new DetalleVentaDAO();
    int id;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorDetallesVentas</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorDetallesVentas at " + request.getContextPath() + "</h1>");
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
            String dtv = request.getParameter("txtdetalleVenta");
            int idVent = Integer.parseInt(request.getParameter("txtIdV"));
            int idPro = Integer.parseInt(request.getParameter("txtIdP"));
            dv.setDetalleVenta(dtv);
            dv.setIdVenta(idVent);
            dv.setIdProducto(idPro);
            
            dao.add(dv);
            
            acceso=listar;
        }
        else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("iddev",request.getParameter("id"));
            acceso=edit;
        }
        
        else if(action.equalsIgnoreCase("Actualizar")){
            id=Integer.parseInt(request.getParameter("txtid"));
            String detalleV = request.getParameter("txtdetalleVenta");
            int idVent = Integer.parseInt(request.getParameter("txtIdV"));
            int idPro = Integer.parseInt(request.getParameter("txtIdP"));
            dv.setIdDetalleVentas(id);
            dv.setDetalleVenta(detalleV);
            dv.setIdVenta(idVent);
            dv.setIdProducto(idPro);
            dao.edit(dv);
            acceso=listar;
        }
        else if(action.equalsIgnoreCase("eliminar")){
            id=Integer.parseInt(request.getParameter("id"));
            dv.setIdDetalleVentas(id);
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
