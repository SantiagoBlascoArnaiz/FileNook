/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modelo.ValoracionAutor;

/**
 *
 * @author andres
 */
public class valoracionesAutorDB {

    public static int insert(ValoracionAutor valoracion){
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        ResultSet rs = null;
        int res = 0;
        String consulta= ""
                + "SELECT * FROM ValoracionesAutor "
                + "WHERE autor = ? and usuario = ?";
        try{
            PreparedStatement ps = connection.prepareStatement(consulta);
            ps.setString(1, valoracion.getAutor());
            ps.setString(2, valoracion.getUsuario());
            rs = ps.executeQuery();
            if(!rs.next()){
                consulta = "INSERT INTO ValoracionesAutor (autor, usuario, puntuacion)"
                        + " VALUES (?, ?, ?)";
                ps = connection.prepareStatement(consulta);
                ps.setString(1, valoracion.getAutor());
                ps.setString(2, valoracion.getUsuario());
                ps.setDouble(3, valoracion.getPuntuacion());
            } else{
                consulta = "UPDATE ValoracionesAutor SET puntuacion = ? "
                        + "WHERE autor = ? AND usuario = ?";
                ps = connection.prepareStatement(consulta);
                ps.setDouble(1, valoracion.getPuntuacion());
                ps.setString(2, valoracion.getAutor());
                ps.setString(3, valoracion.getUsuario());
            }
            res = ps.executeUpdate();
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return res;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
        
    }
    
    
    
    
    public static double valoracionMediaAutor(String autor){
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        double media = -1.0;
        ResultSet rs = null;
        String consulta="SELECT AVG(puntuacion) as media FROM ValoracionesAutor WHERE autor = ?";
        try{
            PreparedStatement ps = connection.prepareStatement(consulta);
            ps.setString(1, autor);
            rs = ps.executeQuery();
            while(rs.next()){
                media = rs.getDouble("media");    
            }
            
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return media;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return -1.0;
        }
        
    }
}
