/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author predi
 */
public class DetallePlan {
    int idDetallePlanes;
    String nombreDetallePlan;
    String descripcion;
    int cantidad;
    int idProducto;
    int idPlan;

    public DetallePlan() {
    }

    public DetallePlan(String nombreDetallePlan, String descripcion, int cantidad, int idProducto, int idPlan) {
        this.nombreDetallePlan = nombreDetallePlan;
        this.descripcion = descripcion;
        this.cantidad = cantidad;
        this.idProducto = idProducto;
        this.idPlan = idPlan;
    }

    public int getIdDetallePlanes() {
        return idDetallePlanes;
    }

    public void setIdDetallePlanes(int idDetallePlanes) {
        this.idDetallePlanes = idDetallePlanes;
    }

    public String getNombreDetallePlan() {
        return nombreDetallePlan;
    }

    public void setNombreDetallePlan(String nombreDetallePlan) {
        this.nombreDetallePlan = nombreDetallePlan;
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

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getIdPlan() {
        return idPlan;
    }

    public void setIdPlan(int idPlan) {
        this.idPlan = idPlan;
    }

    
}
