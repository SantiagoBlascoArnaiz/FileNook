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
        %>
        <div class="content">
        <header class="header">
            <div class="container logo-nav-container">
                <a href="/inicialSV" class="logo">FILENOOK</a>
                <nav class="navigation">
                    <ul>
                        <li class="navigation-usuario"><a href="perfil.jsp"><%=userName%></a></li>
                        <li><a href="perfil.jsp"><img src="recuperarImagenesSV?userName=<%=userName%>"
                                                      class="imagenesUsuarios"
                                                       alt="Imagen del perfil de usuario"></a></li>
                    </ul>
                </nav>
            </div>
        </header>
            <main class="main">
                <div class="container">
                        <h3 style="margin-top: 3rem;">CREAR NOOK</h3>
                    <div class="pag-crearNook">

                        <form class="tablamensajetexto"  method="post" action="/crearNookSV">

                            <div class="partes">
                                <label for="nombre" class="nombreNook" style="padding-right: 2.5em;">Nombre:</label>
                                <input class="tablaNooktext" name="nombre" required>
                            </div>

                            <div class="partes">
                                <label for="etiquetas" class="etiquetasNook" style="padding-right: 2em;">Etiquetas:</label>
                                <input class="tablaNooktext" name="etiquetas" required>
                            </div>

                            <div class="partes" >
                                <label for="resumen" class="descripcionNook" style="padding-right: 1em;">Descripci�n:</label>
                                <input class="tablaNooktext" name="resumen" required>
                            </div>


                            <div class="partes" >
                                <label for="subirarchivo" class="SubirArchivo" style="padding-right: 2em;">Subir Archivo:</label>
                            </div>
                                    <input type="file" multiple="multiple"/>
                               
                            
                            <div class="partes" >
                                <textarea class="archivosSubidos"></textarea>
                            </div>

                              <div class="partes" >
                                <input type="submit" class="button mainaction" tabindex="10" id="crear_NOOKbotton" onclick="return rcmail.command('send','',this,event)" value="CREAR" >
                                <input type="reset" class="button mainaction" tabindex="10" id="borrar_NOOKbotton" onclick="return rcmail.command('send','',this,event)" value="BORRAR" >
                            </div>
                        </form>
                       
                        </div>
                      
                    </div>
            </main>
          </div>
          <footer class="footer">
            � Proyecto Filenook - 2019 - Andr�s Cabero Mata -  Patricia Aguado Labrador - Rafael Higelmo San Mill�n - Santiago Blasco Arnaiz
          </footer>
    </body>
</html>



