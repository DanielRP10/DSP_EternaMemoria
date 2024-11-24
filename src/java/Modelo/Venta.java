/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.time.LocalDate;

/**
 *
 * @author Jennifer Tatiana GF
 */
public class Venta {
    int idVenta;
    LocalDate fecha;
    Double montoTotal;
    int idCliente;
    int idContrato;

    public Venta(int idVenta, LocalDate fecha, Double montoTotal, int idCliente, int idContrato) {
        this.idVenta = idVenta;
        this.fecha = fecha;
        this.montoTotal = montoTotal;
        this.idCliente = idCliente;
        this.idContrato = idContrato;
    }

    public Venta(){
        
    }
    
    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public Double getMontoTotal() {
        return montoTotal;
    }

    public void setMontoTotal(Double montoTotal) {
        this.montoTotal = montoTotal;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdContrato() {
        return idContrato;
    }

    public void setIdContrato(int idContrato) {
        this.idContrato = idContrato;
    }
       
}
