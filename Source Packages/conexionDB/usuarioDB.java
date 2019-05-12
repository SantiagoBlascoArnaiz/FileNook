/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexionDB;
import java.sql.*;
import modelo.Usuario;
public class usuarioDB {
    public static int insert(Usuario user) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();

        String consulta="INSERT INTO Usuario (nombre,apellidos,nombreUsuario,clave,correo) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps =connection.prepareStatement(consulta);
            ps.setString(1, user.getNombre());
            ps.setString(2, user.getApellidos());
            ps.setString(3, user.getNombreUsuario());
            ps.setString(4, user.getClave());
            ps.setString(5, user.getCorreo());
           
            int res = ps.executeUpdate();
            ps.close();
            pool.freeConnection(connection);
            return res;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    public static Usuario getUsuario(String nombreUsuario) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        Usuario usuario = new Usuario();
        ResultSet rs = null;
        Boolean existe;
        String consulta = "SELECT * FROM Usuario WHERE nombreUsuario = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(consulta);
            ps.setString(1,nombreUsuario);
            rs = ps.executeQuery();
            existe = rs.next();
            if(existe== false){
                usuario =  null;
            }else{
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellidos(rs.getString("apellidos"));
                usuario.setNombreUsuario(rs.getString("nombreUsuario"));
                usuario.setClave(rs.getString("clave"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setImagenPerfil(rs.getString("imagenPerfil"));
                
            }

            rs.close();
            ps.close();
            pool.freeConnection(connection);
            
            return usuario;
        } catch (SQLException e) {
            e.printStackTrace();
        return null;
        }
    }
    
     public static int insertClave(String name,String passNuev) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();

        String consulta="UPDATE  Usuario  SET clave=? WHERE nombre= ?";
        try {
            PreparedStatement ps =connection.prepareStatement(consulta);
           
            ps.setString(1, passNuev); 
            ps.setString(2, name);
           
            int res = ps.executeUpdate();
            ps.close();
            pool.freeConnection(connection);
            return res;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

}