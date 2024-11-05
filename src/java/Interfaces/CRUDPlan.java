/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interfaces;

import Modelo.Plan;
import java.util.List;

/**
 *
 * @author predi
 */
public interface CRUDPlan {
    public List listarPlan();
    public Plan list(int id);
    public boolean add(Plan plan);
    public boolean edit(Plan plan);
    public boolean eliminar(int id);
}
