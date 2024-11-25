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
public class Contrato {
    int idContrato;
    LocalDate fechaContrato;
    int idCliente;
    String nombreCliente;
    int idPlan;
    int idVendedor;
    String nombreVendedor;
    int totalContratos;

    public Contrato() {
    }

    public Contrato(int idContrato, LocalDate fechaContrato, int idCliente, String nombreCliente, int idPlan, int idVendedor, String nombreVendedor, int totalContratos) {
        this.idContrato = idContrato;
        this.fechaContrato = fechaContrato;
        this.idCliente = idCliente;
        this.nombreCliente = nombreCliente;
        this.idPlan = idPlan;
        this.idVendedor = idVendedor;
        this.nombreVendedor = nombreVendedor;
        this.totalContratos = totalContratos;
    }

    

    public int getIdContrato() {
        return idContrato;
    }

    public void setIdContrato(int idContrato) {
        this.idContrato = idContrato;
    }

    public LocalDate getFechaContrato() {
        return fechaContrato;
    }

    public void setFechaContrato(LocalDate fechaContrato) {
        this.fechaContrato = fechaContrato;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }
    
    public int getIdPlan() {
        return idPlan;
    }

    public void setIdPlan(int idPlan) {
        this.idPlan = idPlan;
    }

    public int getIdVendedor() {
        return idVendedor;
    }

    public void setIdVendedor(int idVendedor) {
        this.idVendedor = idVendedor;
    }

    public String getNombreVendedor() {
        return nombreVendedor;
    }

    public void setNombreVendedor(String nombreVendedor) {
        this.nombreVendedor = nombreVendedor;
    }

    public int getTotalContratos() {
        return totalContratos;
    }

    public void setTotalContratos(int totalContratos) {
        this.totalContratos = totalContratos;
    }
    
}