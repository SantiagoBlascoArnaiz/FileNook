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
import modelo.Documento;

/**
 *
 * @author Fnac
 */
public class documentoDB {
    
        public static int insert(Documento documento) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();

        String query="INSERT INTO Documento (nook,nombre,resumen,fechaCreacion,fechaModificacion) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps =connection.prepareStatement(query);
            ps.setInt(1, documento.getNook());
            ps.setString(2, documento.getNombre());
            ps.setString(3, documento.getResumen());
            ps.setDate(4, (Date) documento.getFechaCreacion());
            ps.setDate(5, (Date) documento.getFechaModificacion());
           
            int res = ps.executeUpdate();
            ps.close();
            pool.freeConnection(connection);
            return res;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    public static ArrayList<Documento> getDocumentosNook(int idNook) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        ArrayList<Documento> documentos=new ArrayList();
        ResultSet rs = null;
        String consulta = "SELECT * FROM Documento WHERE nook = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(consulta);
            ps.setInt(1, idNook);
            rs = ps.executeQuery();
            while (rs.next()) {
                Documento documento=new Documento();
                documento.setNook(rs.getInt("nook"));
                documento.setNombre(rs.getString("nombre"));
                documento.setResumen(rs.getString("resumen"));
                documento.setFechaCreacion(rs.getDate("fechaCreacion"));
                documento.setFechaModificacion(rs.getDate("fechaModificacion"));
                
                documentos.add(documento);
                }
            
                rs.close();
                ps.close();
                pool.freeConnection(connection);
            return documentos;
        } catch (SQLException e) {
            e.printStackTrace();
            
        return null;
        }
    }
    
}
