/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interfaces;

/**
 *
 * @author macma
 */

import Modelo.Productos;
import java.util.List;

public interface CRUDProductos {
    public List listar();
    public Productos list(int id);
    public boolean add(Productos producto);
    public boolean edit(Productos producto);
    public boolean eliminar(int id);
}
