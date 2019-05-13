/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexionDB;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modelo.Comentario;
import modelo.Nook;

/**
 *
 * @author Fnac
 */
public class comentarioDB {
    
    public static int insert(Comentario comentario) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();

        String query="INSERT INTO Nook (fecha,autor,texto,valoracionMedia) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps =connection.prepareStatement(query);
            ps.setDate(1, (Date) comentario.getFecha());
            ps.setString(2, comentario.getAutor());
            ps.setString(3, comentario.getTexto());
            ps.setDouble(4, comentario.getValoracionMedia());
           
            int res = ps.executeUpdate();
            ps.close();
            pool.freeConnection(connection);
            return res;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    public static ArrayList<Comentario> getComentariosNook(int idNook) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        ArrayList<Comentario> comentarios=new ArrayList();
        ResultSet rs = null;
        String consulta = "SELECT * FROM Comentario WHERE idComentario = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(consulta);
            ps.setInt(1, idNook);
            rs = ps.executeQuery();
            while (rs.next()) {
                Comentario comentario=new Comentario();
                comentario.setIdComentario(rs.getInt("idComentario"));
                comentario.setFecha(rs.getDate("fecha"));
                comentario.setAutor(rs.getString("autor"));
                comentario.setTexto(rs.getString("texto"));
                comentario.setValoracionMedia(rs.getDouble("valoracionMedia"));
                
                comentarios.add(comentario);
                }
            
                rs.close();
                ps.close();
                pool.freeConnection(connection);
            return comentarios;
        } catch (SQLException e) {
            e.printStackTrace();
            
        return null;
        }
    }
    
}
