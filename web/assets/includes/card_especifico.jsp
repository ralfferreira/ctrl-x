<%@page import="Formatador.Valor"%>
<%@page import="Model.Grafico_Info"%>
<%@page import="java.util.ArrayList"%>
<%@page import="GraficoData.GraficoData"%>
<%    
    Integer cat = Integer.parseInt(request.getParameter("cod_tipotrans"));
    GraficoData daoCard = new GraficoData();
    ArrayList<Grafico_Info> listaCard = daoCard.CardInfo((Integer) request.getSession().getAttribute("id"),cat);
    
    String opcaoCard;    
    ArrayList<Double> GastosCard = daoCard.ConverterValor(listaCard, opcaoCard = "Gasto");
    ArrayList<Double> RendCards = daoCard.ConverterValor(listaCard, opcaoCard = "Rend");
    ArrayList<Double> MetaCards = daoCard.ConverterValor(listaCard, opcaoCard = "Meta");
    
    Valor formatarValor = new Valor();
    Double Valor = 0.0;
%>
<div class="dashboard-cards">
    <div class="card-content" id="card-rendimento">
        <%
            for(Double valores : RendCards){
                Valor = Valor + valores;
            }
            Double RendCard = Valor;
            Valor = 0.0;
        %>
        <h3>Rendimento</h3>        
        <h4><%= formatarValor.FormatarValor(RendCard) %></h4>
    </div>
    <div class="card-content" id="card-saldo">
        <%
            for(Double valores : GastosCard){
                Valor = Valor + valores;
            }
            Double GastoCard = Valor;
        %>
        <h3>Saldo</h3>
        <h4><%= formatarValor.FormatarValor((RendCard + GastoCard)) %></h4>
        <%
            Valor = 0.0;
        %>
    </div>
    <div class="card-content" id="card-meta">
        <%
            for(Double valores : MetaCards){
                Valor = Valor + valores;
            }
        %>
        <h3>Meta</h3>
        <h4><%= formatarValor.FormatarValor(Valor) %></h4>
        <%
            Valor = 0.0;
        %>
    </div>
    <div class="card-content" id="card-gasto">
        <h3>Gasto</h3>
        <h4><%= formatarValor.FormatarValor(GastoCard) %></h4>
    </div>
</div>
