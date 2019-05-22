<%@page import="modelo.Usuario"%>
<%@page import="conexionDB.usuarioDB"%>
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
        
        <script type="text/javascript">
            function pswigual(){
                var a=document.getElementsByName("pswN")[0].value;
                var b=document.getElementsByName("pswrepeat")[0].value;
               
                if(a !== b){
                    alert("Los campos \"Nueva contrase�a\" y \"Repetir nueva contrase�a\" deben ser iguales");
                    return false;
                }
                 while (!espacios && (cont < a.length)) {
                if (a.charAt(cont) === " ")
                     espacios = true;
                     cont++;
                }
 
                if (espacios) {
                    alert ("La contrase�a no puede contener espacios en blanco");
                    return false;
                }
                if (a.length === 0 || b.length === 0) {
                    alert("Los campos de la password no pueden quedar vacios");
                    return false;
                }
                if (a.length <= 4) {
                    alert("La contrase�a debe tener mas de 4 d�gitos");
                    return false;
                }
                if (a.length >= 15) {
                    alert("La contrase�a debe tener menos de 15 d�gitos");
                    return false;
                }
            }
            
        </script>
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
                    Configuraci�n
                    </h1>
                </div>

                <div class="pag-archivo">
                    
                    <form class="archivo"  method="post" enctype="multipart/form-data" action="/configuracionSV">
                            <ul>
                              
                                <li><a><img  src= "recuperarImagenesSV?userName=<%=userName%>" width="150" height="150"  alt="Imagen del perfil"></a></li>
                                <li><input type="file"  name ="foto"></li>
                                <li><button type="submit" name="Cambiar">Cambiar</button></li>

                            </ul>
                    </form>
                   
                        
                             <form class="pag-config"  method="post" action="/cambioClaveSV" onsubmit="return pswigual()">

                                <label for="psw"><b>Antigua contrase�a</b></label>
                                <input class="input" type="password" placeholder="Antigua contrase�a" name="psw" required>

                                <label for="psw"><b>Nueva contrase�a</b></label>
                                <input class="input" type="password" placeholder="Contrase�a" name="pswN" required>

                                <label for="psw-repeat"><b>Repetir nueva contrase�a</b></label>
                                <input class="input" type="password" placeholder="Repetir Contrase�a" name="pswrepeat" required>
                                    
                                <button type="submit">Cambiar contrase�a</button>
                             </form>
                        
                </div>
            </div>
        </main>
        </div>
        <footer class="footer">
          � Proyecto Filenook - 2019 - Andr�s Cabero Mata -  Patricia Aguado Labrador - Rafael Higelmo San Mill�n - Santiago Blasco Arnaiz
        </footer>
    </body>
</html>
