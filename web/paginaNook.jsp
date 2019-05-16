<%@page import="java.util.Date"%>
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
        Double valoracion = nook.getValoracionMedia();
        String nombre = nook.getNombre();
        Date fecha = nook.getFechaCreacion();
        String resumen = nook.getResumen();
        String autor = nook.getAutor();
        int descargas = nook.getDescargas();
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
                            <li><a href="autor.jsp"><img <img src="recuperarimagenOtroSV?autor=<%=autor%>" style="width:90px;
    height:90px;
    border-radius: 50px;"
                                                       alt="Imagen del perfil de usuario"></a></li>
                            <li><a href="autor.jsp"><%=autor%></a></li>
                            <li><%=fecha%></li>
                            <li><button type="button">Descargar</button></li>
                            <li><button type="button" onclick="window.location.href='/documentosSV?idNook=<%=nook.getIdNook()%>'">Ver archivos</button></li>
                            <li><text>Descargas: <%=descargas%></text></li>
                        </ul>
                    </div>
                    <div class="starNook">
                        <form class="valoracion"  method="post" action="/valorarNookSV?idNook=<%=nook.getIdNook()%>&urlPagina=/nookSV?idNook=<%=nook.getIdNook()%>">
                            <p class="clasificacion">
                            <input id="<%=nook.getIdNook()%>,5" type="radio" name="estrellas<%=nook.getIdNook()%>" value="5" onclick="this.form.submit();" <%if(valoracion==5){%> checked <%}%> >
                            <label for="<%=nook.getIdNook()%>,5">&#9733;</label>
                            <input id="<%=nook.getIdNook()%>,4" type="radio" name="estrellas<%=nook.getIdNook()%>" value="4" onclick="this.form.submit();" <%if(valoracion==4){%> checked <%}%>>
                            <label for="<%=nook.getIdNook()%>,4">&#9733;</label>
                            <input id="<%=nook.getIdNook()%>,3" type="radio" name="estrellas<%=nook.getIdNook()%>" value="3" onclick="this.form.submit();" <%if(valoracion==3){%> checked <%}%>>
                            <label for="<%=nook.getIdNook()%>,3">&#9733;</label>
                            <input id="<%=nook.getIdNook()%>,2" type="radio" name="estrellas<%=nook.getIdNook()%>" value="2" onclick="this.form.submit();" <%if(valoracion==2){%> checked <%}%>>
                            <label for="<%=nook.getIdNook()%>,2">&#9733;</label>
                            <input id="<%=nook.getIdNook()%>,1" type="radio" name="estrellas<%=nook.getIdNook()%>" value="1" onclick="this.form.submit();" <%if(valoracion==1){%> checked <%}%>>
                            <label for="<%=nook.getIdNook()%>,1">&#9733;</label>
                            </p>
                        </form>
                    </div>
                    <div class="comentarios">
                        <form method="post"  action="/crearComentarioSV?idNook=<%=nook.getIdNook()%>" >
                            <ul>
                                <li><input id="comentario" type="text" placeholder="Añada un comentario..." name="comentario"></li>

                                <li><div class="EnvComment">
                                    <button type="submit" >Enviar comentario</button>
                                </div></li>
                            </ul>
                        </form>
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
                                        <form class="valoracion">
                                            <p class="clasificacion">
                                                <input id="<%=comentarios.get(i).getIdComentario()%>,5" type="radio" name="estrellas" value="5">
                                                <label for="<%=comentarios.get(i).getIdComentario()%>,5">&#9733;</label>
                                                <input id="<%=comentarios.get(i).getIdComentario()%>,4" type="radio" name="estrellas" value="4">
                                                <label for="<%=comentarios.get(i).getIdComentario()%>,4">&#9733;</label>
                                                <input id="<%=comentarios.get(i).getIdComentario()%>,3" type="radio" name="estrellas" value="3">
                                                <label for="<%=comentarios.get(i).getIdComentario()%>,3">&#9733;</label>
                                                <input id="<%=comentarios.get(i).getIdComentario()%>,2" type="radio" name="estrellas" value="2">
                                                <label for="<%=comentarios.get(i).getIdComentario()%>,2">&#9733;</label>
                                                <input id="<%=comentarios.get(i).getIdComentario()%>,1" type="radio" name="estrellas" value="1">
                                                <label for="<%=comentarios.get(i).getIdComentario()%>,1">&#9733;</label>
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
          © Proyecto Filenook - 2019 - Andrés Cabero Mata -  Patricia Aguado Labrador - Rafael Higelmo San Millán - Santiago Blasco Arnaiz
        </footer>
    </body>
</html>
