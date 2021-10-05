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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.css" integrity="sha512-SUJFImtiT87gVCOXl3aGC00zfDl6ggYAw5+oheJvRJ8KBXZrr/TMISSdVJ5bBarbQDRC2pR5Kto3xTR0kpZInA==" crossorigin="anonymous" />
        <title>Ctrl-X - Página do Usuário</title>
    </head>
    <body>
        <%@include file="../assets/includes/restrito_menu.jsp" %>
        <div id="restrito-home">
            <div class="restrito-main">
                <div class="restrito-header">
                    <%@include file="../assets/includes/restrito_header_logo.jsp" %>
                    <div class="restrito-header-box">
                        <a href="restrito_user.jsp">
                            <img class="restrito-header-icon" src="../assets/img/icon1-header-ativo.png">
                            <h2 class="restrito-header-links" id="restrito-destaque">Dashboard</h2>
                        </a>
                    </div>
                    <%@include file="../assets/includes/restrito_header_trans.jsp" %>
                    <%@include file="../assets/includes/restrito_header_tipo.jsp" %>                    
                    <%@include file="../assets/includes/restrito_header_meta.jsp" %>
                </div>
                <div class="restrito-conteudo">
                    <div class="dashboard-header-geral"></div>
                    <div class="dashboard-main">
                        <div class="dashboard-conteudo">      
                            <h1 id="graphic-title">Despezas gerais</h1>
                            <div class="dashboard-graphic">
                                <canvas id="myChart"></canvas>
                            </div>
                            <%@include file="../assets/includes/card_dashboard.jsp" %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.js" integrity="sha512-G8JE1Xbr0egZE5gNGyUm1fF764iHVfRXshIoUWCTPAbKkkItp/6qal5YAHXrxEu4HNfPTQs6HOu3D5vCGS1j3w==" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" integrity="sha512-s+xg36jbIujB2S2VKfpGmlC3T5V2TF3lY48DX7u2r9XzGzgPsa6wTpOQA7J9iffvdeBN0q9tKzRxVxw1JviZPg==" crossorigin="anonymous"></script>
        <script src="../assets/js/main.js"></script>
        <%@include file="../assets/includes/grafico_dashboard.jsp" %>
    </body>
</html>
<%
    }
    else{
        session.setAttribute("erro",2);
        response.sendRedirect("../login.jsp");
    }
%>