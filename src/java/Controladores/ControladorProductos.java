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

    // Rutas de vistas
    String listar = "vistas/listaProductos.jsp";
    String add = "vistas/addProductos.jsp";
    String edit = "vistas/editProductos.jsp";

    // Instancias de modelo y DAO
    Productos producto = new Productos();
    ProductosDAO dao = new ProductosDAO();
    int id;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");

        try {
            if (action == null) {
                // Si no hay acción, redirigir a la lista por defecto
                acceso = listar;
            } else if (action.equalsIgnoreCase("listar")) {
                acceso = listar;
            } else if (action.equalsIgnoreCase("add")) {
                acceso = add;
            } else if (action.equalsIgnoreCase("Agregar")) {
                // Agregar un nuevo producto
                agregarProducto(request);
                acceso = listar;
            } else if (action.equalsIgnoreCase("editar")) {
                // Redirigir al formulario de edición
                request.setAttribute("idprod", request.getParameter("id"));
                acceso = edit;
            } else if (action.equalsIgnoreCase("Actualizar")) {
                // Actualizar un producto existente
                actualizarProducto(request);
                acceso = listar;
            } else if (action.equalsIgnoreCase("eliminar")) {
                // Eliminar un producto
                id = Integer.parseInt(request.getParameter("id"));
                dao.eliminar(id);
                acceso = listar;
            } else {
                // Acción no reconocida, redirigir a lista
                acceso = listar;
            }
        } catch (Exception e) {
            // Manejo básico de errores
            request.setAttribute("error", "Error al procesar la solicitud: " + e.getMessage());
            acceso = listar; // Redirigir a la lista en caso de error
        }

        // Redirigir a la vista correspondiente
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    // Métodos auxiliares para organizar lógica
    private void agregarProducto(HttpServletRequest request) throws NumberFormatException {
        String nombre = request.getParameter("txtNombre");
        String descripcion = request.getParameter("txtDescripcion");

        // Validar y convertir parámetros
        float precio = parseFloatSafe(request.getParameter("txtPrecio"));
        int idInventario = parseIntSafe(request.getParameter("txtIdInventario"));

        // Configurar producto
        producto.setNombre(nombre);
        producto.setPrecio(precio);
        producto.setDescripcion(descripcion);
        producto.setIdInventario(idInventario);

        // Guardar en la base de datos
        dao.add(producto);
    }

    private void actualizarProducto(HttpServletRequest request) throws NumberFormatException {
        id = parseIntSafe(request.getParameter("txtid"));
        String nombre = request.getParameter("txtNombre");
        String descripcion = request.getParameter("txtDescripcion");

        // Validar y convertir parámetros
        float precio = parseFloatSafe(request.getParameter("txtPrecio"));
        int idInventario = parseIntSafe(request.getParameter("txtIdInventario"));

        // Configurar producto
        producto.setIdProducto(id);
        producto.setNombre(nombre);
        producto.setPrecio(precio);
        producto.setDescripcion(descripcion);
        producto.setIdInventario(idInventario);

        // Actualizar en la base de datos
        dao.edit(producto);
    }

    // Métodos auxiliares para conversión segura
    private float parseFloatSafe(String value) {
        try {
            return Float.parseFloat(value);
        } catch (NumberFormatException e) {
            return 0.0f; // Valor predeterminado
        }
    }

    private int parseIntSafe(String value) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return 0; // Valor predeterminado
        }
    }

    @Override
    public String getServletInfo() {
        return "Controlador para las operaciones CRUD de Productos";
    }
}
