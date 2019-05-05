/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


package modelo;

import java.util.Date;

public class Comentario {

    private int idComentario;
    private Date fecha;
    private Usuario autor;
    private String texto;    
   
    public Comentario(int idComentario, Date fecha, Usuario autor, String texto) {
        this.idComentario = idComentario;
        this.fecha = fecha;
        this.autor = autor;
        this.texto = texto;
    }


    public int getIdComentario() {
        return idComentario;
    }

    public void setIdComentario(int idComentario) {
        this.idComentario = idComentario;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Usuario getAutor() {
        return autor;
    }

    public void setAutor(Usuario autor) {
        this.autor = autor;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

}