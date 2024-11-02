/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interfaces;

import Modelo.Reservacion;
import java.util.List;
/**
 *
 * @author predi
 */
public interface CRUDReservacion {
    public List listarReservacion();
    public Reservacion list(int id);
    public boolean add(Reservacion reser);
    public boolean edit(Reservacion reser);
    public boolean eliminar(int id);
}
