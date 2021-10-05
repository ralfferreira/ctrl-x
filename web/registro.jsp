<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css2?family=Roboto&family=Ubuntu:wght@70display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Ctrl-X - Registro</title>
    </head>
    <body id="cadUser">
        <div id="registro-home">      
            <div id="registro">
                <header id ="registro-header">
                    <a href="index.jsp">
                        <img class="header-voltar-icon" src="assets/img/icon1-header-ativo.png">
                        <h2 class="header-voltar-link">Volte para o ínicio</h2>
                    </a>
                </header>            
                <div id="form-registro">            
                    <form name="frmRegistro" method="post" action="cadUser">
                        <h3>Registre-se</h3>
                        <input name="txt_nome" type="text" id="txt_nome" placeholder="Nome completo">
                        <br/>
                        <input name="txt_email" type="text" id="txt_email" placeholder="E-mail">
                        <br/>
                        <input name="txt_cpf" type="text" id="txt_cpf" placeholder="CPF">
                        <br/>
                        <input name="txt_senha" type="password" id="txt_senha" placeholder="Senha">
                        <br/>
                        <input class="submit-cadastrar" id="submit" type="submit" name="Submit" value="Cadastrar"> 
                    </form>
                </div>      
            </div>
        </div>
        <script src="assets/js/main.js"></script>
    </body>
<!--
    <header class="header-voltar">
        <a href="index.jsp">
            <img class="header-voltar-icon" src="assets/img/icon1-header.png">
            <h2 class="header-voltar-link">Volte para o ínicio</h2>
        </a>
    </header> 
-->
</html>