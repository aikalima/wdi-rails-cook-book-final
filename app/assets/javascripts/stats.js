$(document).ready(function(){

  $.ajax(
    '/data.json',
    {
      success: function(graph_data) {
        var container = $('.chart');
        var colors = ['red','skyblue','green','gold'];

        container.append('<div id="cook_chart" class="graph"/>');
        console.log(graph_data);
        Morris.Bar({
          element: 'cook_chart',
          data: graph_data,
          xkey: 'y',
          ykeys: ['a'],
          labels: ['count']
        });

        // 7 day line chart
        if (false) {
          container.append('<div id="beverage_graph_week" class="graph"/>');
          Morris.Line({
            element: 'beverage_graph_week',
            data: graph_data,
            xkey: 'day',
            ykeys: ['coffee','water','soda','beer'],
            labels: ['coffee','water','soda','beer'],
            parseTime: false,
            lineColors: colors,
            hideHover: true
          });
        }

        if (false) {
          container.append('<div id="beverage_graph_day" class="graph"/>');
          var day_data = graph_data[graph_data.length - 1]
          Morris.Donut({
            element: 'beverage_graph_day',
            data: [
              {label: "Coffee", value: day_data.coffee},
              {label: "Water",  value: day_data.water},
              {label: "Soda",   value: day_data.soda},
              {label: "Beer",   value: day_data.beer}
            ],
            colors: colors
          });
        }
      }
    }
  );
});
