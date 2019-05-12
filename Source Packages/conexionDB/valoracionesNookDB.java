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
import java.util.ArrayList;
import modelo.ValoracionNook;

/**
 *
 * @author andres
 */
public class valoracionesNookDB {

    public static double valoracionMediaNook(int idNook){
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        double media = -1.0;
        ResultSet rs = null;
        String consulta="SELECT AVG(puntuacion) as media FROM ValoracionesNook WHERE nook = ?";
        try{
            PreparedStatement ps = connection.prepareStatement(consulta);
            ps.setInt(1, idNook);
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
