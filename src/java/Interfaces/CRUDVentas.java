/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interfaces;

import Modelo.Venta;
import java.util.List;

/**
 *
 * @author Jennifer Tatiana GF
 */
public interface CRUDVentas {
    public List listar();
    public Venta list(int id);
    public boolean add(Venta vent);
    public boolean edit(Venta vent);
    public boolean eliminar(int id);
}
