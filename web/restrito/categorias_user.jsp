<%@page import="Model.Categoria"  %>
<%@page import="listarTipo.listarTipo" %>
<%@page import="java.util.ArrayList"%>
<% 
    boolean logado = (Boolean) request.getSession().getAttribute("logado");

    if(logado){
        String nome = (String) request.getSession().getAttribute("nome");
        String email = (String) request.getSession().getAttribute("email");
        Integer user = (Integer) request.getSession().getAttribute("id");
%>
<%
    listarTipo dao = new listarTipo();
    ArrayList<Categoria> lista = dao.ListarPorUser(user);
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
    <body id="categoria_user">
        <%@include file="../assets/includes/restrito_menu.jsp" %>
        <div id="restrito-home">
            <div class="restrito-main">
                <div class="restrito-header"> 
                    <%@include file="../assets/includes/restrito_header_logo.jsp" %>
                    <%@include file="../assets/includes/restrito_header_dashboard.jsp" %>
                    <%@include file="../assets/includes/restrito_header_trans.jsp" %>
                    <div class="restrito-header-box">
                        <a href="categorias_user.jsp">
                            <img class="restrito-header-icon" src="../assets/img/icon4-header-ativo.png" alt="Icon Header">
                            <h2 class="restrito-header-links" id="restrito-destaque">Categorias</h2>
                        </a>
                    </div>
                    <%@include file="../assets/includes/restrito_header_meta.jsp" %>                    
                </div>
                <div class="restrito-conteudo">
                    <div class="dashboard-header-geral"></div>                    
                    <div class="dashboard-main">
                        <div class="dashboard-conteudo">
                            <h1 class="dashboard-title">Categorias</h1>
                        </div>
                    </div>
                    <div class="add-categorias">
                        <a href="cadCategorias.jsp">
                            <button class="btn-add-categorias">Criar categoria</button>
                        </a>
                    </div>
                    <div class="consulta-main">
                        <div class="consulta-conteudo">
                            <div class="consulta-tabela">
                                <h4>Foram encontrados <%= lista.size() %> categorias.</h4>
                                <table class="tabela">
                                    <thead class="tabela-conteudo">
                                        <tr>
                                            <th>Nome da Categoria</th>
                                            <th>Ação</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for(Categoria conteudo : lista) { %>
                                        <tr>
                                            <td><a class="link-categoria-especifica" href="categoriaEspecifica.jsp?cod_tipotrans=<%= conteudo.getId() %>"><%= conteudo.getNome() %></a></td>
                                                <td>
                                                    <% int id = conteudo.getId();
                                                       if(id != 1){%>
                                                       <a class="tabela-editar" href="editarTipo.jsp?cod_tipotrans=<%= conteudo.getId() %>">Editar</a>
                                                       <a class="tabela-excluir" href="../excluirTipo?cod_tipotrans=<%= conteudo.getId() %>">Excluir</a>
                                                    <%}%>                                                    
                                                </td>
                                            <%}%>
                                        </tr>
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