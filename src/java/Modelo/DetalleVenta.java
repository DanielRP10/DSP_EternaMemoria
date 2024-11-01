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

    public DetalleVenta(int idDetalleVentas, String detalleVenta) {
        this.idDetalleVentas = idDetalleVentas;
        this.detalleVenta = detalleVenta;
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
    
    
}
