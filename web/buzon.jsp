<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Mensaje"%>
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
                <a href="/inicialSV" class="logo"><img id="imagenlogo" src="imagenes/LOGO.png" alt="Imagen logo">FILENOOK</a>
                <nav class="navigation">
                    <ul>
                        <li class="navigation-usuario"><a href="perfil.jsp"><%=userName%></a></li>
                        <li><a href="perfil.jsp"><img src="recuperarImagenesSV?userName=<%=userName%>"
                                                      class="imagenesUsuariosCabecera"
                                                      alt="Imagen del perfil de usuario"></a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <main class="main">
            <div class="container">
                <div class="nookstitulo">
                    <h1>
                    Buz�n de entrada
                    </h1>
                </div>

                <div class="pag-buzon">

                    <div class="mensajesBuzon">
                        
                        <%
                            ArrayList<Mensaje> mensajes= (ArrayList<Mensaje>)request.getAttribute("mensajes");
                            for(int i=mensajes.size()-1; i >= 0;i--){
                        %>
                        <div class="mensajeBuzon">
                            
                            <p class="usuario"><%= mensajes.get(i).getAutor() %> <%if(mensajes.get(i).getLeido() == 0){%>
                                <span class="leido">Nuevo</span>
                            <%}%><p>
                            <p class="asunto"><%= mensajes.get(i).getAsunto() %></p>
                            <p class="fecha"><%= mensajes.get(i).getFecha() %></p>
                            <p class="verMensaje"><button type="submit" onclick="window.location.href='mensajeSV?idMensaje=<%=mensajes.get(i).getIdMensaje()%>&tipo=<%=mensajes.get(i).getTipo()%>'">Ver</button></p>
                        </div>
                        <%}%>
                        
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
