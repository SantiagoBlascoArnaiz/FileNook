/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexionDB;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.Part;
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
                documento.setDocumento(rs.getBlob("documento"));
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
    
        public static ArrayList<Documento> getFiles(int idNook) throws FileNotFoundException, IOException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        ResultSet rs = null;
        ArrayList<Documento> documentos=new ArrayList();
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
                
                InputStream is =  rs.getBinaryStream("documento");
                String str = convert(is);
                new File("temp").mkdir();
                File file = new File("temp/"+documento.getNombre());
                FileOutputStream outputStream = new FileOutputStream(file);
                outputStream.write(str.getBytes());
                outputStream.close();
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
    
    public static int insertDocu(int idNook, Part documento) throws IOException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps=null;
        
        String consulta="UPDATE  Documento  SET documento=?  WHERE nook= ?";
        try {
            ps =connection.prepareStatement(consulta);
           
            ps.setBlob(1, documento.getInputStream() ); 
            
            ps.setInt(2, idNook);
            
            int res = ps.executeUpdate();
            ps.close();
            pool.freeConnection(connection);
            return res;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    private static String convert(InputStream is) {
        BufferedInputStream bis = new BufferedInputStream(is);
	ByteArrayOutputStream buf = new ByteArrayOutputStream();
	int result;
	String str = null;
	try {
            result = bis.read();

            while (result != -1) {
                buf.write((byte) result);
                result = bis.read();
            }
            str = buf.toString("UTF-8");
	} catch (IOException e) {
            e.printStackTrace();
	}
	return str;
	}
}
