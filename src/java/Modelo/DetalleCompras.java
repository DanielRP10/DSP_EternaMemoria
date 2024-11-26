/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author macma
 */
public class DetalleCompras {
    
    int idDetalleCompra;
    int cantidad;
    float precio;
    int idCompra;
    int idProducto;
    String nombrePro;

    public DetalleCompras(int idDetalleCompra, int cantidad, float precio, int idCompra, int idProducto) {
        this.idDetalleCompra = idDetalleCompra;
        this.cantidad = cantidad;
        this.precio = precio;
        this.idCompra = idCompra;
        this.idProducto = idProducto;
    }
    
    public DetalleCompras(){
    }
    
    public int getIdDetalleCompra() {
        return idDetalleCompra;
    }

    public void setIdDetalleCompra(int idDetalleCompra) {
        this.idDetalleCompra = idDetalleCompra;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public int getIdCompra() {
        return idCompra;
    }

    public void setIdCompra(int idCompra) {
        this.idCompra = idCompra;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombrePro() {
        return nombrePro;
    }

    public void setNombrePro(String nombrePro) {
        this.nombrePro = nombrePro;
    }
    
    
}
