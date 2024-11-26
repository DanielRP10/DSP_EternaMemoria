/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

/**
 *
 * @author macma
 */


import Config.Conexion;
import Interfaces.CRUDCompras;
import Modelo.Compras;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ComprasDAO implements CRUDCompras {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Compras compra = new Compras();

    @Override
    public List<Compras> listar() {
        ArrayList<Compras> list = new ArrayList<>();
        String sql = "SELECT * FROM Compras com inner join clientes cli on com.idCliente=cli.idcliente";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Compras comp = new Compras();
                comp.setIdCompra(rs.getInt("idCompra"));
                comp.setFecha(rs.getString("fecha"));
                comp.setMontoTotal(rs.getFloat("montoTotal"));
                comp.setIdCliente(rs.getInt("idCliente"));
                comp.setNombreCliente(rs.getString("nombre"));
                comp.setIdContrato(rs.getInt("idContrato"));
                list.add(comp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Compras list(int id) {
        String sql = "SELECT * FROM Compras WHERE idCompra = " + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                compra.setIdCompra(rs.getInt("idCompra"));
                compra.setFecha(rs.getString("fecha"));
                compra.setMontoTotal(rs.getFloat("montoTotal"));
                compra.setIdCliente(rs.getInt("idCliente"));
                compra.setIdContrato(rs.getInt("idContrato"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return compra;
    }

    @Override
    public boolean add(Compras comp) {
        String sql = "INSERT INTO Compras (fecha, montoTotal, idCliente, idContrato) VALUES (?, ?, ?, ?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, comp.getFecha());
            ps.setFloat(2, comp.getMontoTotal());
            ps.setInt(3, comp.getIdCliente());
            ps.setInt(4, comp.getIdContrato());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean edit(Compras comp) {
        String sql = "UPDATE Compras SET fecha = ?, montoTotal = ?, idCliente = ?, idContrato = ? WHERE idCompra = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, comp.getFecha());
            ps.setFloat(2, comp.getMontoTotal());
            ps.setInt(3, comp.getIdCliente());
            ps.setInt(4, comp.getIdContrato());
            ps.setInt(5, comp.getIdCompra());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean eliminar(int id) {
        String sql = "DELETE FROM Compras WHERE idCompra = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
