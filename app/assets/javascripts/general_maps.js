google.load('visualization', '1', {'packages': ['geochart']});
     google.setOnLoadCallback(drawMarkersMap);

      function drawMarkersMap() {
      var data = google.visualization.arrayToDataTable([
        ['State',   'Clinicas'],
        ['BR-DF', 20],
        ['BR-AC', 25],
        ['BR-AL', 30],
        ['BR-AM', 55],
        ['BR-BA', 32],
        ['BR-CE', 20],
        ['BR-ES', 12],
        ['BR-GO', 11],
        ['BR-MA', 33],
        ['BR-MT', 21],
        ['BR-MS', 11],
        ['BR-MG', 9],
        ['BR-PA', 21],
        ['BR-PB', 21],
        ['BR-PR', 34],
        ['BR-PE', 15],
        ['BR-PI', 12],
        ['BR-RJ', 23],
        ['BR-RN', 32],
        ['BR-RS', 11],
        ['BR-RO', 19],
        ['BR-RR', 41],
        ['BR-SC', 38],
        ['BR-SP', 25],
        ['BR-SE', 21],
        ['BR-TO', 12],
        ['BR-GO', 37]
      ]);

      var options = {
        region: 'BR',
        resolution: 'provinces',
        datalessRegionColor:  'transparent',
        colorAxis: {colors: ['#00853f', '#e31b23']},
        backgroundColor: { fill:'transparent' }
      };

      var chart = new google.visualization.GeoChart(document.getElementById('chart_div'));
      chart.draw(data, options);
    };