/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import Config.Conexion;
import Interfaces.Validar;
import Modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author predi
 */
public class UsuarioDAO implements Validar{
    
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Usuario u = new Usuario();

    @Override
    public int Validar(Usuario user) {
        
        int r = 0;
        String sql = "SELECT * FROM usuarios WHERE usuario = ?";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, user.getUsuario());
            rs = ps.executeQuery();

            if (rs.next()) {
                String hashedPassword = rs.getString("password"); // El hash almacenado
                if (BCrypt.checkpw(user.getPassword(), hashedPassword)) {
                    r = 1; // Contraseña válida
                    user.setUsuario(rs.getString("usuario"));
                    user.setPassword(hashedPassword); // Opcional: guardar el hash si necesitas usarlo
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Ayuda a depurar si algo falla
        }

        return r;
    }

    @Override
    public List listarUsuario() {
        ArrayList<Usuario>list = new  ArrayList<>();
        String sql = "SELECT * FROM usuarios us inner join vendedores ven on us.idVendedor=ven.idVendedor";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setIdLogin(rs.getInt("idLogin"));
                usuario.setUsuario(rs.getString("usuario"));
                usuario.setPassword(rs.getString("password"));
                usuario.setIdVendedor(rs.getInt("idVendedor"));
                usuario.setNombre(rs.getString("nombre"));
                list.add(usuario);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public Usuario list(int id) {
        String sql = "SELECT * FROM usuarios where idLogin="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                u.setIdLogin(rs.getInt("idLogin"));
                u.setUsuario(rs.getString("usuario"));
                u.setPassword(rs.getString("password"));
                u.setIdVendedor(rs.getInt("idVendedor"));
            }
        } catch (Exception e) {
        }
        return u;
    }

    @Override
    public boolean add(Usuario user) {
        String sql = "INSERT INTO usuarios (usuario, password, idVendedor) "
                + "VALUES ('"+user.getUsuario()+"','"+user.getPassword()+"','"+user.getIdVendedor()+"')";
        
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeQuery();
            
        } catch (Exception e) {
        }
        
        return false;
    }

    @Override
    public boolean edit(Usuario user) {
        String sql = "UPDATE usuarios SET usuario='"+user.getUsuario()+"',password='"+user.getPassword()+
                "',idVendedor='"+user.getIdVendedor()+"'WHERE idLogin="+user.getIdLogin();
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
        String sql = "DELETE FROM usuarios WHERE idLogin="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeQuery();
        } catch (Exception e) {
        }
        return false;
    }
    
}
