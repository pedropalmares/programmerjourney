+++
title = "Highcharts Draggable Bar color validation"
description = "Validating user input"
author = "Pedro"
date = 2020-07-01T11:22:22+01:00
tags = ["Highcharts-draggable-points"]
categories = ["Highcharts"]
draft = false
+++

In this post I'll show you how you can create visual rules for your [Highcharts](https://www.highcharts.com/) when the user is dragging points or bars.

# Requirement
At my current project I have a requirement to visually show the user that their input is invalid. In this case the bar should be red instead of blue. The validation is that at least one of the values should be at the maximum value (10 in my case).
![Requirement](/img/highcharts-paint-bar-drag-1.png)

# Solution
My solution was to create a function that validates the graph data and paint the bars accordingly and call it in the point drop event.
```js
var chart = Highcharts.chart('container', {
// ...
    plotOptions: {
        series: {
            point: {
                events: {
                    drop: function (e) {
                        paintBars();
                    }
                }
            }
        }
    }
// ...
});

function paintBars() {
    var color = Highcharts.getOptions().colors[0];
    
    if (Math.max(...data.map(i => i.y)) != 10) {
  	    color = Highcharts.getOptions().colors[8]    
    }
  
    if (chart.series[0].color != color) {
        chart.series[0].update({
            color: color
        });
    }
}
```

![Solution](/img/highcharts-paint-bar-drag-2.png)

# References
* [Source Code](https://jsfiddle.net/petipalmares/7e6hzLqt/)
* [Official documentation - Point drop event](https://api.highcharts.com/highcharts/plotOptions.series.point.events.drop)