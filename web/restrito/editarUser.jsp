<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.User" %>
<%@page import="editarUser.editarUser" %>
<%@page import="java.util.ArrayList"%>
<% 
    editarUser dao = new editarUser();
    ArrayList<User> lista = dao.listar(Integer.parseInt(request.getParameter("Id")));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css2?family=Roboto&family=Ubuntu:wght@70display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../assets/css/style.css">
        <title>Ctrl-X - Editar Cliente</title>
    </head>
    <body>
        <div id="registro-home">      
            <div id="registro">
                <header id ="registro-header">
                    <a href="consultas_admin.jsp">
                        <img class="header-voltar-icon" src="../assets/img/icon1-header.png">
                        <h2 class="header-voltar-link">Volte para o Dashboard</h2>
                    </a>
                </header>            
                <div id="form-registro">
                    <% if(lista.size() == 1) { %>
                        <% for(User conteudo : lista) { %>
                            <form name="frmRegistro" method="post" action="../editarUser">
                                <h3>Atualização de Cadastro</h3>
                                <input name="txt_id" type="hidden" id="txt_id" value="<%= conteudo.getId() %>">
                                <br/>
                                <input name="txt_nome" type="text" id="txt_nome" placeholder="Nome completo" value="<%= conteudo.getNome() %>">
                                <br/>
                                <input name="txt_email" type="text" id="txt_email" placeholder="E-mail" value="<%= conteudo.getEmail() %>">
                                <br/>
                                <input name="txt_cpf" type="text" id="txt_cpf" placeholder="CPF" value="<%= conteudo.getCPF() %>">
                                <br/>
                                <input name="txt_senha" type="password" id="txt_senha" placeholder="Senha" value="">
                                <br/>
                                <input class="submit-cadastrar" id="submit" type="submit" name="Submit" value="Cadastrar"> 
                            </form>
                        <% } %>
                    <% } %>
                </div>      
            </div>
        </div>
        <script src="../assets/js/main.js"></script>
    </body>
</html>
