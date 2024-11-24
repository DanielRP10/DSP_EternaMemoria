/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

/**
 *
 * @author macma
 */


import Config.Conexion;
import Interfaces.CRUDProductos;
import Modelo.Productos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductosDAO implements CRUDProductos {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Productos producto = new Productos();
    
    @Override
    public List listar() {
        ArrayList<Productos> list = new ArrayList<>();
        String sql = "SELECT * FROM Productos";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Productos prod = new Productos();
                prod.setIdProducto(rs.getInt("idProducto"));
                prod.setNombre(rs.getString("nombre"));
                prod.setPrecio(rs.getFloat("precio"));
                prod.setDescripcion(rs.getString("descripcion"));
                prod.setIdInventario(rs.getInt("idInventario"));
                list.add(prod);
            }
        } catch (Exception e) {
            System.out.println("Error al listar productos: " + e.getMessage());
        }
        return list;
    }
    
    @Override
    public Productos list(int id) {
        String sql = "SELECT * FROM Productos WHERE idProducto=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                producto.setIdProducto(rs.getInt("idProducto"));
                producto.setNombre(rs.getString("nombre"));
                producto.setPrecio(rs.getFloat("precio"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setIdInventario(rs.getInt("idInventario"));
            }
        } catch (Exception e) {
            System.out.println("Error al obtener producto: " + e.getMessage());
        }
        return producto;
    }
    
    @Override
    public boolean add(Productos producto) {
        String sql = "INSERT INTO Productos(nombre, precio, descripcion, idInventario) VALUES(?, ?, ?, ?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, producto.getNombre());
            ps.setFloat(2, producto.getPrecio());
            ps.setString(3, producto.getDescripcion());
            ps.setInt(4, producto.getIdInventario());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error al agregar producto: " + e.getMessage());
        }
        return false;
    }
    
    @Override
    public boolean edit(Productos producto) {
        String sql = "UPDATE Productos SET nombre=?, precio=?, descripcion=?, idInventario=? WHERE idProducto=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, producto.getNombre());
            ps.setFloat(2, producto.getPrecio());
            ps.setString(3, producto.getDescripcion());
            ps.setInt(4, producto.getIdInventario());
            ps.setInt(5, producto.getIdProducto());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error al editar producto: " + e.getMessage());
        }
        return false;
    }
    
    @Override
    public boolean eliminar(int id) {
        String sql = "DELETE FROM Productos WHERE idProducto=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error al eliminar producto: " + e.getMessage());
        }
        return false;
    }
}
