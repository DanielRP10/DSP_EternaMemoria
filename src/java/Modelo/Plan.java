/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author predi
 */
public class Plan {
    int idPlan;
    String nombrePlan;
    String descrion;
    double precio;

    public Plan() {
    }

    public Plan( String nombrePlan, String descrion, double precio) {
        this.nombrePlan = nombrePlan;
        this.descrion = descrion;
        this.precio = precio;
    }

    public int getIdPlan() {
        return idPlan;
    }

    public void setIdPlan(int idPlan) {
        this.idPlan = idPlan;
    }

    public String getNombrePlan() {
        return nombrePlan;
    }

    public void setNombrePlan(String nombrePlan) {
        this.nombrePlan = nombrePlan;
    }

    public String getDescripcion() {
        return descrion;
    }

    public void setDescripcion(String descrion) {
        this.descrion = descrion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
    
}
