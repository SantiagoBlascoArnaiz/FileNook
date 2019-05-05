/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package modelo;

import java.util.Date;

public class Mensaje {

    private int idMensaje;
    private String texto;
    private Date fecha;
    private int leido;
    private String tipo;
    private Usuario autor;
    private Usuario destinatario;
   
    public Mensaje(int idMensaje, String texto, Date fecha, int leido, String tipo, Usuario autor, Usuario destinatario) {
        this.idMensaje = idMensaje;
        this.texto = texto;
        this.fecha = fecha;
        this.leido = leido;
        this.tipo = tipo;
        this.autor = autor;
        this.destinatario = destinatario;
    }


    public int getIdMensaje() {
        return idMensaje;
    }

    public void setIdMensaje(int idMensaje) {
        this.idMensaje = idMensaje;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public int getLeido() {
        return leido;
    }

    public void setLeido(int leido) {
        this.leido = leido;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Usuario getAutor() {
        return autor;
    }

    public void setAutor(Usuario autor) {
        this.autor = autor;
    }

    public Usuario getDestinatario() {
        return destinatario;
    }

    public void setDestinatario(Usuario destinatario) {
        this.destinatario = destinatario;
    }
}
    

