/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


package modelo;

import java.util.Date;

public class ValoracionesNook {

    private Nook nook;
    private Usuario usuario;
    private int puntuacion;
    private Date fecha;
   
    public ValoracionesNook(Nook nook, Usuario usuario, int puntuacion, Date fecha) {
        this.nook = nook;
        this.usuario = usuario;
        this.puntuacion = puntuacion;
        this.fecha = fecha;
    }


    public Nook getNook() {
        return nook;
    }

    public void setNook(Nook nook) {
        this.nook = nook;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public int getPuntuacion() {
        return puntuacion;
    }

    public void setPuntuacion(int resumen) {
        this.puntuacion = puntuacion;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date autor) {
        this.fecha = fecha;
    }

}
    

