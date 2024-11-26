/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import Config.Conexion;
import Interfaces.CRUDVentas;
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
public class VentaDAO implements CRUDVentas{
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Venta V=new Venta();
    
    @Override
    public List listar() {
        ArrayList<Venta>list=new ArrayList<>();
        String sql="select * from Ventas";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Venta vent=new Venta();
                vent.setIdVenta(rs.getInt("idVenta"));
                vent.setFecha(rs.getDate("fecha").toLocalDate());
                vent.setMontoTotal(rs.getDouble("montoTotal"));
                vent.setIdCliente(rs.getInt("idCliente"));
                vent.setIdContrato(rs.getInt("idContrato"));
                list.add(vent);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    @Override
    public Venta list(int id) {
        String sql="select * from Ventas where idVenta="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){                
                V.setIdVenta(rs.getInt("idVenta"));
                String fechaStr = rs.getString("fecha");
                LocalDate fecha = LocalDate.parse(fechaStr, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                V.setMontoTotal(rs.getDouble("montoTotal"));
                V.setIdCliente(rs.getInt("idCliente"));
                V.setIdContrato(rs.getInt("idContrato"));
                V.setFecha(fecha);
                
            }
        } catch (Exception e) {
        }
        return V;
    }

    @Override
    public boolean add(Venta vent) {
       String sql="insert into Ventas(fecha, montoTotal, idCliente, idContrato)values('"+vent.getFecha()+"','"+vent.getMontoTotal()+"', '"+vent.getIdCliente()+"', '"+vent.getIdContrato()+"')";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }

    @Override
    public boolean edit(Venta vent) {
        String sql="update Ventas set fecha='"+vent.getFecha()+"',montoTotal='"+vent.getMontoTotal()+"',idCliente='"+vent.getIdCliente()+"',idContrato='"+vent.getIdContrato()+"' where idVenta="+vent.getIdVenta();
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
        String sql="delete from Ventas where idVenta="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
    public List<Venta> listarVentasTop5() {
        ArrayList<Venta> list = new ArrayList<>();
        String sql = "SELECT TOP 5 " +
                     "c.nombre, " +
                     "SUM(v.montoTotal) AS totalVentas " +
                     "FROM Ventas v " +
                     "JOIN clientes c ON v.idCliente = c.idCliente " +
                     "WHERE MONTH(v.fecha) = MONTH(GETDATE()) " +
                     "AND YEAR(v.fecha) = YEAR(GETDATE()) " +
                     "GROUP BY v.idCliente, c.nombre " +
                     "ORDER BY totalVentas DESC";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Venta venta = new Venta();
                venta.setNombreCliente(rs.getString("nombre")); // Nombre del cliente
                venta.setTotalVentas(rs.getDouble("totalVentas")); // Total de ventas
                list.add(venta);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
}
