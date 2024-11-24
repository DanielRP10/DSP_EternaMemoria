/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interfaces;

import Modelo.Cliente;
import java.util.List;

/**
 *
 * @author Jennifer Tatiana GF
 */
public interface CRUDCliente {
    public List listar();
    public Cliente list(int id);
    public boolean add(Cliente cl);
    public boolean edit(Cliente cl);
    public boolean eliminar(int id);
}
