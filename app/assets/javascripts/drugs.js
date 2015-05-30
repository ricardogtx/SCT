
      // Load the Visualization API and the piechart package.
      google.load('visualization', '1.0', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {
        var drugs_data = document.getElementsByName("drugs[]");

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');

        var drug_list = [];
        for(var i=0, len=drugs_data.length; i < len; i++) {
          var drug = drugs_data[i].value.split('|');

          drug_list.push([
            drug[0], parseFloat(drug[1])
          ]);
        }


        data.addRows(drug_list);

        // Set chart options
        var options = {
        width: 600,
        height: 400,
        title: 'Ranking de uso na vida das diferentes drogas psicotrópicas',
        colors: ['#000000', '#C2C2C2', '#8E8E8E', '#525252','#0F0F0F'],
        is3D: true,
        'chartArea': {'width': '100%', 'height': '80%'},
        backgroundColor: { fill:'transparent' }
        };



        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }