/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import conexionDB.nookDB;
import conexionDB.usuarioDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Nook;

/**
 *
 * @author Fnac
 */
@WebServlet(name = "nookSV", urlPatterns = {"/nookSV"})
public class nookSV extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //response.setContentType("text/html;charset=UTF-8");
        
        String nombre = request.getParameter("nombre");
        String etiquetas = request.getParameter("etiquetas");
        String resumen = request.getParameter("resumen");
        
        java.util.Date date = new java.util.Date();  
        Date fecha = new Date(date.getTime());
        
        
        Nook nook = new Nook();
        
        nook.setNombre(nombre);
        nook.setResumen(resumen);
        
        HttpSession sesion = request.getSession();
        String userName = (String) sesion.getAttribute("usuario");
        
        nook.setAutor(userName); //AQUI VA EL USUARIO LOGUEADO
        nook.setFechaCreacion(fecha);
        nook.setFechaModificacion(fecha);
        nook.setDescargas(0);
        nook.setValoracionMedia(0.0);
        
        nookDB.insert(nook);
        
        String url = "/misNooks.html";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
