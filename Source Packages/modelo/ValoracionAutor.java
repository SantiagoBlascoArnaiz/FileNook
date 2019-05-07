/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


package modelo;

public class ValoracionAutor {

    private String autor;
    private String usuario;
    private double puntuacion;
    private double valoracionMedia;
    
    public ValoracionAutor(){
        
    }
   
    public ValoracionAutor(String autor, String usuario, double puntuacion, double valoracionMedia) {
        this.autor = autor;
        this.usuario = usuario;
        this.puntuacion = puntuacion;
        this.valoracionMedia = valoracionMedia;
    }

    public String getAutor() {
        return autor;
    }

    public void getAutor(String autor) {
        this.autor = autor;
    }
    
    public String getUsuario() {
        return usuario;
    }

    public void getUsuario(String usuario) {
        this.usuario = usuario;
    }

    public double getPuntuacion() {
        return puntuacion;
    }

    public void setPuntuacion(double puntuacion) {
        this.puntuacion = puntuacion;
    }
    
    public double getValoracionMedia() {
        return valoracionMedia;
    }

    public void setValoracionMedia(double valoracionMedia) {
        this.valoracionMedia = valoracionMedia;
    }
}
  