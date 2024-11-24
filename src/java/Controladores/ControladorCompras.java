/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;

import Modelo.Compras;
import ModeloDAO.ComprasDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Controlador para gestionar las operaciones CRUD de Compras.
 */
public class ControladorCompras extends HttpServlet {
    String listar = "vistas/listaCompras.jsp";
    String add = "vistas/addCompra.jsp";
    String edit = "vistas/editCompras.jsp";
    Compras compra = new Compras();
    ComprasDAO dao = new ComprasDAO();
    int id;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorCompras</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorCompras at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");

        if (action.equalsIgnoreCase("listar")) {
            acceso = listar;
        } else if (action.equalsIgnoreCase("add")) {
            acceso = add;
        } else if (action.equalsIgnoreCase("Agregar")) {
            String fecha = request.getParameter("txtFecha");
            float monto = Float.parseFloat(request.getParameter("txtMonto"));
            int idCli = Integer.parseInt(request.getParameter("txtIdCli"));
            int idCon = Integer.parseInt(request.getParameter("txtIdCon"));
            compra.setFecha(fecha);
            compra.setMontoTotal(monto);
            compra.setIdCliente(idCli);
            compra.setIdContrato(idCon);
            dao.add(compra);
            acceso = listar;
        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idcompra", request.getParameter("id"));
            acceso = edit;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            id = Integer.parseInt(request.getParameter("txtid"));
            String fecha = request.getParameter("txtFecha");
            float monto = Float.parseFloat(request.getParameter("txtMonto"));
            int idCli = Integer.parseInt(request.getParameter("txtIdCli"));
            int idCon = Integer.parseInt(request.getParameter("txtIdCon"));
            compra.setIdCompra(id);
            compra.setFecha(fecha);
            compra.setMontoTotal(monto);
            compra.setIdCliente(idCli);
            compra.setIdContrato(idCon);
            dao.edit(compra);
            acceso = listar;
        } else if (action.equalsIgnoreCase("eliminar")) {
            id = Integer.parseInt(request.getParameter("id"));
            dao.eliminar(id);
            acceso = listar;
        }

        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "ControladorCompras Servlet";
    }
}
