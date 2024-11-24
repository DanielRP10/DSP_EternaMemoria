/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import Config.Conexion;
import Interfaces.CRUDCuentaPago;
import Modelo.CuentaPago;
import Modelo.Reservacion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author predi
 */
public class CuentaPagoDAO implements CRUDCuentaPago{
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    CuentaPago cp = new CuentaPago();

    @Override
    public List listarCuentaPago() {
        ArrayList<CuentaPago>list = new  ArrayList<>();
        String sql = "SELECT * FROM cuotaPagos";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                CuentaPago cuentapago = new CuentaPago();
                cuentapago.setIdCuentaPago(rs.getInt("idCuentaPago"));
                cuentapago.setFecha(rs.getDate("fecha").toLocalDate());
                cuentapago.setMonto(rs.getDouble("monto"));
                cuentapago.setNumeroCuotas(rs.getInt("numeroCuotas"));
                cuentapago.setIdContrato(rs.getInt("idContrato"));
                list.add(cuentapago);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public CuentaPago list(int id) {
        String sql = "SELECT * FROM cuotaPagos where idCuentaPago="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                cp.setIdCuentaPago(rs.getInt("idCuentaPago"));
                cp.setFecha(rs.getDate("fecha").toLocalDate());
                cp.setMonto(rs.getDouble("monto"));
                cp.setNumeroCuotas(rs.getInt("numeroCuotas"));
                cp.setIdContrato(rs.getInt("idContrato"));
                cp.setIdContrato(rs.getInt("idCpontrato"));
            }
        } catch (Exception e) {
        }
        return cp;
    }

    @Override
    public boolean add(CuentaPago cuentaP) {
        String sql = "INSERT INTO cuotaPagos (fecha, monto, numeroCuotas, idContrato) "
                + "VALUES ('"+cuentaP.getFecha()+"','"+cuentaP.getMonto()+"','"+cuentaP.getNumeroCuotas()+"','"+cuentaP.getIdContrato()+"')";
        
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeQuery();
            
        } catch (Exception e) {
        }
        
        return false;
    }

    @Override
    public boolean edit(CuentaPago cuentaP) {
        String sql = "UPDATE cuotaPagos SET fecha='"+cuentaP.getFecha()+"',monto='"+cuentaP.getMonto()+
                "',numeroCuotas='"+cuentaP.getNumeroCuotas()+"',idContrato='"+cuentaP.getIdContrato()+"'WHERE idCuentaPago="+cuentaP.getIdCuentaPago();
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
        String sql = "DELETE FROM cuotaPagos WHERE idCuentaPago="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeQuery();
        } catch (Exception e) {
        }
        return false;
    }
    
}
