/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


package modelo;

public class ValoracionAutor {

    private String autor;
    private double puntuacion;
    
    public ValoracionAutor(){
        
    }
   
    public ValoracionAutor(String autor, double puntuacion) {
        this.autor = autor;
        this.puntuacion = puntuacion;
    }

    public String getAutor() {
        return autor;
    }

    public void getAutor(String autor) {
        this.autor = autor;
    }

    public double getPuntuacion() {
        return puntuacion;
    }

    public void setPuntuacion(double puntuacion) {
        this.puntuacion = puntuacion;
    }
}
  