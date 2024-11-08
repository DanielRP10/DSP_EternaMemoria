/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interfaces;

import Modelo.DetallePlan;
import java.util.List;

/**
 *
 * @author predi
 */
public interface CRUDDetallePlan {
    public List listarDetallePlan();
    public DetallePlan list(int id);
    public boolean add(DetallePlan DP);
    public boolean edit(DetallePlan DP);
    public boolean eliminar(int id);
}
