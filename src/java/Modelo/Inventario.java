/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author Jennifer Tatiana GF
 */
public class Inventario {
    int idInventario;
    String descripcion;
    int cantidad;

    public Inventario(int idInventario, String descripcion, int cantidad) {
        this.idInventario = idInventario;
        this.descripcion = descripcion;
        this.cantidad = cantidad;
    }

    public Inventario(){
        
    }
    
    public int getIdInventario() {
        return idInventario;
    }

    public void setIdInventario(int idInventario) {
        this.idInventario = idInventario;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
    
}
