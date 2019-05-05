/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexionDB;
import java.sql.*;
import modelo.Usuario;
import java.util.ArrayList;
import java.util.List;
public class usuarioDB {
    public static int insert(Usuario user) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();

        String query="INSERT INTO Usuario (nombre,apellidos,nombreUsuario,clave,correo) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps =connection.prepareStatement(query);
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
    public static boolean emailExists(String correo) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT correo FROM Usuario "+ "WHERE correo = ?";

        try{
            ps = connection.prepareStatement(query);
            ps.setString(1, correo);
            rs = ps.executeQuery();
            boolean res = rs.next();
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return res;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public static boolean dniExists(String dni) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT dni FROM Usuario WHERE dni = ?";
        try{
            ps = connection.prepareStatement(query);
            ps.setString(1, dni);
            rs = ps.executeQuery();
            boolean res = rs.next();
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return res;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public static boolean login(String dni,String passwd) {
        ConnectionPool pool= ConnectionPool.getInstance();
        Connection connection=pool.getConnection();
        ResultSet rs=null;
        String loginSQL="SELECT * FROM Usuario "+ "WHERE (dni = ? AND contraseña=? )";
        try{
            PreparedStatement ps =connection.prepareStatement(loginSQL);
            ps.setString(1, dni);
            ps.setString(2, passwd);
            rs=ps.executeQuery();
            boolean res=rs.next();
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return res;
        }
        catch(SQLException e){
            e.printStackTrace();
            return false;
        }
    }
    public static List getRoles(String rol) {
        ConnectionPool pool= ConnectionPool.getInstance();
        Connection connection=pool.getConnection();
        List roles=new ArrayList();
        ResultSet rs=null;
        String loginSQL="SELECT dni FROM Usuario "+ "WHERE rol=?";
        try{
            PreparedStatement ps =connection.prepareStatement(loginSQL);
            ps.setString(1, rol);
            rs=ps.executeQuery();
            pool.freeConnection(connection);
            while (rs.next()) {
               String dni=rs.getString("dni");
               roles.add(dni);
           }
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return roles;
        }
        catch(SQLException e){
            e.printStackTrace();
            return null;
        }
    }
    public static ArrayList<String> getJugadores(String parameter){
        ConnectionPool pool= ConnectionPool.getInstance();
        Connection connection=pool.getConnection();
        String query = "SELECT u.nombre AS nombreUser, u.apellidos AS apellidosUser, u.dni AS dniUser, u.FECHA_REGISTRO AS fechaUser, e.nombre AS nombreEquipo, e.ID_EQUIPO as idEquipo "
                + "from USUARIO u CROSS JOIN PERTENENCIA p CROSS JOIN Equipo e "
                + "WHERE u.dni = p.dni AND p.ID_EQUIPO = e.ID_EQUIPO AND u.nombre = ?";
        ResultSet rs = null;
        try{
            PreparedStatement ps =connection.prepareStatement(query);
            ps.setString(1, parameter);
            
            rs=ps.executeQuery();
            ArrayList<String> res = parseResultSet(rs);
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return res;
        }
        catch(SQLException e){
            e.printStackTrace();
            pool.freeConnection(connection);
            return null;
        }
    }
    public static ArrayList<String> parseResultSet(ResultSet rs) throws SQLException{
        ArrayList<String> au = new ArrayList<>();
        while(rs.next()){
            au.add(
                rs.getString("nombreUser")+"///"+
                rs.getString("apellidosUser")+"///"+
                rs.getString("dniUser")+"///"+
                rs.getDate("fechaUser").toString()+"///"+
                rs.getString("nombreEquipo")+"///"+
                rs.getInt("idEquipo")
            );
        }
        return au;
    } //IMPLEMENTAR <-------------------------
}