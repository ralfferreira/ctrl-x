<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css2?family=Roboto&family=Ubuntu:wght@70display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../assets/css/style.css">
        <title>Criar Categoria</title>
    </head>
    <body id="cadCategorias">
        <div id="registro-home">      
            <div id="registro">
                <header id ="registro-header">
                    <a href="categorias_user.jsp">
                        <img class="header-voltar-icon" src="../assets/img/icon1-header-ativo.png">
                        <h2 class="header-voltar-link">Volte para categorias</h2>
                    </a>
                </header>            
                <div id="form-registro">
                    <form name="frmCadGasto" method="post" action="../cadTipo">
                        <h3>Criar categoria</h3>
                        <input name="txt_user" type="hidden" id="txt_user" value="<%=(Integer)request.getSession().getAttribute("id")%>">
                        <br/>
                        <input name="txt_categoria" type="text" id="txt_categoria" placeholder="Nome da Categoria">
                        <br/>
                        <input id="submit" type="submit" name="Submit" value="Salvar"> 
                        <h4>Sugestões: Esporte, Roupas, Mercado, Contas</h4>
                    </form>
                </div>      
            </div>
        </div>
        <script src="../assets/js/main.js"></script>
    </body>
</html>