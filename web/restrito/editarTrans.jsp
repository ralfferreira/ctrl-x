<%@page import="Model.Categoria"  %>
<%@page import="listarTipo.listarTipo" %>
<%@page import="editarTrans.editarTrans" %>
<%@page import="Model.Transacao" %>
<%@page import="java.util.ArrayList"%>
<%
    Integer user = (Integer) request.getSession().getAttribute("id");
    String cod_trans = request.getParameter("cod_trans");
    
    listarTipo dao = new listarTipo();
    ArrayList<Categoria> lista = dao.ListarPorUser(user);
    
    editarTrans dao1 = new editarTrans();
    ArrayList<Transacao> listar = dao1.listar(cod_trans);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css2?family=Roboto&family=Ubuntu:wght@70display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../assets/css/style.css">
        <title>Atualizando Transações</title>
    </head>
    <body id="cadTransacoes">
        <div id="registro-home">      
            <div id="registro">
                <header id ="registro-header">
                    <a href="transacoes_user.jsp">
                        <img class="header-voltar-icon" src="../assets/img/icon1-header-ativo.png">
                        <h2 class="header-voltar-link">Volte para o dashboard</h2>
                    </a>
                </header>            
                <div id="form-registro">
                    <% if(listar.size() == 1) { %>
                    <% for(Transacao trans : listar) {%>
                    <form name="frmCadGasto" method="post" action="../editarTrans">
                        <h3>Atualização de Transação</h3>
                        <input name="txt_user" type="hidden" id="txt_user" value="<%=user%>">
                        <br/>
                        <input name="txt_codtrans" type="hidden" id="txt_codtrans" value="<%=trans.getId()%>">
                        <input name="txt_valor" type="text" id="txt_valor" placeholder="Valor">
                        <br/>
                        <div class="custom-select-editar">
                        <select class="sem-categoria" name="txt_categoria">                            
                            <%
                                for(Categoria cat : lista) {
                            %>
                            <option value="<%= cat.getId() %>" name="txt_categoria"><%= cat.getNome() %></option>
                            <%}%>
                        </select>
                        </div>
                        <input name="txt_data" type="date" id="txt_data" placeholder="Data">
                        <br/>
                        <input name="txt_notas" type="text" id="txt_notas" placeholder="Notas">
                        <br/>
                        <input id="submit" type="submit" name="Submit" value="Salvar"> 
                    </form>
                    <% } %>
                    <% } %>
                </div>      
            </div>
        </div>
        <script src="../assets/js/main.js"></script>
    </body>
</html>