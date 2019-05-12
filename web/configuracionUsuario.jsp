<%@page import="modelo.Usuario"%>
<%@page import="conexionDB.usuarioDB"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
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
                        <li><a href="perfil.jsp"><img src="imagenes/chica2.png"
                                                       alt="Imagen del perfil de usuario"></a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <main class="main">
            <div class="container">
                <div class="nookstitulo">
                    <h1>
                    Configuraci�n
                    </h1>
                </div>

                <div class="pag-archivo">
                    
                    <form class="archivo"  method="post" enctype="multipart/form-data" action="/cambioImagenSV">
                            <ul>
                                 
                                <li><a href="archivosNook.jsp"><img src= " Imagen?name= " alt="Imagen del perfil de usuario"></a></li>
                                <li><input type="file"  name ="foto"></li>
                                <li><button type="submit" name="Cambiar">Cambiar</button></li>

                            </ul>
                    </form>
                   
                        
                             <form class="pag-config"  method="post" action="/cambioPassSV">

                                <label for="psw"><b>Antigua contrase�a</b></label>
                                <input class="input" type="password" placeholder="Antigua contrase�a" name="psw" required>

                                <label for="psw"><b>Nueva contrase�a</b></label>
                                <input class="input" type="password" placeholder="Contrase�a" name="pswN" required>

                                <label for="psw-repeat"><b>Repetir nueva contrase�a</b></label>
                                <input class="input" type="password" placeholder="Repetir Contrase�a" name="pswrepeat" required>
                                    
                                <button type="submit">Cambiar contras�ea</button>
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
