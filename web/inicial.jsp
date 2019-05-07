<%@page import="java.security.Principal"%>
<%@page import="modelo.Nook"%>
<%@page import="modelo.Nook"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Usuario"%>
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
        <script src="js/jquery-2.2.4.min.js"></script>
        <script src="js/multislider.min.js"></script>
    </head>
    <body >
        <%
        //Principal principal=request.getUserPrincipal();
        //System.out.println("PRINCIPALPRINCIPALPRINCIPAL" + principal);
        //String userName=principal.getName();
        %>
        <div class="content">
            <header class="header">
                <nav class="container logo-nav-container">
                    <a href="inicial.html" class="logo">FILENOOK</a>
                    <div class="navigation">
                        <ul>
                            <li class="navigation-usuario"><a href="perfil.html">fafafa<%//=userName%></a></li>
                            <li><a href="perfil.html"><img src="imagenes/chica2.png"
                                                           alt="Imagen del perfil de usuario"></a></li>
                        </ul>
                    </div>
                </nav>
            </header>
            <main class="main">
                <div class="container">
                    <div class="proyectos-inicial">
                        <div class="search-bar">
                            <input type="search" placeholder="Busca aquí nooks..." name="search" required>
                        </div>
                        
                        <p>Populares</p>
                        <div id="populares" class="slider">      <!-- Give wrapper ID to target with jQuery & CSS -->
                            <div class="MS-content">
                                <a href="http://www.google.es"><div class="item"> Item 1 </div></a>
                                <a href="http://www.google.es"><div class="item"> Item 2 </div></a>
                                <a href="http://www.google.es"><div class="item"> Item 3 </div></a>
                                <a href="http://www.google.es"><div class="item"> Item 4 </div></a>
                                <a href="http://www.google.es"><div class="item"> Item 5 </div></a>
                                <a href="http://www.google.es"><div class="item"> Item 6 </div></a>
                                <a href="http://www.google.es"><div class="item"> Item 7 </div></a>
                                <a href="http://www.google.es"><div class="item"> Item 8 </div></a>

                            </div>
                            <div class="MS-controls">
                                <button class="MS-left"><i class="fa fa-chevron-left" aria-hidden="true"></i></button>
                                <button class="MS-right"><i class="fa fa-chevron-right" aria-hidden="true"></i></button>
                            </div>
                        </div>
              
                        <p>Descargas</p>
                        <div id="descargas" class="slider">      <!-- Give wrapper ID to target with jQuery & CSS -->
                            <div class="MS-content">
                                <div class="item"> Item 2 </div>
                                <div class="item"> Item 3 </div>
                                <div class="item"> Item 4 </div>
                                <div class="item"> Item 5 </div>
                                <div class="item"> Item 6 </div>
                                <div class="item"> Item 7 </div>
                                <div class="item"> Item 8 </div>
                                <div class="item"> Item 9 </div>

                            </div>
                            <div class="MS-controls">
                                <button class="MS-left"><i class="fa fa-chevron-left" aria-hidden="true"></i></button>
                                <button class="MS-right"><i class="fa fa-chevron-right" aria-hidden="true"></i></button>
                            </div>
                        </div>
              
                        <script>
                            $('#populares').multislider({
                                interval:0,
                                duration: 100
                            });
                            
                            $('#descargas').multislider({
                                interval:0,
                                duration: 100
                            });
                        </script>
                    </div>
                </div>
            </main>
        </div>
        <footer class="footer">
          © Proyecto Filenook - 2019 - Andrés Cabero Mata -  Patricia Aguado Labrador - Rafael Higelmo San Millán - Santiago Blasco Arnaiz
        </footer>
    </body>
</html>
