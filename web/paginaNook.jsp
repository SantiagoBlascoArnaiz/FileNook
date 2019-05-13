<%@page import="modelo.Nook"%>
<%@page import="modelo.Comentario"%>
<%@page import="java.util.ArrayList"%>
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
        
        Nook nook = (Nook) request.getAttribute("nook");
        
        String nombre = nook.getNombre();
        String resumen = nook.getResumen();
        String autor = nook.getAutor();
        
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
                    <%=nombre%>
                    </h1>
                </div>

                <div class="pag-archivo">
                    <div class="archivo">
                        <ul>
                            <li><a href="archivosNook.jsp"><img src="imagenes/mips.png" alt="Imagen de nook"></a></li>
                            <li><p><%=resumen%></p></li>
                        </ul>
                    </div>

                    <div class="opciones">
                        <ul>
                            <li><a href="autor.jsp"><img src="imagenes/chico1.png"
                                                       alt="Imagen del perfil de usuario"></a></li>
                            <li><a href="autor.jsp"><%=autor%></a></li>
                            <li>15/08/2018</li>
                            <li><button type="button">Descargar</button></li>
                            <li><button type="button" onclick="window.location.href='archivosNook.jsp'">Ver archivos</button></li>
                            <li><button type="button">?</button></li>
                        </ul>
                    </div>

                    <div class="comentarios">
                        <ul>
                            <li id="comentario">
                                <input type="text" placeholder="A�ada un comentario..." name="comment">
                            </li>
                            <li><button type="button">Enviar comentario</button></li>
                        </ul>
                    </div>

                    <div class="comentariosUsuarios">
                        <ul>
                            <%
                                ArrayList<Comentario> comentarios = (ArrayList<Comentario>) request.getAttribute("comentarios");
                                for(int i = 0; i < comentarios.size(); i++){
                            %>
                            <li>
                                <div class="comentarioTexto">
                                    <p class="usuario"><a href="autor.jsp"><img src="imagenes/chica2.png"
                                                                  alt="Imagen del perfil de usuario"></a><%=comentarios.get(i).getAutor()%><p>
                                    <p><%=comentarios.get(i).getTexto()%></p>
                                    <div class="star1">
                                        <form>
                                            <p class="clasificacion">
                                            <input id="radio51" type="radio" name="estrellas" value="5">
                                            <label for="radio51">&#9734;</label>
                                            <input id="radio52" type="radio" name="estrellas" value="4">
                                            <label for="radio52">&#9734;</label>
                                            <input id="radio53" type="radio" name="estrellas" value="3">
                                            <label for="radio53">&#9734;</label>
                                            <input id="radio54" type="radio" name="estrellas" value="2">
                                            <label for="radio54">&#9734;</label>
                                            <input id="radio55" type="radio" name="estrellas" value="1">
                                            <label for="radio55">&#9734;</label>
                                            </p>
                                        </form>
                                    </div>
                                </div>
                            </li>
                            <%}%>
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
