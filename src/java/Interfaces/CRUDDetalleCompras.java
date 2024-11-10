/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interfaces;

/**
 *
 * @author macma
 */


import Modelo.DetalleCompras;
import java.util.List;

public interface CRUDDetalleCompras {
    public List listar();
    public DetalleCompras list(int id);
    public boolean add(DetalleCompras detalleCompra);
    public boolean edit(DetalleCompras detalleCompra);
    public boolean eliminar(int id);
}
