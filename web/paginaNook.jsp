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
                        <li class="navigation-usuario"><a href="perfil.html"><%=userName%></a></li>
                        <li><a href="perfil.html"><img src="imagenes/chica2.png"
                                                       alt="Imagen del perfil de usuario"></a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <main class="main">
            <div class="container">
                <div class="nookstitulo">
                    <h1>
                    MIPS
                    </h1>
                </div>

                <div class="pag-archivo">
                    <div class="archivo">
                        <ul>
                            <li><a href="archivosNook.html"><img src="imagenes/mips.png" alt="Imagen de nook"></a></li>
                            <li><p>Prácticas de lenguaje ensamblador. Se centran en el conocimiento de
                                   la arquitectura del juego de instrucciones de un procesador y el modo en que éstas se
                                   relacionan con la programación del computador y los lenguajes de alto nivel.</p></li>
                        </ul>
                    </div>

                    <div class="opciones">
                        <ul>
                            <li><a href="autor.html"><img src="imagenes/chico1.png"
                                                       alt="Imagen del perfil de usuario"></a></li>
                            <li><a href="autor.html">PedroGonz5</a></li>
                            <li>15/08/2018</li>
                            <li><button type="button">Descargar</button></li>
                            <li><button type="button" onclick="window.location.href='archivosNook.html'">Ver archivos</button></li>
                            <li><button type="button">?</button></li>
                        </ul>
                    </div>

                    <div class="comentarios">
                        <ul>
                            <li id="comentario">
                                <input type="text" placeholder="Añada un comentario..." name="comment">
                            </li>
                            <li><button type="button">Enviar comentario</button></li>
                        </ul>
                    </div>

                    <div class="comentariosUsuarios">
                        <ul>
                            <li>
                                <div class="comentarioTexto">
                                    <p class="usuario"><a href="autor.html"><img src="imagenes/chica2.png"
                                                                  alt="Imagen del perfil de usuario"></a> Carlota21<p>
                                    <p>Buen nook!!</p>
                                    <div class="star1">
                                        <form>
                                            <p class="clasificacion">
                                            <input id="radio51" type="radio" name="estrellas" value="5">
                                            <label for="radio51">?</label>
                                            <input id="radio52" type="radio" name="estrellas" value="4">
                                            <label for="radio52">?</label>
                                            <input id="radio53" type="radio" name="estrellas" value="3">
                                            <label for="radio53">?</label>
                                            <input id="radio54" type="radio" name="estrellas" value="2">
                                            <label for="radio54">?</label>
                                            <input id="radio55" type="radio" name="estrellas" value="1">
                                            <label for="radio55">?</label>
                                            </p>
                                        </form>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="comentarioTexto">
                                    <p class="usuario"><a href="autor.html"><img src="imagenes/chico2.png"
                                                                  alt="Imagen del perfil de usuario"></a> luisito_comunica<p>
                                    <p>Tengo una duda con el archivo Sumador.s te mando un correo.</p>
                                    <div class="star1">
                                        <form>
                                            <p class="clasificacion">
                                            <input id="radio61" type="radio" name="estrellas" value="5">
                                            <label for="radio61">?</label>
                                            <input id="radio62" type="radio" name="estrellas" value="4">
                                            <label for="radio62">?</label>
                                            <input id="radio63" type="radio" name="estrellas" value="3">
                                            <label for="radio63">?</label>
                                            <input id="radio64" type="radio" name="estrellas" value="2">
                                            <label for="radio64">?</label>
                                            <input id="radio65" type="radio" name="estrellas" value="1">
                                            <label for="radio65">?</label>
                                            </p>
                                        </form>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="comentarioTexto">
                                    <p class="usuario"><a href="autor.html"><img src="imagenes/chico3.png"
                                                                  alt="Imagen del perfil de usuario"></a> David_Carretero<p>
                                    <p>Excelente trabajo.</p>
                                    <div class="star1">
                                        <form>
                                            <p class="clasificacion">
                                            <input id="radio71" type="radio" name="estrellas" value="5">
                                            <label for="radio71">?</label>
                                            <input id="radio72" type="radio" name="estrellas" value="4">
                                            <label for="radio72">?</label>
                                            <input id="radio73" type="radio" name="estrellas" value="3">
                                            <label for="radio73">?</label>
                                            <input id="radio74" type="radio" name="estrellas" value="2">
                                            <label for="radio74">?</label>
                                            <input id="radio75" type="radio" name="estrellas" value="1">
                                            <label for="radio75">?</label>
                                            </p>
                                        </form>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </main>
        </div>
        <footer class="footer">
          © Proyecto Filenook - 2019 - Andrés Cabero Mata -  Patricia Aguado Labrador - Rafael Higelmo San Millán - Santiago Blasco Arnaiz
        </footer>
    </body>
</html>
