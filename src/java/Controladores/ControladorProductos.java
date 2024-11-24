/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;


import Modelo.Productos;
import ModeloDAO.ProductosDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ControladorProductos extends HttpServlet {
    String listar = "vistas/listaProductos.jsp";
    String add = "vistas/addProducto.jsp";
    String edit = "vistas/editProducto.jsp";
    Productos producto = new Productos();
    ProductosDAO dao = new ProductosDAO();
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
            String nombre = request.getParameter("txtNombre");
            float precio = Float.parseFloat(request.getParameter("txtPrecio"));
            String descripcion = request.getParameter("txtDescripcion");
            int idInventario = Integer.parseInt(request.getParameter("txtIdInventario"));
            
            producto.setNombre(nombre);
            producto.setPrecio(precio);
            producto.setDescripcion(descripcion);
            producto.setIdInventario(idInventario);
            dao.add(producto);
            
            acceso = listar;
        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idprod", request.getParameter("id"));
            acceso = edit;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            id = Integer.parseInt(request.getParameter("txtid"));
            String nombre = request.getParameter("txtNombre");
            float precio = Float.parseFloat(request.getParameter("txtPrecio"));
            String descripcion = request.getParameter("txtDescripcion");
            int idInventario = Integer.parseInt(request.getParameter("txtIdInventario"));
            
            producto.setIdProducto(id);
            producto.setNombre(nombre);
            producto.setPrecio(precio);
            producto.setDescripcion(descripcion);
            producto.setIdInventario(idInventario);
            dao.edit(producto);
            
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
        return "Controlador para las operaciones CRUD de Productos";
    }
}
