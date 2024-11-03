/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import Config.Conexion;
import Interfaces.CRUDCliente;
import Modelo.Cliente;
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
public class ClienteDAO implements CRUDCliente{
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Cliente c=new Cliente();
    
    @Override
    public List listar() {
        ArrayList<Cliente>list=new ArrayList<>();
        String sql="select * from clientes";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Cliente cl=new Cliente();
                cl.setIdCliente(rs.getInt("idCliente"));
                cl.setNombre(rs.getString("nombre"));
                cl.setApellido(rs.getString("apellido"));
                cl.setTelefono(rs.getString("telefono"));
                cl.setDui(rs.getString("dui"));
                list.add(cl);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    @Override
    public Cliente list(int id) {
        String sql="select * from clientes where idCliente="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){         
                c.setIdCliente(rs.getInt("idCliente"));
                c.setNombre(rs.getString("nombre"));
                c.setApellido(rs.getString("apellido"));
                c.setTelefono(rs.getString("telefono"));
                c.setDui(rs.getString("dui"));
                
            }
        } catch (Exception e) {
        }
        return c;
    }

    @Override
    public boolean add(Cliente cl) {
       String sql = "INSERT INTO clientes(nombre, apellido, telefono, dui) VALUES ('" 
              + cl.getNombre() + "', '" 
              + cl.getApellido() + "', '" 
              + cl.getTelefono() + "', '" 
              + cl.getDui() + "')";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }

    /**
     *
     * @param cl
     * @return
     */
    @Override
    public boolean edit(Cliente cl) {
        String sql = "UPDATE clientes SET nombre='" 
              + cl.getNombre() + "', apellido='" 
              + cl.getApellido() + "', telefono='" 
              + cl.getTelefono() + "', dui='" 
              + cl.getDui() + "' WHERE idCliente=" 
              + cl.getIdCliente();
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
        String sql="delete from clientes where idCliente="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
}
