/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import Config.Conexion;
import Interfaces.CRUDReservacion;
import Modelo.Reservacion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author predi
 */
public class ReservacionDAO implements CRUDReservacion{
    
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Reservacion r = new Reservacion();
    
    @Override
    public List listarReservacion() {
        ArrayList<Reservacion>list = new  ArrayList<>();
        String sql = "SELECT * FROM reservaciones";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                Reservacion reser = new Reservacion();
                reser.setIdReservacion(rs.getInt("idReservacion"));
                reser.setFecha(rs.getDate("fecha").toLocalDate());
                reser.setHora(rs.getTime("hora").toLocalTime());
                reser.setIdCliente(rs.getInt("idCliente"));
                list.add(reser);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public Reservacion list(int id) {
        String sql = "SELECT * FROM reservaciones where idReservacion="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                r.setIdReservacion(rs.getInt("idReservacion"));
                r.setFecha(rs.getDate("fecha").toLocalDate());
                r.setHora(rs.getTime("hora").toLocalTime());
                r.setIdCliente(rs.getInt("idCliente"));
            }
        } catch (Exception e) {
        }
        return r;
    }

    @Override
    public boolean add(Reservacion reser) {
        String sql = "INSERT INTO reservaciones (fecha, hora, idCliente) "
                + "VALUES ('"+reser.getFecha()+"','"+reser.getHora()+"','"+reser.getIdCliente()+"')";
        
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeQuery();
            
        } catch (Exception e) {
        }
        
        return false;
    }

    @Override
    public boolean edit(Reservacion reser) {
        String sql = "UPDATE reservaciones SET fecha='"+reser.getFecha()+"',hora='"+reser.getHora()+
                "',idCliente='"+reser.getIdCliente()+"'WHERE idReservacion="+reser.getIdReservacion();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeQuery();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean eliminar(int id) {
        String sql = "DELETE FROM Reservaciones WHERE idReservacion="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeQuery();
        } catch (Exception e) {
        }
        return false;
    }
    
}
