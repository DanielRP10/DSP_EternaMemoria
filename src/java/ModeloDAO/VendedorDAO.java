/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import Config.Conexion;
import Interfaces.CRUDVendedores;
import Modelo.Vendedor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Jennifer Tatiana GF
 */
public class VendedorDAO implements CRUDVendedores{
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Vendedor v=new Vendedor();
    
    @Override
    public List listar() {
        ArrayList<Vendedor>list=new ArrayList<>();
        String sql="select * from vendedores";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Vendedor vend=new Vendedor();
                vend.setIdVendedor(rs.getInt("idVendedor"));
                vend.setNombre(rs.getString("nombre"));
                vend.setTelefono(rs.getString("telefono"));
                vend.setCorreo(rs.getString("correo"));
                vend.setDui(rs.getString("dui"));
                list.add(vend);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    @Override
    public Vendedor list(int id) {
        String sql="select * from vendedores where idVendedor="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){                
                v.setIdVendedor(rs.getInt("idVendedor"));
                v.setNombre(rs.getString("nombre"));
                v.setTelefono(rs.getString("telefono"));
                v.setCorreo(rs.getString("correo"));
                v.setDui(rs.getString("dui"));
                
            }
        } catch (Exception e) {
        }
        return v;
    }

    @Override
    public boolean add(Vendedor vend) {
       String sql="insert into vendedores(nombre, telefono, correo, dui)values('"+vend.getNombre()+"','"+vend.getTelefono()+"','"+vend.getCorreo()+"', '"+vend.getDui()+"')";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }

    @Override
    public boolean edit(Vendedor vend) {
        String sql="update vendedores set nombre='"+vend.getNombre()+"',telefono='"+vend.getTelefono()+"', correo='"+vend.getCorreo()+"', dui = '"+vend.getDui()+"' where idVendedor="+vend.getIdVendedor();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    public boolean eliminar(int id) {
        String sql="delete from vendedores where idVendedor="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
