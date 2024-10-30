/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interfaces;

import Modelo.Vendedor;
import java.util.List;

/**
 *
 * @author Jennifer Tatiana GF
 */
public interface CRUDVendedores {
    public List listar();
    public Vendedor list(int id);
    public boolean add(Vendedor vend);
    public boolean edit(Vendedor vend);
    public boolean eliminar(int id);
}
