/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interfaces;

/**
 *
 * @author macma
 */


import Modelo.Compras;
import java.util.List;

public interface CRUDCompras {
    public List<Compras> listar();
    public Compras list(int id);
    public boolean add(Compras comp);
    public boolean edit(Compras comp);
    public boolean eliminar(int id);
}
