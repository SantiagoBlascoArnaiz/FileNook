/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


package modelo;

public class ValoracionAutor {

    private Usuario autor;
    private double puntuacion;
   
    public ValoracionAutor(Usuario autor, double puntuacion) {
        this.autor = autor;
        this.puntuacion = puntuacion;
    }

    public Usuario getAutor() {
        return autor;
    }

    public void getAutor(Usuario autor) {
        this.autor = autor;
    }

    public double getPuntuacion() {
        return puntuacion;
    }

    public void setPuntuacion(double puntuacion) {
        this.puntuacion = puntuacion;
    }
}
  