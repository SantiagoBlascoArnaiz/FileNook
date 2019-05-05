/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


package modelo;

import java.util.Date;

public class ValoracionComentario {

    private Comentario comentario;
    private int puntuacion;
    private Date fecha;
    private String usuario;
    
    public ValoracionComentario(){
        
    }
   
    public ValoracionComentario(Comentario comentario, int puntuacion, Date fecha, String usuario) {
        this.comentario = comentario;
        this.puntuacion = puntuacion;
        this.fecha = fecha;
        this.usuario = usuario;
    }


    public Comentario getComentario() {
        return comentario;
    }

    public void setComentario(Comentario comentario) {
        this.comentario = comentario;
    }

    public int getPuntuacion() {
        return puntuacion;
    }

    public void setPuntuacion(int puntuacion) {
        this.puntuacion = puntuacion;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

}
    

