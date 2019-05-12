<%@page import="modelo.Mensaje"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html lang="es">
    <head>
        <title>FileNook</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style.css" rel="stylesheet">
    </head>
    <body >
        <%
        HttpSession sesion = request.getSession();
        String userName = (String) sesion.getAttribute("usuario");
        
        Mensaje mensaje = (Mensaje) request.getAttribute("mensaje");
        
        String emisor = mensaje.getAutor();
        String asunto = mensaje.getAsunto();
        String texto = mensaje.getTexto();
                
        %>
        <div class="content">
        <header class="header">
            <div class="container logo-nav-container">
                <a href="/inicialSV" class="logo">FILENOOK</a>
                <nav class="navigation">
                    <ul>
                        <li class="navigation-usuario"><a href="perfil.jsp"><%=userName%></a></li>
                        <li><a href="perfil.jsp"><img src="imagenes/chica2.png"
                                                       alt="Imagen del perfil de usuario"></a></li>
                    </ul>
                </nav>
            </div>
        </header>
            <main class="main">
                <div class="container">
                    <h3 style="margin-top: 2rem;">MENSAJE</h3>
                    <div class="pag-mensajeContenido" >

                        <div class="tablamensajetexto">
                            <div class="partes">
                                <label style="padding-right: 2.4em;">De: </label>
                                <textarea class="usuarioEmisoryAsunto"><%=emisor%></textarea>
                            </div>

                            <div class="partes">
                                <label style="padding-right: 0.5em;">Asunto:</label>
                                <textarea class="usuarioEmisoryAsunto"><%=asunto%></textarea>
                            </div>

                            <div class="partes" >
                                <label class="mensajeEntero">Mensaje:</label>
                                <textarea class="mensajeEnterotext"><%=mensaje%></textarea>
                            </div>


                            <div class="partes" >
                                <input type="button" class="button" tabindex="10" id="enviarmensajebotton" style="margin-left: 5em" onclick="window.location.href='crearMensaje.jsp'" value="Responder" >
                                <input type="button"  class="button" tabindex="10" id="volverbuzonbotton" style="margin-left: 50em" onclick="window.location.href='buzon.jsp'"   value="Volver al buzón">
                            </div>
                        </div>
                        <!--
                        <table class="tablamensajetexto" style="margin: 0 auto">
                                <tr>
                                    <td><label>De: </label></td>
                                    <td><textarea class="usuarioEmisoryAsunto"></textarea></td>
                                </tr>
                                <tr>
                                    <td><label>Asunto:</label></td>
                                    <td><textarea class="usuarioEmisoryAsunto"></textarea></td>
                                </tr>
                                <tr>
                                    <td><label class="mensajeEntero">Mensaje:</label></td>
                                    <td><textarea class="mensajeEnterotext"></textarea></td>
                                </tr>
                                 <tr>
                                     <td><input type="button" class="button" tabindex="10" id="enviarmensajebotton"  value="Responder" ></td>
                                     <td><input type="button"  class="button" tabindex="10" id="volverbuzonbotton" style="margin-left: 50em" onclick="window.location.href='inicial.html'"   value="Volver al buzón"></td>
                                </tr>

                        </table>
                        -->
                    </div>
                </div>
            </main>
            </div>
            <footer class="footer">
              © Proyecto Filenook - 2019 - Andrés Cabero Mata -  Patricia Aguado Labrador - Rafael Higelmo San Millán - Santiago Blasco Arnaiz
            </footer>
    </body>
</html>
