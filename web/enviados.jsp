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
                    Mensajes enviados
                    </h1>
                </div>

                <div class="pag-buzon">
                    
                    <div class="mensajesBuzon">
                        <div class="enviarMensaje"><button type="button" onclick="window.location.href='crearMensaje.jsp'">Enviar nuevo mensaje</button></div>
                        
                        <ul>
                            <li>
                                <div class="mensajeBuzon">
                                    <p class="usuario">Carlota21<p>
                                    <p class="asunto">Afirmativo</p>
                                    <p class="fecha">17/03/2019</p>
                                    <p class="verMensaje"><button type="button" onclick="window.location.href='mensaje.jsp'">Ver</button></p>
                                </div>
                            </li>
                            <li>
                                <div class="mensajeBuzon">
                                    <p class="usuario">luisito_comunica<p>
                                    <p class="asunto">Duda resuelta</p>
                                    <p class="fecha">01/011/2012</p>
                                    <p class="verMensaje"><button type="button" onclick="window.location.href='mensaje.jsp'">Ver</button></p>
                                </div>
                            </li>
                            <li>
                                <div class="mensajeBuzon">
                                    <p class="usuario">David_Carretero<p>
                                    <p class="asunto">Enhorabuena</p>
                                    <p class="fecha">07/06/2019</p>
                                    <p class="verMensaje"><button type="button" onclick="window.location.href='mensaje.jsp'">Ver</button></p>
                                </div>
                            </li>
                            <li>
                                <div class="mensajeBuzon">
                                    <p class="usuario">David66_tr<p>
                                    <p class="asunto">NEcsito ayuda con este nook</p>
                                    <p class="fecha">03/07/2018</p>
                                    <p class="verMensaje"><button type="button" onclick="window.location.href='mensaje.jsp'">Ver</button></p>
                                </div>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
        </main>
        </div>
        <footer class="footer">
          � Proyecto Filenook - 2019 - Andr�s Cabero Mata -  Patricia Aguado Labrador - Rafael Higelmo San Mill�n - Santiago Blasco Arnaiz
        </footer>
    </body>
</html>
