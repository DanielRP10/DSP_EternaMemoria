/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
//daniel: LAPTOP-69B23DE1
package Config;

import java.sql.*;

public class Conexion {
    Connection con;
    public Conexion(){
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            //Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:sqlserver://PC-INATOR:1433;databaseName=Funeraria;user=usersql;password=1234;");
            //con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ejemplobd?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Error: \n"+e.getClass()+"\n"+e.getMessage());
        }
    }
    public Connection getConnection(){
        return con;
    }
}