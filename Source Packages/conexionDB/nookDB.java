/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexionDB;
import java.sql.*;
import modelo.Nook;
import java.util.ArrayList;
import java.util.List;
public class nookDB {
    public static int insert(Nook nook) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();

        String query="INSERT INTO Nook (idNook,nombre,resumen,autor,fechaCreacion,fechaModificacion,descargas) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps =connection.prepareStatement(query);
            ps.setInt(1, nook.getIdNook());
            ps.setString(2, nook.getNombre());
            ps.setString(3, nook.getResumen());
            ps.setString(4, nook.getAutor());
            ps.setDate(5, (Date) nook.getFechaCreacion());
            ps.setDate(6, (Date) nook.getFechaModificaion());
            ps.setInt(7, nook.getDescargas());
           
            int res = ps.executeUpdate();
            ps.close();
            pool.freeConnection(connection);
            return res;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    //obtener lista de partidos
    public static ArrayList<Nook> getNooks() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        ArrayList<Nook> nooks=new ArrayList();
        ResultSet rs = null;
        String query = "SELECT * FROM Nook";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Nook nook=new Nook();
                nook.setIdNook(rs.getInt("idNook"));
                nook.setNombre(rs.getString("nombre"));
                nook.setResumen(rs.getString("resumen"));
                nook.setAutor(rs.getString("autor"));
                nook.setFechaCreacion(rs.getDate("fechaCreacion"));
                nook.setFechaModificacion(rs.getDate("fechaModificacion"));
                nook.setDescargas(rs.getInt("descargas"));
                nooks.add(nook);
                }
                rs.close();
                ps.close();
                pool.freeConnection(connection);
            return nooks;
        } catch (SQLException e) {
            e.printStackTrace();
        return null;
        }
    }
   
}