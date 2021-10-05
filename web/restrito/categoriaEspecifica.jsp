<%@page import="Formatador.*"%>
<%@page import="Model.Transacao"%>
<%@page import="listarTrans.listarTrans"%>
<%@page import="Model.Categoria"  %>
<%@page import="editarTipo.editarTipo" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="listarTipo.listarTipo" %>
<% 
    boolean logado = (Boolean) request.getSession().getAttribute("logado");

    if(logado){
        String nome = (String) request.getSession().getAttribute("nome");
        String email = (String) request.getSession().getAttribute("email");
        Integer user = (Integer) request.getSession().getAttribute("id");
%>
<%
    Integer cod_tipotrans = Integer.parseInt(request.getParameter("cod_tipotrans"));
    listarTrans dao = new listarTrans();
    ArrayList<Transacao> lista = dao.ListarPorTipo(user, cod_tipotrans);
    Valor formatValor = new Valor();
    Data formatData = new Data();
    
    String cat_nome = "Categoria Especica";
    for(Transacao dado : lista){
        cat_nome = dado.getNome();
    }
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
                        <div class="dashboard-conteudo" id="categoria-especifica-main">
                            <a class="voltar-categoria" href="categorias_user.jsp">Voltar</a>
                            <h1 class="dashboard-title" id="categoria-especifica-title"><%= cat_nome %></h1>
                            <div class="dashboard-graphic">
                                <canvas id="myChart"></canvas>
                            </div>
                            <%@include file="../assets/includes/card_especifico.jsp" %>
                        </div>
                    </div>
                    <div class="add-transacoes">
                        <a href="cadTransacoes.jsp">
                            <button class="btn-add-trans">Adicionar transação</button>
                        </a>
                    </div>
                    <div class="consulta-main">
                        <div class="consulta-conteudo">
                            <div class="consulta-tabela">
                                <h4>Foram encontrados <%= lista.size() %> transações.</h4>
                                <table class="tabela">
                                    <thead class="tabela-conteudo">
                                        <tr>
                                            <th>Data</th>
                                            <th>Valor</th>
                                            <th>Tipo</th>
                                            <th>Categoria</th>
                                            <th>Notas</th>
                                            <th>Ação</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for(Transacao conteudo : lista) { %>
                                        <tr>
                                            <td><%= formatData.FormatarData(conteudo.getData()) %></td>
                                            <td><%= formatValor.FormatarValor(conteudo.getValor()) %></td>
                                            <td><%= conteudo.getTipo() %></td>
                                            <td><%= conteudo.getNome() %></td>
                                            <td><%= conteudo.getDescricao() %></td>
                                                <td>
                                                    <a class="tabela-editar" href="editarTrans.jsp?cod_trans=<%= conteudo.getId() %>">Editar</a>
                                                    <a class="tabela-excluir" href="../excluirTrans?cod_trans=<%= conteudo.getId() %>">Excluir</a>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.js" integrity="sha512-G8JE1Xbr0egZE5gNGyUm1fF764iHVfRXshIoUWCTPAbKkkItp/6qal5YAHXrxEu4HNfPTQs6HOu3D5vCGS1j3w==" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" integrity="sha512-s+xg36jbIujB2S2VKfpGmlC3T5V2TF3lY48DX7u2r9XzGzgPsa6wTpOQA7J9iffvdeBN0q9tKzRxVxw1JviZPg==" crossorigin="anonymous"></script>
        <script src="../assets/js/main.js"></script>
        <%@include file="../assets/includes/grafico_especifico.jsp" %>
    </body>
</html>
<%
    }
    else{
        session.setAttribute("erro",2);
        response.sendRedirect("../login.jsp");
    }
%>