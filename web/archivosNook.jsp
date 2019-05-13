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
                    <div class="paginanook">
                        <ul>
                            <li><img src="imagenes/chico1.png" alt="Imagen del perfil de usuario"></li>
                            <li><h1>PedroGonz5</h1></li>
                        </ul>
                        <h1>NOOK MIPS</h1>
                        <div class="star">
                            <form>
                                  <p class="clasificacion">
                                  <input id="radio41" type="radio" name="estrellas" value="5">
                                  <label for="radio41">&#9734;</label>
                                  <input id="radio45" type="radio" name="estrellas" value="4">
                                  <label for="radio42">&#9734;</label>
                                  <input id="radio46" type="radio" name="estrellas" value="3">
                                  <label for="radio43">&#9734;</label>
                                  <input id="radio47" type="radio" name="estrellas" value="2">
                                  <label for="radio44">&#9734;</label>
                                  <input id="radio48" type="radio" name="estrellas" value="1">
                                  <label for="radio45">&#9734;</label>
                                </p>
                            </form>
                        </div>
                    </div>
                    <div class="pag-nook">
                           <div class="nook">
                                   <a href="paginaNook.jsp"><img src="imagenes/sumador.png" alt="Imagen del perfil de usuario"></a>
                                    <h3>Sumador.s</h3>
                                    <p>Programa MIPS para suamr n�mero en hexadecimal y que muestre el resultado en binario complemento a dos.</p>
                           </div>
                        <div class="nook">
                                   <a href="paginaNook.jsp"><img src="imagenes/shunting.png" alt="Imagen del perfil de usuario"></a>
                                    <h3>Shunting.s</h3>
                                    <p>Algoritmo shunting yard implementado en MIPS mediante el uso de notaci�n polaca inversa que devuelve resultados en decimal o hexadecimal como su entrada.</p>
                           </div>
                        <div class="nook">
                                   <a href="paginaNook.jsp"><img src="imagenes/conversor.png" alt="Imagen del perfil de usuario"></a>
                                   <h3>Conversor.s</h3>
                                    <p>Programa MIPS que convierte n�mero de hexadecimal a binario.</p>
                           </div>
                        <div class="nook">
                                   <a href="paginaNook.jsp"><img src="imagenes/segmentacion.png" alt="Imagen del perfil de usuario"></a>
                                    <h3>Segmentacion.pdf</h3>
                                    <p>Apuntes sobre la segmentaci�nd de los procesadores vistos en la asignatura de Arquitectura y Organizaci�n de Computadoras</p>
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