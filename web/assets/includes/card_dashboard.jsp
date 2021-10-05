<%@page import="Formatador.Valor"%>
<%@page import="Model.Grafico_Info"%>
<%@page import="java.util.ArrayList"%>
<%@page import="GraficoData.GraficoData"%>
<%    
    GraficoData daoGrafico = new GraficoData();
    ArrayList<Grafico_Info> listaCard = daoGrafico.CardInfo((Integer) request.getSession().getAttribute("id"),0);
    
    String opcaoCard;    
    ArrayList<Double> GastosCard = daoGrafico.ConverterValor(listaCard, opcaoCard = "Gasto");
    ArrayList<Double> RendCards = daoGrafico.ConverterValor(listaCard, opcaoCard = "Rend");
    ArrayList<Double> MetaCards = daoGrafico.ConverterValor(listaCard, opcaoCard = "Meta");
    
    Valor formatValor = new Valor();
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
        <h4><%= formatValor.FormatarValor(RendCard) %></h4>
    </div>
    <div class="card-content" id="card-saldo">
        <%
            for(Double valores : GastosCard){
                Valor = Valor + valores;
            }
            Double GastoCard = Valor;
        %>
        <h3>Saldo</h3>
        <h4><%= formatValor.FormatarValor((RendCard + GastoCard)) %></h4>
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
        <h4><%= formatValor.FormatarValor(Valor) %></h4>
        <%
            Valor = 0.0;
        %>
    </div>
    <div class="card-content" id="card-gasto">
        <h3>Gasto</h3>
        <h4><%= formatValor.FormatarValor(GastoCard) %></h4>
    </div>
</div>