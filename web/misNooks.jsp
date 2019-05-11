<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Nook"%>
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
                    Mis Nooks
                    </h1>
                </div>


                <div class="nooks">
                    <button type="submit" class="signupbtn" onclick="window.location.href='crearNook.jsp'">Nuevo Nook</button>
                </div>


                <div class="pag-nook_n">

                    <%
                        ArrayList<Nook> misNooks = (ArrayList<Nook>) request.getAttribute("misNooks");
                        
                        for(int i = 0; i < misNooks.size(); i++){
                    %>
                       <div class="nook_n">

                               <a href=""><img src=""></a>
                               <div class="titulo_nook">
                                <h3><% misNooks.get(i).getNombre(); %></h3>
                                <h4>Categoria:matematicas,integrales,ejercicios,ejemplos</h4>
                                <p><% misNooks.get(i).getResumen(); %></p>
                               </div>
                            <div class="star">
                                <form>
                                    <p class="clasificacion">
                                    <input id="radio11" type="radio" name="estrellas" value="5">
                                    <label for="radio11">?</label>
                                    <input id="radio12" type="radio" name="estrellas" value="4">
                                    <label for="radio12">?</label>
                                    <input id="radio13" type="radio" name="estrellas" value="3">
                                    <label for="radio13">?</label>
                                    <input id="radio14" type="radio" name="estrellas" value="2">
                                    <label for="radio14">?</label>
                                    <input id="radio15" type="radio" name="estrellas" value="1">
                                    <label for="radio15">?</label>
                                    </p>
                                </form>
                            </div>
                       </div>
                    <%;%>


                               <div class="nook_n">

                                    <a href="paginaNook.jsp"><img src="imagenes/java.png"></a>
                                    <div class="titulo_nook">
                                     <h3>Programaci�n java principiante</h3>
                                      <h4>Categoria:java,programacion,ejercicios,ejemplos</h4>
                                     <p>Programas sencillos y conceptos b�sicos de la progrmaci�n en lenguaje java. </p>
                                  </div>
                            <div class="star">
                                <form>
                                    <p class="clasificacion">
                                    <input id="radio21" type="radio" name="estrellas" value="5">
                                    <label for="radio21">?</label>
                                    <input id="radio22" type="radio" name="estrellas" value="4">
                                    <label for="radio22">?</label>
                                    <input id="radio23" type="radio" name="estrellas" value="3">
                                    <label for="radio23">?</label>
                                    <input id="radio24" type="radio" name="estrellas" value="2">
                                    <label for="radio24">?</label>
                                    <input id="radio25" type="radio" name="estrellas" value="1">
                                    <label for="radio25">?</label>
                                    </p>
                                </form>
                            </div>
                       </div>

                        <div class="nook_n">

                               <a href="paginaNook.jsp"><img src="imagenes/WW2.png"></a>
                               <div class="titulo_nook">
                                <h3>Historia la Segunda Guerra Mundial</h3>
                                 <h4>Categoria:resumen,historia,guerra,mundial,imagenes</h4>
                                <p>Resumenes amplios e im�genes para mostrar el trasncurso del conflicto.</p>
                               </div>
                            <div class="star">
                                <form>
                                    <p class="clasificacion">
                                    <input id="radio31" type="radio" name="estrellas" value="5">
                                    <label for="radio31">?</label>
                                    <input id="radio32" type="radio" name="estrellas" value="4">
                                    <label for="radio32">?</label>
                                    <input id="radio33" type="radio" name="estrellas" value="3">
                                    <label for="radio33">?</label>
                                    <input id="radio34" type="radio" name="estrellas" value="2">
                                    <label for="radio34">?</label>
                                    <input id="radio35" type="radio" name="estrellas" value="1">
                                    <label for="radio35">?</label>
                                    </p>
                                </form>
                            </div>
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