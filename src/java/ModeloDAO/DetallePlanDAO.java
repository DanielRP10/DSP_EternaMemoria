/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import Config.Conexion;
import Interfaces.CRUDDetallePlan;
import Modelo.DetallePlan;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author predi
 */
public class DetallePlanDAO implements CRUDDetallePlan{
    
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DetallePlan dp = new DetallePlan();

    @Override
    public List listarDetallePlan() {
        ArrayList<DetallePlan>list = new  ArrayList<>();
        String sql = "SELECT * FROM detallePlanes dp inner join productos pro on dp.idProducto=pro.idProducto "
                + "inner join planes pl on dp.idPlan=pl.idPlan;";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                DetallePlan detapla = new DetallePlan();
                detapla.setIdDetallePlanes(rs.getInt("idDetallePlanes"));
                detapla.setNombreDetallePlan(rs.getString("nombreDetallePlan"));
                detapla.setDescripcion(rs.getString("descripcion"));
                detapla.setCantidad(rs.getInt("cantidad"));
                detapla.setIdProducto(rs.getInt("idProducto"));
                detapla.setNombreProducto(rs.getString("nombre"));
                detapla.setIdPlan(rs.getInt("idPlan"));
                detapla.setNombrePlan(rs.getString("nombrePlan"));
                list.add(detapla);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public DetallePlan list(int id) {
        String sql = "SELECT * FROM detallePlanes where idDetallePlanes="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                dp.setIdDetallePlanes(rs.getInt("idDetallePlanes"));
                dp.setNombreDetallePlan(rs.getString("nombreDetallePlan"));
                dp.setDescripcion(rs.getString("descripcion"));
                dp.setCantidad(rs.getInt("cantidad"));
                dp.setIdProducto(rs.getInt("idProducto"));
                dp.setIdPlan(rs.getInt("idPlan"));
            }
        } catch (Exception e) {
        }
        return dp;
    }

    @Override
    public boolean add(DetallePlan DP) {
        String sql = "INSERT INTO detallePlanes (nombreDetallePlan, descripcion, cantidad, idProducto, idPlan) "
                + "VALUES ('"+DP.getNombreDetallePlan()+"','"+DP.getDescripcion()+"','"+DP.getCantidad()+"','"+DP.getIdProducto()+"','"+DP.getIdPlan()+"')";
        
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeQuery();
            
        } catch (Exception e) {
        }
        
        return false;
    }

    @Override
    public boolean edit(DetallePlan DP) {
        String sql = "UPDATE detallePlanes SET nombreDetallePlan='"+DP.getNombreDetallePlan()+"',descripcion='"+DP.getDescripcion()+
                "',cantidad='"+DP.getCantidad()+"',idProducto='"+DP.getIdProducto()+"',idPlan='"+DP.getIdPlan()+"'WHERE idDetallePlanes="+DP.getIdDetallePlanes();
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
        String sql = "DELETE FROM detallePlanes WHERE idDetallePlanes="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeQuery();
        } catch (Exception e) {
        }
        return false;
    }
    
}
