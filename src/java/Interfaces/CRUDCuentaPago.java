/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interfaces;

import Modelo.CuentaPago;
import java.util.List;

/**
 *
 * @author predi
 */
public interface CRUDCuentaPago {
    public List listarCuentaPago();
    public CuentaPago list(int id);
    public boolean add(CuentaPago cuentaP);
    public boolean edit(CuentaPago cuentaP);
    public boolean eliminar(int id);
}
