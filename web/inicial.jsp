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
                    <a href="/inicialSV" class="logo">FILENOOK</a>
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
                                <%
                                    ArrayList<Usuario> usuarios = (ArrayList<Usuario>)request.getAttribute("usuarios");
                                    ArrayList<Nook> nooks= (ArrayList<Nook>)request.getAttribute("nooks");
                                    for(int i=0;i<nooks.size();i++){
                                %>
                                <div class="item"><a href='paginaNook.html'><div class="item-link"><%=nooks.get(i).getNombre()%></div></a></div>
                                <%}%>
                            </div>
                            <div class="MS-controls">
                                <button class="MS-left"><i class="fa fa-chevron-left" aria-hidden="true"></i></button>
                                <button class="MS-right"><i class="fa fa-chevron-right" aria-hidden="true"></i></button>
                            </div>
                        </div>
              
                        <p>Descargas</p>
                        <div id="descargas" class="slider">      <!-- Give wrapper ID to target with jQuery & CSS -->
                            <div class="MS-content">
                                <%
                                    for(int i=0;i<nooks.size();i++){
                                %>
                                <div class="item"><a href='paginaNook.html'><div class="item-link"><%=nooks.get(i).getNombre()%></div></a></div>
                                <%}%>
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
