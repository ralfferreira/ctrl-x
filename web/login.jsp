<%
    try{
        boolean logado = (Boolean) request.getSession().getAttribute("logado");

        if (logado) {
            String nome = (String) request.getSession().getAttribute("nome");
        }
        else{            
            int erro; request.getSession().getAttribute("erro");

            if ((Integer) session.getAttribute("erro") == null){
                erro = 0;
            }
            else{
                erro = (Integer) session.getAttribute("erro") ;
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
        <title>Ctrl-X - Página de Login</title>
    </head>
    <body>
        <div id="login-home">
            <div id="image">
                <header id ="login-header">
                <a href="index.jsp">
                    <img class="header-voltar-icon" src="assets/img/icon1-header-ativo.png">
                    <h2 class="header-voltar-link">Volte para o ínicio</h2>
                </a>
                </header>
            </div>
            <div id ="login">
                <div id="form-login">
                    <h3>LOGIN</h3>
                    <form name="frmLogin" method="post" action="Login">
                        <input name="txt_email" type="text" id="txt_email" placeholder="Email">
                        <br/>
                        <input name="txt_senha" type="password" id="txt_senha" placeholder="Senha">
                        <br/>
                        <input class="submit-entrar" id="submit" type="submit" name="Submit" value="Entrar">
                    </form>
<%
            if (erro == 1){
                out.println("Usuário e/ou Senha Incorretos");
            }
            else{
                if (erro == 2){
                    out.println("Página Restrita, efetue login!");
                }
            }
        }
    }
    catch(Exception e){
        request.getSession().setAttribute("logado", false);
    }
%>
                    <p id="registrar-direcionar">Não está registrado? Registre-se&nbsp<a id="registrar-endereco" href="registro.jsp">aqui</a></p>
                </div>
            </div>
        </div>
    </body>
 </html>