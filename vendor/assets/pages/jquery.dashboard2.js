/**
* Theme: Velonic Admin Template
* Author: Coderthemes
* Module/App: Dashboard2 Application
*/

!function($) {
    "use strict";

    var Dashboard2 = function() {
        this.$body = $("body")
    };
    //creates area graph
    Dashboard2.prototype.createAreaGraph = function(selector, seriesData, random, colors, labels) {
      var areaGraph = new Rickshaw.Graph( {
          element: document.querySelector(selector),
          renderer: 'area',
          stroke: true,
          height: 190,
          preserve: true,
          series: [
            {
              color: colors[0],
              data: seriesData[0],
              name: labels[0]
            }, 
            {
              color: colors[1],
              data: seriesData[1],
              name: labels[1]
            }
          ]
      });
   
      areaGraph.render();
      
      setInterval( function() {
          random.removeData(seriesData);
          random.addData(seriesData);
          areaGraph.update();
      }, 700 );
      
      $(window).resize(function(){
          areaGraph.render();
      });
    },
    //creates plot graph
    Dashboard2.prototype.createPlotGraph = function(selector, data1, data2, labels, colors, borderColor, bgColor) {
      //shows tooltip
      function showTooltip(x, y, contents) {
        $('<div id="tooltip" class="tooltipflot">' + contents + '</div>').css( {
          position: 'absolute',
          top: y + 5,
          left: x + 5
        }).appendTo("body").fadeIn(200);
      }

      var plot = $.plot($(selector),
          [ { data: data1,
            label: labels[0],
            color: colors[0]
          },
          { data: data2,
            label: labels[1],
            color: colors[1]
          }
        ],
        {
            series: {
               lines: {
              show: true,
              fill: true,
              lineWidth: 1,
              fillColor: {
                colors: [ { opacity: 0.5 },
                          { opacity: 0.5 }
                        ]
              }
            },
            points: {
              show: true
            },
            shadowSize: 0
            },
            legend: {
            position: 'nw'
          },
          grid: {
            hoverable: true,
            clickable: true,
            borderColor: borderColor,
            borderWidth: 1,
            labelMargin: 10,
            backgroundColor: bgColor
          },
          yaxis: {
            min: 0,
            max: 15,
            color: 'rgba(0,0,0,0.1)'
          },
          xaxis: {
            color: 'rgba(0,0,0,0.1)'
          },
          tooltip: true,
          tooltipOpts: {
              content: '%s: Value of %x is %y',
              shifts: {
                  x: -60,
                  y: 25
              },
              defaultTheme: false
          }
      });




    },
    //initializing various charts and components
    Dashboard2.prototype.init = function() {
      //live statics
      var seriesData = [ [], [], [], [], [], [], [], [], [] ];
      var random = new Rickshaw.Fixtures.RandomData(200);

      for (var i = 0; i < 100; i++) {
          random.addData(seriesData);
      }

      //create live area graph
      var colors = ['#1a2942', '#E9E9E9'];
      var labels = ['Moscow', 'Shanghai'];
      this.createAreaGraph("#rickshaw9", seriesData, random, colors, labels);


      //plot graph data
      var uploads = [[0, 9], [1, 8], [2, 5], [3, 8], [4, 5], [5, 14], [6, 10]];
      var downloads = [[0, 5], [1, 12], [2,4], [3, 3], [4, 12], [5, 11], [6, 14]];
      var plabels = ["Visits", "Pages/Visit"];
      var pcolors = ['#3bc0c3', '#1a2942'];
      var borderColor = '#efefef';
      var bgColor = '#fff';
      this.createPlotGraph("#website-stats", uploads, downloads, plabels, pcolors, borderColor, bgColor);
    },

    //init dashboard
    $.Dashboard2 = new Dashboard2, $.Dashboard2.Constructor = Dashboard2
    
}(window.jQuery),

//initializing dashboad2
function($) {
    "use strict";
    $.Dashboard2.init()
}(window.jQuery);


// Sparkline chart

$('.inlinesparkline').sparkline([10, 8, 5, 7, 4, 4, 7, 5, 2, 8, 3, 4, 5], {
    type: 'line',
    width: '100%',
    height: '32',
    lineWidth: 2,
    lineColor: 'rgba(26,41,66,0.7)',
    fillColor: 'rgba(59,192,195,0.5)',
    highlightSpotColor: '#3bc0c3',
    highlightLineColor: '#1a2942',
    spotRadius: 3
});

$('.dynamicbar-big').sparkline([8, 4, 1, 2, 6, 7, 1, 6, 2, 4, 3, 5, 6, 0, 3, 0, 4, 6, 5, 7, 6,9,0], {
    type: 'bar',
    barColor: '#3bc0c3',
    height: '32',
    barWidth: 7,
    barSpacing: 2
});

$('#compositeline').sparkline([8, 4, 1, 2, 6, 7, 1, 6, 2, 4, 3, 5, 6, 0, 3, 0, 4, 6, 5, 7, 6], {
    fillColor: false,
    changeRangeMin: 0,
    chartRangeMax: 10,
    type: 'line',
    width: '100%',
    height: '32',
    lineWidth: 2,
    lineColor: '#1a2942',
    highlightSpotColor: '#3bc0c3',
    highlightLineColor: '#f13c6e',
    spotRadius: 4
});

$('.sparkpie-big').sparkline([3, 4, 1, 2], {
    type: 'pie',
    width: '100%',
    height: '50',
    sliceColors: ['#1a2942', '#f13c6e', '#3bc0c3', '#dcdcdc'],
    offset: 0,
    borderWidth: 0,
    borderColor: '#00007f'
});



