<% 
    try{
        boolean logado = (Boolean) request.getSession().getAttribute("logado");
    }
    catch(Exception e){
        request.getSession().setAttribute("logado", false);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css2?family=Roboto&family=Ubuntu:wght@70display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Home - Ctrl-X</title>
    </head>
    <body>
        <div id="page-home">
            <div class="content">
                <%@include file="assets/includes/menu.jsp" %>            
                <main>
                    <div class="main-texto">
                        <h1>Comece agora a gerenciar seus gastos</h1>
                        <h2>Quer mudar de vida e começar a viver mais de seus ganhos?
                        Utilize nossa aplicação que é totalmente gratuita.</h2>
                    </div>
                </main>
            </div>                                                                                                                                  
        </div>
       <script src="../assets/js/main.js"></script>
    </body>
</html>
