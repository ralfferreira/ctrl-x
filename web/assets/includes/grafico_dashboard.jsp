<%@page import="java.util.List"%>
<%@page import="Model.Grafico_Info"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Java2Json.Java2Json"%>
<%@page import="GraficoData.GraficoData"%>
<%
    Integer user = (Integer) request.getSession().getAttribute("id");
    GraficoData dao = new GraficoData();
    ArrayList<Grafico_Info> lista = dao.ListarPorUser(user);
    
    String opcao = new String();    
    ArrayList<Double> Gastos = dao.ConverterValor(lista, opcao = "Gasto");
    ArrayList<Double> Rendimentos = dao.ConverterValor(lista, opcao = "Rend");

    Java2Json Convert = new Java2Json();
    String jsonGasto = Convert.ConverterDoubleParaJSON(Gastos);
    String jsonRend = Convert.ConverterDoubleParaJSON(Rendimentos);
%>
<script>
    var ctx = document.getElementById('myChart').getContext('2d');
    
    var chartData = {
        labels: ['Este mês'],
        datasets: [{
                label: 'Rendimento',
                backgroundColor: 'rgb(104,232,143)',
                borderColor: 'green',
                borderWidth: 1,
                minBarLength: 2,
                data: <%= jsonRend %>
        },{
            label: 'Gasto',
                backgroundColor: 'rgb(254,69,69)',
                borderColor: 'red',
                borderWidth: 1,
                minBarLength: 2,
                data: <%= jsonGasto %>
        }]
       };
    
    var chart = new Chart(ctx, {
        type: 'bar',
        data: chartData,
        options: {
            responsive: true,
            maintainAspectRatio: false,
            tooltips: {
                enabled: false
            },
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    });
</script>