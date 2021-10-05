<%@page import="Model.Categoria"  %>
<%@page import="listarTipo.listarTipo" %>
<%@page import="java.util.ArrayList"%>
<%
    String cod_meta = request.getParameter("cod_meta");
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
        <title>Editando objetivo</title>
    </head>
    <body id="cadMeta">
        <div id="registro-home">      
            <div id="registro">
                <header id ="registro-header">
                    <a href="transacoes_user.jsp">
                        <img class="header-voltar-icon" src="../assets/img/icon1-header-ativo.png">
                        <h2 class="header-voltar-link">Volte para o dashboard</h2>
                    </a>
                </header>            
                <div id="form-registro">
                    <form name="frmCadGasto" method="post" action="../editarMeta">
                        <h3>Editar objetivo</h3>
                        <input name="txt_id" type="hidden" id="txt_id" value="<%=cod_meta%>">
                        <br/>
                        <div class="custom-select">
                        <select class="sem-categoria" name="txt_categoria">
                            <option value="NULL">Geral</option>
                            <%
                                for(Categoria cat : lista) {
                            %>
                            <option value="<%= cat.getId() %>" name="txt_categoria"><%= cat.getNome() %></option>
                            <%}%>
                        </select>
                        </div>
                        <br/>
                        <div class="div-data">
                        <h4>Data Inicio</h4>
                        <h4>Data Limite</h4>
                        <input name="txt_data_inicio" type="date" id="txt_data_inicio" placeholder="Data Inicio">
                        <input name="txt_data_limite" type="date" id="txt_data_limite" placeholder="Data Limite">
                        <br/>
                        </div>
                        <input name="txt_desc" type="text" id="txt_notas" placeholder="Descrição">
                        <br/>
                        <input name="txt_valor" type="text" id="txt_valor" placeholder="Valor">
                        <br/>
                        <input id="submit" type="submit" name="Submit" value="Salvar"> 
                    </form>
                </div>      
            </div>
        </div>
        <script src="../assets/js/main.js"></script>
    </body>
</html>