<%
    boolean logado = (Boolean) request.getSession().getAttribute("logado");

    if(logado){
        String nome = (String) request.getSession().getAttribute("nome");
        String email = (String) request.getSession().getAttribute("email");
%>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css2?family=Roboto&family=Ubuntu:wght@70display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../assets/css/style.css">
        <title>Ctrl-X - Página da Administração</title>
    </head>
    <body>
        <%@include file="../assets/includes/restrito_menu.jsp" %>
        <div id="restrito-home">
            <div class="restrito-main">
                <div class="restrito-header">                    
                    <a href="#">
                        <img class="restrito-header-title" src="../assets/img/CtrlX.png" alt="Logomarca">
                    </a>                   
                    <div class="restrito-header-box">
                        <a href="restrito_admin.jsp">
                            <img class="restrito-header-icon" src="../assets/img/icon1-header.png">
                            <h2 class="restrito-header-links" id="restrito-destaque">Dashboard</h2>
                        </a>
                    </div>                     
                    <div class="restrito-header-box">
                        <a href="consultas_admin.jsp">
                            <img class="restrito-header-icon" src="../assets/img/icon4-header.png" alt="Icon Header">
                            <h2 class="restrito-header-links">Consultas</h2>
                        </a>
                    </div>
                </div>                
                <div class="restrito-conteudo">
                    <div class="dashboard-header-geral"></div>                    
                    <div class="dashboard-main">
                        <div class="dashboard-conteudo">                            
                            <h1 class="dashboard-title">Dashboard</h1>
                            <div class="dashboard-admin">
                                <p class="dashboard-botao-admin">Bem vindo <span><%=nome%></span></p>
                                <p class="dashboard-botao-admin">O seu perfil é de administrador, faça bom proveito :)</p>
                            </div>                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" integrity="sha512-s+xg36jbIujB2S2VKfpGmlC3T5V2TF3lY48DX7u2r9XzGzgPsa6wTpOQA7J9iffvdeBN0q9tKzRxVxw1JviZPg==" crossorigin="anonymous"></script>
    <script src="../assets/js/main.js"></script>
    </body>
</html>
<%
    }
    else{
        session.setAttribute("erro",2);
        response.sendRedirect("../login.jsp");
    }

%>