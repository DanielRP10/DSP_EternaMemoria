/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controladores;

/**
 *
 * @author macma
 */

import Modelo.DetalleCompras;
import ModeloDAO.DetalleComprasDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ControladorDetallesCompra extends HttpServlet {
    String listar = "vistas/listaDetallesCompra.jsp";
    String add = "vistas/addDetalleCompra.jsp";
    String edit = "vistas/editDetalleCompra.jsp";
    DetalleCompras detalle = new DetalleCompras();
    DetalleComprasDAO dao = new DetalleComprasDAO();
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
        } else if (action.equalsIgnoreCase("Agregar")) {
            int cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
            float precio = Float.parseFloat(request.getParameter("txtPrecio"));
            int idCompra = Integer.parseInt(request.getParameter("txtIdCompra"));
            int idProducto = Integer.parseInt(request.getParameter("txtIdProducto"));
            
            detalle.setCantidad(cantidad);
            detalle.setPrecio(precio);
            detalle.setIdCompra(idCompra);
            detalle.setIdProducto(idProducto);
            dao.add(detalle);
            
            acceso = listar;
        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("iddetallecompra", request.getParameter("id"));
            acceso = edit;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            id = Integer.parseInt(request.getParameter("txtid"));
            int cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
            float precio = Float.parseFloat(request.getParameter("txtPrecio"));
            int idCompra = Integer.parseInt(request.getParameter("txtIdCompra"));
            int idProducto = Integer.parseInt(request.getParameter("txtIdProducto"));
            
            detalle.setIdDetalleCompra(id);
            detalle.setCantidad(cantidad);
            detalle.setPrecio(precio);
            detalle.setIdCompra(idCompra);
            detalle.setIdProducto(idProducto);
            dao.edit(detalle);
            
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
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Controlador para las operaciones CRUD de DetalleCompras";
    }
}
