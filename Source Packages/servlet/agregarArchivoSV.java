/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import conexionDB.clasificacionCategoriasDB;
import conexionDB.documentoDB;
import conexionDB.nookDB;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import modelo.ClasificacionCategorias;
import modelo.Documento;
import modelo.Nook;

/**
 *
 * @author Fnac
 */
@WebServlet(name = "agregarArchivoSV", urlPatterns = {"/agregarArchivoSV"})
@MultipartConfig
public class agregarArchivoSV extends HttpServlet {

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
        
        Part documento = request.getPart("documento");
        String resumen = request.getParameter("resumen");
        
        HttpSession sesion = request.getSession();
        String userName = (String) sesion.getAttribute("usuario");
        System.out.println("\n\n\n" + documento.getSize() + "\n\n\n");
        java.util.Date date = new java.util.Date();  
        Date fecha = new Date(date.getTime());
        
        Nook nook = nookDB.ultimoNook(userName);
        
        int idNook = nook.getIdNook();
        
        
        Documento doc = new Documento();
        
        doc.setNook(idNook);
        doc.setNombre(documento.getSubmittedFileName());
        doc.setFechaCreacion(fecha);
        doc.setResumen(resumen);
        doc.setFechaModificacion(fecha);
        
        documentoDB.insert(doc);
        
        documentoDB.insertDocu(idNook,documento, doc.getNombre());
        
        String url = "/agregarArchivo.jsp";
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
