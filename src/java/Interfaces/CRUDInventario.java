/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interfaces;

import Modelo.Inventario;
import java.util.List;

/**
 *
 * @author Jennifer Tatiana GF
 */
public interface CRUDInventario {
    public List listar();
    public Inventario list(int id);
    public boolean add(Inventario in);
    public boolean edit(Inventario in);
    public boolean eliminar(int id);
}
