/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexionDB;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import modelo.Mensaje;

/**
 *
 * @author Patricia
 */
public class mensajeDB {
    public static int insert(Mensaje mensaje) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();

        String consulta ="INSERT INTO Mensaje (idMensaje,asunto,texto,fecha,leido,tipo,autor,destinatario) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(consulta);
            ps.setInt(1, mensaje.getIdMensaje());
            ps.setString(2, mensaje.getAsunto());
            ps.setString(3, mensaje.getTexto());
            ps.setDate(4, (Date) mensaje.getFecha());
            ps.setInt(5, mensaje.getLeido());
            ps.setString(6, mensaje.getTipo());
            ps.setString(7, mensaje.getAutor());
            ps.setString(8, mensaje.getDestinatario());
            
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
