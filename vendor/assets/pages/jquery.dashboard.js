/**
* Theme: Velonic Admin Template
* Author: Coderthemes
* Module/App: Dashboard Application
*/

!function($) {
    "use strict";

    var Dashboard = function() {
        this.$body = $("body")
    };

    //initializing various charts and components
    Dashboard.prototype.init = function() {
        /**
        * Morris charts
        */

        //Line chart
        Morris.Line({
            element: 'morris-line-example',
            data: [
                { y: '2012', a: 75,  b: 65},
                { y: '2013', a: 50,  b: 40},
                { y: '2014', a: 75,  b: 65},
                { y: '2015', a: 100, b: 90}
            ],
            xkey: 'y',
            gridLineColor: '#eeeeee',
            ykeys: ['a', 'b'],
            labels: ['Series A', 'Series B'],
            resize: true,
            hideHover: 'auto',
            lineColors: ['#1a2942', '#3bc0c3']
        });

        //Bar chart
        Morris.Bar({
            element: 'morris-bar-example',
            data: [
                    { y: 'Sunday', a: 75,  b: 65 , c: 20 },
                    { y: 'Monday', a: 50,  b: 40 , c: 50 },
                    { y: 'Tuesday', a: 75,  b: 65 , c: 95 },
                    { y: 'Wednesday', a: 50,  b: 40 , c: 22 },
                    { y: 'Thursday', a: 75,  b: 65 , c: 56 },
                    { y: 'Friday', a: 100, b: 90 , c: 60 },
                    { y: 'Saturday', a: 100, b: 90 , c: 60 }
            ],
            xkey: 'y',
            ykeys: ['a', 'b', 'c'],
            gridLineColor: '#eeeeee',
            hideHover: 'auto',
            resize: true, //defaulted to true
            labels: ['Series A', 'Series B', 'Series c'],
            barColors: ['#3bc0c3', '#1a2942', '#dcdcdc']
        });


        //Chat application -> You can initialize/add chat application in any page.
        $.ChatApp.init();
    },
    //init dashboard
    $.Dashboard = new Dashboard, $.Dashboard.Constructor = Dashboard
    
}(window.jQuery),

//initializing dashboad
function($) {
    "use strict";
    $.Dashboard.init()
}(window.jQuery);

// Pie charts
$('.sparkpie-big').sparkline([3, 4, 1, 2], {
    type: 'pie',
    width: '100%',
    height: '50',
    sliceColors: ['#1a2942', '#f13c6e', '#3bc0c3', '#dcdcdc'],
    offset: 0,
    borderWidth: 0,
    borderColor: '#00007f'
});



