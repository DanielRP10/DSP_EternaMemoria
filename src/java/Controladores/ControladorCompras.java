/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;

import Modelo.Compras;
import ModeloDAO.ComprasDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");

        if (action.equalsIgnoreCase("listar")) {
            acceso = listar;
        } else if (action.equalsIgnoreCase("add")) {
            acceso = add;
        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idcompra", request.getParameter("id"));
            acceso = edit;
        } else if (action.equalsIgnoreCase("eliminar")) {
            id = Integer.parseInt(request.getParameter("id"));
            dao.eliminar(id);
            acceso = listar;
        }

        // Redirigir a la vista correspondiente
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");

        if (action.equalsIgnoreCase("Agregar")) {
            // Recuperar datos del formulario
            String fecha = request.getParameter("txtFecha");
            float monto = Float.parseFloat(request.getParameter("txtMonto"));
            int idCli = Integer.parseInt(request.getParameter("txtIdCli"));
            int idCon = Integer.parseInt(request.getParameter("txtIdCon"));

            // Configurar el objeto compra
            compra.setFecha(fecha);
            compra.setMontoTotal(monto);
            compra.setIdCliente(idCli);
            compra.setIdContrato(idCon);

            // Agregar la compra usando el DAO
            dao.add(compra);

            // Redirigir a la lista de compras
            acceso = listar;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            // Recuperar datos para actualizar
            id = Integer.parseInt(request.getParameter("txtid"));
            String fecha = request.getParameter("txtFecha");
            float monto = Float.parseFloat(request.getParameter("txtMonto"));
            int idCli = Integer.parseInt(request.getParameter("txtIdCli"));
            int idCon = Integer.parseInt(request.getParameter("txtIdCon"));

            // Configurar el objeto compra actualizado
            compra.setIdCompra(id);
            compra.setFecha(fecha);
            compra.setMontoTotal(monto);
            compra.setIdCliente(idCli);
            compra.setIdContrato(idCon);

            // Actualizar en la base de datos
            dao.edit(compra);

            // Redirigir a la lista de compras
            acceso = listar;
        } else if (action.equalsIgnoreCase("Cancelar")) {
            // Redirigir a la lista si se cancela
            acceso = listar;
        }

        // Redirigir a la vista correspondiente
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "ControladorCompras Servlet";
    }
}
