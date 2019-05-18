<%@page import="modelo.Nook"%>
<%@page import="java.util.ArrayList"%>
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
        HttpSession sesion = request.getSession();
        String userName = (String) sesion.getAttribute("usuario");
        boolean buscar=false;
        %>
        <div class="content">
            <header class="header">
                <nav class="container logo-nav-container">
                    <a href="/inicialSV" class="logo">FILENOOK</a>
                    <div class="navigation">
                        <ul>
                            <li class="navigation-usuario"><a href="perfil.jsp"><%=userName%></a></li>
                            <li><a href="perfil.jsp"><img src="recuperarImagenesSV?userName=<%=userName%>"
                                                           alt="Imagen del perfil de usuario" style="width:90px;
    height:90px;
    border-radius: 50px;" ></a></li>
                        </ul>
                    </div>
                </nav>
            </header>
            <main class="main">
                <div class="container">
                    <div class="proyectos-inicial">
                        
                      
                        
                        
                        <from class="search-bar" method="post" action="/buscarSV" >
                            <input type="search" placeholder="&#128269 Busca aquí nooks..." name="search" required>
                            <input type="submit" value="Buscar" OnClick=<%buscar=true;%> >
                        </from>
                        
                        
                        
                        <p>Populares</p>
                        <div id="populares" class="slider">      <!-- Give wrapper ID to target with jQuery & CSS -->
                            <div class="MS-content">
                                <%
                                    ArrayList<Nook> nooksP = (ArrayList<Nook>)request.getAttribute("nooksPopulares");
                                    for(int i=0;i<nooksP.size();i++){
                                %>
                                <div class="item"><a href='/nookSV?idNook=<%=nooksP.get(i).getIdNook()%>'><div class="item-link"><%=nooksP.get(i).getNombre()%></div></a></div>
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
                                    ArrayList<Nook> nooksD = (ArrayList<Nook>) request.getAttribute("nooksDescargas");
                                    for(int i=0;i<nooksD.size();i++){
                                %>
                                <div class="item"><a href='/nookSV?idNook=<%=nooksD.get(i).getIdNook()%>'><div class="item-link"><%=nooksD.get(i).getNombre()%></div></a></div>
                                <%}%>
                            </div>
                            <div class="MS-controls">
                                <button class="MS-left"><i class="fa fa-chevron-left" aria-hidden="true"></i></button>
                                <button class="MS-right"><i class="fa fa-chevron-right" aria-hidden="true"></i></button>
                            </div>
                        </div>
                            
                            
                            
                            
                               
                          
                        <% if(buscar){%>
                        <%  
                        
                        ArrayList<Nook> nooksB= (ArrayList<Nook>) request.getAttribute("nooksB");
                        ArrayList<String> NooksCategorias = (ArrayList<String>) request.getAttribute("NooksCategorias");
                        for(int i = 0; i < nooksB.size(); i++){
                        double valoracion = Math.round(nooksB.get(i).getValoracionMedia());
                        
                        %>
                       <div class="nook_n">
                            <div class="nook_n_img">
                                <a href="/nookSV?idNook=<%=nooksB.get(i).getIdNook()%>"><img src="imagenes/simpleLogo.png"></a>
                            </div>
                            <div class="titulo_nook">
                                <h3><%=nooksB.get(i).getNombre()%></h3>
                                <%if(NooksCategorias.get(i)!=null){%>
                                <h4>Categoria: <%=NooksCategorias.get(i)%></h4>
                                <%}else{%>
                                <h4>Categoria: none<h4>
                                <%}%>
                                <p><%=nooksB.get(i).getResumen()%></p>
                            </div>
                            <div class="star">
                                <form class="valoracion"  method="post" action="/valorarNookSV?idNook=<%=nooksB.get(i).getIdNook()%>&urlPagina=/buscarSV">
                                    <p class="clasificacion">
                                    <input id="<%=nooksB.get(i).getIdNook()%>,5" type="radio" name="estrellas<%=nooksB.get(i).getIdNook()%>" value="5" onclick="this.form.submit();" <%if(valoracion==5){%> checked <%}%> >
                                    <label for="<%=nooksB.get(i).getIdNook()%>,5">&#9733;</label>
                                    <input id="<%=nooksB.get(i).getIdNook()%>,4" type="radio" name="estrellas<%=nooksB.get(i).getIdNook()%>" value="4" onclick="this.form.submit();" <%if(valoracion==4){%> checked <%}%>>
                                    <label for="<%=nooksB.get(i).getIdNook()%>,4">&#9733;</label>
                                    <input id="<%=nooksB.get(i).getIdNook()%>,3" type="radio" name="estrellas<%=nooksB.get(i).getIdNook()%>" value="3" onclick="this.form.submit();" <%if(valoracion==3){%> checked <%}%>>
                                    <label for="<%=nooksB.get(i).getIdNook()%>,3">&#9733;</label>
                                    <input id="<%=nooksB.get(i).getIdNook()%>,2" type="radio" name="estrellas<%=nooksB.get(i).getIdNook()%>" value="2" onclick="this.form.submit();" <%if(valoracion==2){%> checked <%}%>>
                                    <label for="<%=nooksB.get(i).getIdNook()%>,2">&#9733;</label>
                                    <input id="<%=nooksB.get(i).getIdNook()%>,1" type="radio" name="estrellas<%=nooksB.get(i).getIdNook()%>" value="1" onclick="this.form.submit();" <%if(valoracion==1){%> checked <%}%>>
                                    <label for="<%=nooksB.get(i).getIdNook()%>,1">&#9733;</label>
                                    </p>
                                </form>
                                    
                            </div>
                                    
                       </div>
                    <%}%> 
                    <%}%>                        
                    
                    
                    

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
