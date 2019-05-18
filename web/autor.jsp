<%@page import="modelo.Usuario"%>
<%@page import="modelo.Nook"%>
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
        
        Usuario usuario = (Usuario) request.getAttribute("autor");
        
        String autor = usuario.getNombreUsuario();

        %>
        <div class="content">
            <header class="header">
                <div class="container logo-nav-container">
                    <a href="/inicialSV" class="logo">FILENOOK</a>
                    <nav class="navigation">
                        <ul>
                            <li class="navigation-usuario"><a href="perfil.jsp"><%=userName%></a></li>
                            <li><a href="perfil.jsp"><img <img src="recuperarImagenesSV?userName=<%=userName%>" style="width:90px;
    height:90px;
    border-radius: 50px;"
                                                           alt="Imagen del perfil de usuario" ></a></li>
                        </ul>
                    </nav>
                </div>
            </header>

            <main class="main">
                <div class="container">
                    <div class="perfil">
                        <ul>
                            <li><img src="imagenes/chico1.png" alt="Imagen del perfil de usuario"></li>
                            <li><h1><%=autor%></h1></li>
                            <li>
                                <button type="submit" class="enviar_mensaje" onclick="window.location.href='crearMensaje.jsp'">Enviar mensaje</button>
                            </li>
                        </ul>
                    </div>
                    <div class="pag-nook_n">
                        <%
                        ArrayList<Nook> nooks = (ArrayList<Nook>) request.getAttribute("nooks");
                        ArrayList<String> nooksCategorias = (ArrayList<String>) request.getAttribute("nooksCategorias");
                        for(int i = 0; i < nooks.size(); i++){
                        double valoracion = Math.round(nooks.get(i).getValoracionMedia());
                        %>
                        
                           <div class="nook_n">
                                   <div class="nook_n_img">
                                    <a href="#"><img src="imagenes/simpleLogo.png"></a>
                                   </div>
                                   <div class="titulo_nook">
                                   <h3><%=nooks.get(i).getNombre()%></h3>
                                    <%if(nooksCategorias.get(i)!=null){%>
                                    <h4>Categoria: <%=nooksCategorias.get(i)%></h4>
                                    <%}else{%>
                                    <h4>Categoria: none<h4>
                                    <%}%>
                                    <p><%=nooks.get(i).getResumen()%></p>

                                   </div>
                                <div class="star1">
                                        <form class="valoracion" method="post" action="/valorarNookSV?idNook=<%=nooks.get(i).getIdNook()%>&urlPagina=/autorSV?nombre=<%=autor%>">
                                        <p class="clasificacion">
                                        <input id="<%=nooks.get(i).getIdNook()%>,5" type="radio" name="estrellas<%=nooks.get(i).getIdNook()%>" value="5" onclick="this.form.submit();" <%if(valoracion==5){%> checked <%}%> >
                                        <label for="<%=nooks.get(i).getIdNook()%>,5">&#9734;</label>
                                        <input id="<%=nooks.get(i).getIdNook()%>,4" type="radio" name="estrellas<%=nooks.get(i).getIdNook()%>" value="4" onclick="this.form.submit();" <%if(valoracion==4){%> checked <%}%> >
                                        <label for="<%=nooks.get(i).getIdNook()%>,4">&#9734;</label>
                                        <input id="<%=nooks.get(i).getIdNook()%>,3" type="radio" name="estrellas<%=nooks.get(i).getIdNook()%>" value="3" onclick="this.form.submit();" <%if(valoracion==3){%> checked <%}%> >
                                        <label for="<%=nooks.get(i).getIdNook()%>,3">&#9734;</label>
                                        <input id="<%=nooks.get(i).getIdNook()%>,2" type="radio" name="estrellas<%=nooks.get(i).getIdNook()%>" value="2" onclick="this.form.submit();" <%if(valoracion==2){%> checked <%}%> >
                                        <label for="<%=nooks.get(i).getIdNook()%>,2">&#9734;</label>
                                        <input id="<%=nooks.get(i).getIdNook()%>,1" type="radio" name="estrellas<%=nooks.get(i).getIdNook()%>" value="1" onclick="this.form.submit();" <%if(valoracion==1){%> checked <%}%> >
                                        <label for="<%=nooks.get(i).getIdNook()%>,1">&#9734;</label>
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
             © Proyecto Filenook - 2019 - Andrés Cabero Mata -  Patricia Aguado Labrador - Rafael Higelmo San Millán - Santiago Blasco Arnaiz
        </footer>
    </body>
</html>
