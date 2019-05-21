/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import conexionDB.documentoDB;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Documento;

/**
 *
 * @author Usuario
 */
@WebServlet(name = "descargarNookSV", urlPatterns = {"/descargarNookSV"})
public class descargarNookSV extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        
        HttpSession session = request.getSession(false);
        String usuario =  (String) session.getAttribute("usuario");
        int nook = Integer.parseInt(request.getParameter("idNook"));
        ArrayList<Documento> documentos = documentoDB.getFiles(nook);
        String nombreArchivo = documentos.get(0).getNombre();
       // String rutaAplicacion = getServletContext().getRealPath("");
       // String rutaDescarga = rutaAplicacion + File.separator + "temp";
        String ruta = "temp"+ File.separator + nook + File.separator + nombreArchivo;
        
        File file = new File(ruta);
        OutputStream outStream = null;
        FileInputStream inputStream = null;
        System.out.println(file.getName());
        if(file.exists()){
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition","attachment; filename=\"" + file.getName() + "\"");
            try{
                outStream = response.getOutputStream();
                inputStream = new FileInputStream(file);
                byte[] buffer = new byte[1024*100];
                int bytesRead = -1;
                while((bytesRead= inputStream.read(buffer))!=-1){
                    outStream.write(buffer, 0, bytesRead);
                }

            } catch(IOException e){
                e.printStackTrace();
            } finally{
                if(inputStream != null) {
                    inputStream.close();
                }

                outStream.flush();
                if(outStream != null){
                    outStream.close();
                }
            }
        } else{
            response.setContentType("text/html");
            response.getWriter().println("<h3>File \"+ fileName +\" Is Not Present .....!</h3>");
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(descargarNookSV.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(descargarNookSV.class.getName()).log(Level.SEVERE, null, ex);
        }
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
