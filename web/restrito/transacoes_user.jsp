<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Formatador.*"%>
<%@page import="Model.Transacao"  %>
<%@page import="listarTrans.listarTrans" %>
<%@page import="java.util.ArrayList"%>
<%
    boolean logado = (Boolean) request.getSession().getAttribute("logado");
    
    
    if(logado){
        String nome = (String) request.getSession().getAttribute("nome");
        String email = (String) request.getSession().getAttribute("email");
        Integer user = (Integer) request.getSession().getAttribute("id");
%>
<%
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
    listarTrans dao = new listarTrans();
    ArrayList<Transacao> lista = dao.ListarPorUser(user);
    Valor formatValor = new Valor();
    Data formatData = new Data();
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
    <body id="transacoes_user">
        <%@include file="../assets/includes/restrito_menu.jsp" %>
        <div id="restrito-home">
            <div class="restrito-main">
                <div class="restrito-header"> 
                    <%@include file="../assets/includes/restrito_header_logo.jsp" %>
                    <%@include file="../assets/includes/restrito_header_dashboard.jsp" %>
                    <div class="restrito-header-box">
                        <a href="transacoes_user.jsp">
                            <img class="restrito-header-icon" src="../assets/img/icon2-header-ativo.png" alt="Icon Header">
                            <h2 class="restrito-header-links" id="restrito-destaque">Transações</h2>
                        </a>
                    </div>                     
                    <%@include file="../assets/includes/restrito_header_tipo.jsp" %>                    
                    <%@include file="../assets/includes/restrito_header_meta.jsp" %>
                </div>                
                <div class="restrito-conteudo">
                    <div class="dashboard-header-geral"></div>                    
                    <div class="dashboard-main">
                        <div class="dashboard-conteudo">
                            <h1 class="dashboard-title">Transações</h1>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" integrity="sha512-s+xg36jbIujB2S2VKfpGmlC3T5V2TF3lY48DX7u2r9XzGzgPsa6wTpOQA7J9iffvdeBN0q9tKzRxVxw1JviZPg==" crossorigin="anonymous"></script>
    <script src="../assets/js/main.js"></script>
    </body>
</html>
<%
    }
    else {
        session.setAttribute("erro",2);
        response.sendRedirect("../login.jsp");
    }
%>