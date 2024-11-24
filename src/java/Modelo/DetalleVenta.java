/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author Jennifer Tatiana GF
 */
public class DetalleVenta {
    int idDetalleVentas;
    String detalleVenta;
    int idVenta;
    int idProducto;

    public DetalleVenta(int idDetalleVentas, String detalleVenta, int idVenta, int idProducto) {
        this.idDetalleVentas = idDetalleVentas;
        this.detalleVenta = detalleVenta;
        this.idVenta = idVenta;
        this.idProducto = idProducto;
    }
    
    public DetalleVenta(){
    
    }

    public int getIdDetalleVentas() {
        return idDetalleVentas;
    }

    public void setIdDetalleVentas(int idDetalleVentas) {
        this.idDetalleVentas = idDetalleVentas;
    }

    public String getDetalleVenta() {
        return detalleVenta;
    }

    public void setDetalleVenta(String detalleVenta) {
        this.detalleVenta = detalleVenta;
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }
    
    
}
