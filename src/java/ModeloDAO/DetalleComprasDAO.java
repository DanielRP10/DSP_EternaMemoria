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
import Interfaces.CRUDDetalleCompras;
import Modelo.DetalleCompras;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DetalleComprasDAO implements CRUDDetalleCompras {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DetalleCompras detalle = new DetalleCompras();
    
    @Override
    public List listar() {
        ArrayList<DetalleCompras> list = new ArrayList<>();
        String sql = "SELECT * FROM DetalleCompras dtp inner join productos pro on dtp.idProducto=pro.idProducto";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetalleCompras detalleCompra = new DetalleCompras();
                detalleCompra.setIdDetalleCompra(rs.getInt("idDetalleCompra"));
                detalleCompra.setCantidad(rs.getInt("cantidad"));
                detalleCompra.setPrecio(rs.getFloat("precio"));
                detalleCompra.setIdCompra(rs.getInt("idCompra"));
                detalleCompra.setIdProducto(rs.getInt("idProducto"));
                detalleCompra.setNombrePro(rs.getString("nombre"));
                list.add(detalleCompra);
            }
        } catch (Exception e) {
            System.out.println("Error al listar detalles de compra: " + e.getMessage());
        }
        return list;
    }
    
    @Override
    public DetalleCompras list(int id) {
        String sql = "SELECT * FROM DetalleCompras WHERE idDetalleCompra=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                detalle.setIdDetalleCompra(rs.getInt("idDetalleCompra"));
                detalle.setCantidad(rs.getInt("cantidad"));
                detalle.setPrecio(rs.getFloat("precio"));
                detalle.setIdCompra(rs.getInt("idCompra"));
                detalle.setIdProducto(rs.getInt("idProducto"));
            }
        } catch (Exception e) {
            System.out.println("Error al obtener detalle de compra: " + e.getMessage());
        }
        return detalle;
    }
    
    @Override
    public boolean add(DetalleCompras detalleCompra) {
        String sql = "INSERT INTO DetalleCompras(cantidad, precio, idCompra, idProducto) VALUES(?, ?, ?, ?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, detalleCompra.getCantidad());
            ps.setFloat(2, detalleCompra.getPrecio());
            ps.setInt(3, detalleCompra.getIdCompra());
            ps.setInt(4, detalleCompra.getIdProducto());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error al agregar detalle de compra: " + e.getMessage());
        }
        return false;
    }
    
    @Override
    public boolean edit(DetalleCompras detalleCompra) {
        String sql = "UPDATE DetalleCompras SET cantidad=?, precio=?, idCompra=?, idProducto=? WHERE idDetalleCompra=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, detalleCompra.getCantidad());
            ps.setFloat(2, detalleCompra.getPrecio());
            ps.setInt(3, detalleCompra.getIdCompra());
            ps.setInt(4, detalleCompra.getIdProducto());
            ps.setInt(5, detalleCompra.getIdDetalleCompra());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error al editar detalle de compra: " + e.getMessage());
        }
        return false;
    }
    
    @Override
    public boolean eliminar(int id) {
        String sql = "DELETE FROM DetalleCompras WHERE idDetalleCompra=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error al eliminar detalle de compra: " + e.getMessage());
        }
        return false;
    }
}
