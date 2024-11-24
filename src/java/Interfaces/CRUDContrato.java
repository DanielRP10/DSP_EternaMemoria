/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interfaces;

import Modelo.Contrato;
import java.util.List;

/**
 *
 * @author predi
 */
public interface CRUDContrato {
    public List listarContrato();
    public Contrato list(int id);
    public boolean add(Contrato contra);
    public boolean edit(Contrato contra);
    public boolean eliminar(int id);
}
