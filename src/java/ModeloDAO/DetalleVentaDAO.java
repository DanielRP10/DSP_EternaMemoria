/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import Config.Conexion;
import Interfaces.CRUDdetallesVentas;
import Modelo.DetalleVenta;
import Modelo.Venta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Jennifer Tatiana GF
 */
public class DetalleVentaDAO implements CRUDdetallesVentas{
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DetalleVenta dv=new DetalleVenta();
    
    @Override
    public List listar() {
        ArrayList<DetalleVenta>list=new ArrayList<>();
        String sql="select * from detalleVentas";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                DetalleVenta dev=new DetalleVenta();
                dev.setIdDetalleVentas(rs.getInt("idDetalleVentas"));
                dev.setDetalleVenta(rs.getString("detalleVenta"));
                dev.setIdVenta(rs.getInt("idVenta"));
                dev.setIdProducto(rs.getInt("idProducto"));
                list.add(dev);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    @Override
    public DetalleVenta list(int id) {
        String sql="select * from detalleVentas where idDetalleVentas="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){                
                dv.setIdDetalleVentas(rs.getInt("idDetalleVentas"));
                dv.setDetalleVenta(rs.getString("detalleVenta"));
                dv.setIdVenta(rs.getInt("idVenta"));
                dv.setIdProducto(rs.getInt("idProducto"));
                
            }
        } catch (Exception e) {
        }
        return dv;
    }

    @Override
    public boolean add(DetalleVenta dev) {
       String sql="insert into detalleVentas(detalleVenta, idVenta, idProducto)values('"+dev.getDetalleVenta()+"','"+dev.getIdVenta()+"','"+dev.getIdProducto()+"')";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }

    @Override
    public boolean edit(DetalleVenta dev) {
        String sql="update detalleVentas set detalleVenta='"+dev.getDetalleVenta()+"',idVenta='"+dev.getIdVenta()+"' ,idProducto='"+dev.getIdProducto()+"'  where idDetalleVentas="+dev.getIdDetalleVentas();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean eliminar(int id) {
        String sql="delete from detalleVentas where idDetalleVentas="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
}
