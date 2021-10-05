<%@page import="Model.User"  %>
<%@page import="listarUser.listarUser" %>
<%@page import="java.util.ArrayList"%>
<%
    boolean logado = (Boolean) request.getSession().getAttribute("logado");

    if(logado){
        String nome = (String) request.getSession().getAttribute("nome");
        String email = (String) request.getSession().getAttribute("email");
%>
<%
    listarUser dao = new listarUser();
    ArrayList<User> lista = dao.Listar();
 %>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css2?family=Roboto&family=Ubuntu:wght@70display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../assets/css/style.css">
        <title>Ctrl-X - Página do Usuário</title>
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
                            <h2 class="restrito-header-links">Dashboard</h2>
                        </a>
                    </div>                    
                    <div class="restrito-header-box">
                        <a href="consultas_admin.jsp">
                            <img class="restrito-header-icon" src="../assets/img/icon4-header.png" alt="Icon Header">
                            <h2 class="restrito-header-links" id="restrito-destaque">Consultas</h2>
                        </a>
                    </div>
                </div>                
                <div class="restrito-conteudo">
                    <div class="dashboard-header-geral"></div>                    
                    <div class="consulta-main">
                        <div class="consulta-conteudo">
                            <h1 class="consulta-title">Consultas</h1>
                            <div class="consulta-tabela">
                                <h3 class="tt_menu">Usuários</h3>
                                <h4>Foram encontrados <span><%= lista.size() %></span> registros.</h4>
                                <table class="tabela">
                                    <thead class="tabela-conteudo">
                                        <tr>
                                            <th>Nome Completo</th>
                                            <th>E-Mail</th>
                                            <th>CPF</th>
                                            <th>Ação</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for(User conteudo : lista) { %>
                                        <tr>
                                            <td><%= conteudo.getNome() %></td>
                                            <td><%= conteudo.getEmail() %></td>
                                            <td><%= conteudo.getCPF() %></td>
                                            <% if(conteudo.getEmail().equals("rcs.team@codnet.com")){%>
                                                <td></td>
                                            <%}else{%>
                                                <td>
                                                    <a class="tabela-editar" href="editarUser.jsp?Id=<%= conteudo.getId() %>">Editar</a>
                                                    <a class="tabela-excluir" href="../excluirUser?Id=<%= conteudo.getId() %>">Excluir</a>
                                                </td>
                                            <%}%>                                            
                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<%
    }
    else{
        session.setAttribute("erro",2);
        response.sendRedirect("../login.jsp");
    }

%>