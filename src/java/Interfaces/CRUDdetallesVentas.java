/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interfaces;

import Modelo.DetalleVenta;
import java.util.List;

/**
 *
 * @author Jennifer Tatiana GF
 */
public interface CRUDdetallesVentas {
    public List listar();
    public DetalleVenta list(int id);
    public boolean add(DetalleVenta dev);
    public boolean edit(DetalleVenta dev);
    public boolean eliminar(int id);
}
