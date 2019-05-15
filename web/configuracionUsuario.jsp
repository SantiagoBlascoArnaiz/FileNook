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
                        <li><a href="perfil.jsp"><img src="recuperarImagenesSV?userName=<%=userName%>" style="width:90px;
    height:90px;
    border-radius: 50px;"
                                                       alt="Imagen del perfil de usuario"></a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <main class="main">
            <div class="container">
                <div class="nookstitulo">
                    <h1>
                    Configuración
                    </h1>
                </div>

                <div class="pag-archivo">
                    
                    <form class="archivo"  method="post" enctype="multipart/form-data" action="/cogerImagenSV">
                            <ul>
                              
                                <li><a><img  src= "recuperarImagenesSV?userName=<%=userName%>" width="150" height="150"  alt="Imagen del perfil"></a></li>
                                <li><input type="file"  name ="foto"></li>
                                <li><button type="submit" name="Cambiar">Cambiar</button></li>

                            </ul>
                    </form>
                   
                        
                             <form class="pag-config"  method="post" action="/cambioClaveSV">

                                <label for="psw"><b>Antigua contraseña</b></label>
                                <input class="input" type="password" placeholder="Antigua contraseña" name="psw" required>

                                <label for="psw"><b>Nueva contraseña</b></label>
                                <input class="input" type="password" placeholder="Contraseña" name="pswN" required>

                                <label for="psw-repeat"><b>Repetir nueva contraseña</b></label>
                                <input class="input" type="password" placeholder="Repetir Contraseña" name="pswrepeat" required>
                                    
                                <button type="submit">Cambiar contraseña</button>
                             </form>
                        
                </div>
            </div>
        </main>
        </div>
        <footer class="footer">
          © Proyecto Filenook - 2019 - Andrés Cabero Mata -  Patricia Aguado Labrador - Rafael Higelmo San Millán - Santiago Blasco Arnaiz
        </footer>
    </body>
</html>
