/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import Config.Conexion;
import Interfaces.CRUDInventario;
import Modelo.Inventario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
/**
 *
 * @author Jennifer Tatiana GF
 */
public class InventarioDAO implements CRUDInventario{
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Inventario i=new Inventario();
    
    @Override
    public List listar() {
        ArrayList<Inventario>list=new ArrayList<>();
        String sql="select * from inventarios";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Inventario in=new Inventario();
                in.setIdInventario(rs.getInt("idInventario"));
                in.setDescripcion(rs.getString("descripcion"));
                in.setCantidad(rs.getInt("cantidad"));
                
                list.add(in);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    @Override
    public Inventario list(int id) {
        String sql="select * from inventarios where idInventario="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){                
                i.setIdInventario(rs.getInt("idInventario"));
                i.setDescripcion(rs.getString("descripcion"));
                i.setCantidad(rs.getInt("cantidad"));

            }
        } catch (Exception e) {
        }
        return i;
    }

    @Override
    public boolean add(Inventario in) {
       String sql="insert into inventarios(descripcion, cantidad)values('"+in.getDescripcion()+"','"+in.getCantidad()+"')";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }

    @Override
    public boolean edit(Inventario in) {
        String sql="update inventarios set descripcion='"+in.getDescripcion()+"',cantidad='"+in.getCantidad()+"' where idInventario="+in.getIdInventario();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    public boolean eliminar(int id) {
        String sql="delete from inventarios where idInventario="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
