      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.

      (function() {
  "use strict";

  // Load the Visualization API and the piechart package.
  google.load('visualization', '1.0', {'packages':['corechart']});

  // Set a callback to run when the Google Visualization API is loaded.
  google.setOnLoadCallback(main);

  // Initialize the graphs
  function main(){
    draw_drug_chart("drugs_usage[]", "", "chart_div");
    draw_drug_chart("drugs_death[]", "", "chart_div2");
    draw_drug_chart("drugs_dependency[]", "", "chart_div3");
  }


  // Draw a char graph
  function draw_drug_chart(field_name, title, div_id) {
    var drugs_data = document.getElementsByName(field_name);

    // Kill the function is no data is found
    if(drugs_data.length === 0) {
      console.log("No data found for the graph");
      return;
    }

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
      "title": title,
      is3D: true,
      'chartArea': {'width': '100%', 'height': '80%'},
      backgroundColor: { fill:'transparent' }
    };

    // Instantiate and draw our chart, passing in some options.
    var chart = new google.visualization.PieChart(document.getElementById(div_id));
    chart.draw(data, options);
  }

}) ();