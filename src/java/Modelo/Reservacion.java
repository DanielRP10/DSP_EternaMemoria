/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author predi
 */
public class Reservacion {
    int idReservacion;
    LocalDate fecha;
    LocalTime hora;
    int idCliente;
    int totalReservaciones;
    int anio; 

    public Reservacion() {
    }

    public Reservacion(LocalDate fecha, LocalTime hora, int idCliente, int totalReservaciones) {
        this.fecha = fecha;
        this.hora = hora;
        this.idCliente = idCliente;
        this.totalReservaciones = totalReservaciones;
    }

    public int getIdReservacion() {
        return idReservacion;
    }

    public void setIdReservacion(int idReservacion) {
        this.idReservacion = idReservacion;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public LocalTime getHora() {
        return hora;
    }

    public void setHora(LocalTime hora) {
        this.hora = hora;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getTotalReservaciones() {
        return totalReservaciones;
    }

    public void setTotalReservaciones(int totalReservaciones) {
        this.totalReservaciones = totalReservaciones;
    }
    
    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }
    
    
}
