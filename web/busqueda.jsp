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
                  <div class="resultado_busqueda">
                      <h1>
                       Resultados de la búsqueda
                      </h1>



                      <form class="search-bar" method="post" action="/buscarSV" >
                            <input type="search" placeholder="&#128269 Busca aquí nooks..." name="search" required>
                            <input type="submit" value="Buscar">
                      </form>

                  </div>
                 <div class="pag-nook_n">
                        <div class="nook_n">

                                 <a href="#"><img src="imagenes/integrales.png"></a>
                                 <div class="titulo_nook">
                                  <h3>Integrales </h3>
                                  <h4>Categoria:matematicas,integrales,ejercicios,ejemplos</h4>
                                  <p>Ejemplos y ejercicios de integrales de complejidad ascendente.</p>
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
                  </div>
              </div>
          </main>
      </div>
      <footer class="footer">
        © Proyecto Filenook - 2019 - Andrés Cabero Mata -  Patricia Aguado Labrador - Rafael Higelmo San Millán - Santiago Blasco Arnaiz
      </footer>
    </body>
</html>
