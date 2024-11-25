/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import Config.Conexion;
import Interfaces.CRUDContrato;
import Modelo.Contrato;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author predi
 */
public class ContratoDAO implements CRUDContrato{

    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Contrato c = new Contrato();
    
    @Override
    public List listarContrato() {
        ArrayList<Contrato>list = new  ArrayList<>();
        String sql = "SELECT * FROM contratos con inner join clientes cli on con.idCliente=cli.idcliente";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                Contrato contra = new Contrato();
                contra.setIdContrato(rs.getInt("idContrato"));
                contra.setFechaContrato(rs.getDate("fechaContrato").toLocalDate());
                contra.setIdCliente(rs.getInt("idCliente"));
                contra.setNombreCliente(rs.getString("nombre"));
                contra.setIdPlan(rs.getInt("idPlan"));
                contra.setIdVendedor(rs.getInt("idVendedor"));
                list.add(contra);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public Contrato list(int id) {
        
        String sql = "SELECT * FROM contratos where idContrato="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                c.setIdContrato(rs.getInt("idContrato"));
                c.setFechaContrato(rs.getDate("fechaContrato").toLocalDate());
                c.setIdCliente(rs.getInt("idCliente"));
                c.setIdPlan(rs.getInt("idPlan"));
                c.setIdVendedor(rs.getInt("idVendedor"));
            }
        } catch (Exception e) {
        }
        return c;
    }

    @Override
    public boolean add(Contrato contra) {
        String sql = "INSERT INTO contratos (fechaContrato, idCliente, idPlan, idVendedor) "
                + "VALUES ('"+contra.getFechaContrato()+"','"+contra.getIdCliente()+"','"+contra.getIdPlan()+"','"+contra.getIdVendedor()+"')";
        
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeQuery();
            
        } catch (Exception e) {
        }
        
        return false;
    }

    @Override
    public boolean edit(Contrato contra) {
        String sql = "UPDATE contratos SET fechaContrato='"+contra.getFechaContrato()+"',idCliente='"+contra.getIdCliente()+
                "',idPlan='"+contra.getIdPlan()+"',idVendedor='"+contra.getIdVendedor()+"'WHERE idContrato="+contra.getIdContrato();
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
        String sql = "DELETE FROM contratos WHERE idContrato="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeQuery();
        } catch (Exception e) {
        }
        return false;
    }
    
    public List<Contrato> listarContratoTablero() {
        ArrayList<Contrato> list = new ArrayList<>();
        String sql = "SELECT v.idVendedor, v.nombre AS nombreVendedor, COUNT(c.idContrato) AS totalContratos " +
                     "FROM contratos c " +
                     "INNER JOIN vendedores v ON c.idVendedor = v.idVendedor " +
                     "GROUP BY v.idVendedor, v.nombre " +
                     "ORDER BY totalContratos DESC";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Contrato contra = new Contrato();
                contra.setIdVendedor(rs.getInt("idVendedor"));
                contra.setNombreVendedor(rs.getString("nombreVendedor"));
                contra.setTotalContratos(rs.getInt("totalContratos")); // Agrega un campo en tu modelo si no lo tienes
                list.add(contra);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    
}