/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author Jennifer Tatiana GF
 */
public class Vendedor {
    int idVendedor;
    String nombre;
    String telefono;
    String correo;
    String dui;

    public Vendedor(int idVendedor, String nombre, String telefono, String correo, String dui) {
        this.idVendedor = idVendedor;
        this.nombre = nombre;
        this.telefono = telefono;
        this.correo = correo;
        this.dui = dui;
    }
    
    public Vendedor(){
        
    }

    public int getIdVendedor() {
        return idVendedor;
    }

    public void setIdVendedor(int idVendedor) {
        this.idVendedor = idVendedor;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getDui() {
        return dui;
    }

    public void setDui(String dui) {
        this.dui = dui;
    }
    
}
