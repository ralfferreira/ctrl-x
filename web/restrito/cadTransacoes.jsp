<%@page import="Model.Categoria"  %>
<%@page import="listarTipo.listarTipo" %>
<%@page import="java.util.ArrayList"%>
<%
    Integer user = (Integer) request.getSession().getAttribute("id");
    listarTipo dao = new listarTipo();
    ArrayList<Categoria> lista = dao.ListarPorUser(user);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css2?family=Roboto&family=Ubuntu:wght@70display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../assets/css/style.css">
        <title>Adicionar Transações</title>
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
                    <form name="frmCadGasto" method="post" action="../cadTrans">
                        <h3>Adicionar transações</h3>
                        <input name="txt_user" type="hidden" id="txt_user" value="<%=request.getSession().getAttribute("id")%>">
                        <br/>
                        <input name="txt_valor" type="text" id="txt_valor" placeholder="Valor">
                        <br/>
                        <div class="custom-select">
                            <select class="sem-categoria" name="txt_tipo">                            
                                <option value="G" name="txt_tipo">Gasto</option>
                                <option value="R" name="txt_tipo">Rendimento</option>
                            </select>
                        </div>
                        <div class="custom-select">
                        <select class="sem-categoria" name="txt_categoria">                            
                            <%
                                for(Categoria cat : lista) {
                            %>
                            <option value="<%= cat.getId() %>" name="txt_categoria"><%= cat.getNome() %></option>
                            <%}%>
                        </select>
                        </div>
                        <br/>
                        <input name="txt_data" type="date" id="txt_data" placeholder="Data">
                        <br/>
                        <input name="txt_notas" type="text" id="txt_notas" placeholder="Notas">
                        <br/>
                        <input id="submit" type="submit" name="Submit" value="Salvar"> 
                    </form>
                </div>      
            </div>
        </div>
        <script src="../assets/js/main.js"></script>
    </body>
</html>