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
                        ArrayList<String> misNooksCategorias = (ArrayList<String>) request.getAttribute("misNooksCategorias");
                        for(int i = 0; i < misNooks.size(); i++){
                    %>
                       <div class="nook_n">

                           <a href="/verNookSV?idNook=<%=misNooks.get(i).getIdNook()%>"><img src="imagenes/simpleLogo.png"></a>
                               <div class="titulo_nook">
                                <h3><%=misNooks.get(i).getNombre()%></h3>
                                <%if(misNooksCategorias.get(i)!=null){%>
                                <h4>Categoria: <%=misNooksCategorias.get(i)%></h4>
                                <%}else{%>
                                <h4>Categoria: none<h4>
                                <%}%>
                                <p><%=misNooks.get(i).getResumen()%></p>
                               </div>
                            <div class="star">
                                <form class="valoracion"  method="post" action="/valoracionMediaNookSV?idNook=<%=misNooks.get(i).getIdNook()%>">
                                    <p class="clasificacion">
                                    <input id="<%=misNooks.get(i).getIdNook()%>,5" type="radio" name="estrellas" value="5">
                                    <label for="<%=misNooks.get(i).getIdNook()%>,5">&#11088;</label>
                                    <input id="<%=misNooks.get(i).getIdNook()%>,4" type="radio" name="estrellas" value="4">
                                    <label for="<%=misNooks.get(i).getIdNook()%>,4">&#11088;</label>
                                    <input id="<%=misNooks.get(i).getIdNook()%>,3" type="radio" name="estrellas" value="3">
                                    <label for="<%=misNooks.get(i).getIdNook()%>,3">&#11088;</label>
                                    <input id="<%=misNooks.get(i).getIdNook()%>,2" type="radio" name="estrellas" value="2">
                                    <label for="<%=misNooks.get(i).getIdNook()%>,2">&#11088;</label>
                                    <input id="<%=misNooks.get(i).getIdNook()%>,1" type="radio" name="estrellas" value="1">
                                    <label for="<%=misNooks.get(i).getIdNook()%>,1">&#11088;</label>
                                    </p>
                                </form>
                            </div>
                       </div>
                    <%}%>
                </div>
        </div>
        </main>
        </div>
        <footer class="footer">
          � Proyecto Filenook - 2019 - Andr�s Cabero Mata -  Patricia Aguado Labrador - Rafael Higelmo San Mill�n - Santiago Blasco Arnaiz
        </footer>
    </body>
</html>
