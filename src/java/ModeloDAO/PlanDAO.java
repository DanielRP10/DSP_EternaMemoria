/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import Config.Conexion;
import Interfaces.CRUDPlan;
import Modelo.Plan;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author predi
 */
public class PlanDAO implements CRUDPlan{
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Plan p = new Plan();

    @Override
    public List listarPlan() {
        ArrayList<Plan>list = new  ArrayList<>();
        String sql = "SELECT * FROM planes";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                Plan plan = new Plan();
                plan.setIdPlan(rs.getInt("idPlan"));
                plan.setNombrePlan(rs.getString("nombrePlan"));
                plan.setDescripcion(rs.getString("descripcion"));
                plan.setPrecio(rs.getDouble("precio"));
                list.add(plan);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public Plan list(int id) {
        String sql = "SELECT * FROM planes where idPlan="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                p.setIdPlan(rs.getInt("idPlan"));
                p.setNombrePlan(rs.getString("nombrePlan"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setPrecio(rs.getDouble("precio"));
            }
        } catch (Exception e) {
        }
        return p;
    }

    @Override
    public boolean add(Plan plan) {
        String sql = "INSERT INTO planes (nombrePlan, descripcion, precio) "
                + "VALUES ('"+plan.getNombrePlan()+"','"+plan.getDescripcion()+"','"+plan.getPrecio()+"')";
        
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeQuery();
            
        } catch (Exception e) {
        }
        
        return false;
    }

    @Override
    public boolean edit(Plan plan) {
        String sql = "UPDATE planes SET nombrePlan='"+plan.getNombrePlan()+"',descripcion='"+plan.getDescripcion()+
                "',precio='"+plan.getPrecio()+"'WHERE idPlan="+plan.getIdPlan();
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
        String sql = "DELETE FROM planes WHERE idPlan="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeQuery();
        } catch (Exception e) {
        }
        return false;
    }
    
}
