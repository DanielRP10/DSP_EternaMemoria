/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.time.LocalDate;

/**
 *
 * @author predi
 */
public class CuentaPago {
    int idCuentaPago;
    LocalDate fecha;
    double monto;
    int numeroCuotas;
    int idContrato;

    public CuentaPago() {
    }

    public CuentaPago(LocalDate fecha, double monto, int numeroCuotas, int idContrato) {
        this.fecha = fecha;
        this.monto = monto;
        this.numeroCuotas = numeroCuotas;
        this.idContrato = idContrato;
    }

    public int getIdCuentaPago() {
        return idCuentaPago;
    }

    public void setIdCuentaPago(int idCuentaPago) {
        this.idCuentaPago = idCuentaPago;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public int getNumeroCuotas() {
        return numeroCuotas;
    }

    public void setNumeroCuotas(int numeroCuotas) {
        this.numeroCuotas = numeroCuotas;
    }

    public int getIdContrato() {
        return idContrato;
    }

    public void setIdContrato(int idContrato) {
        this.idContrato = idContrato;
    }

    
}
