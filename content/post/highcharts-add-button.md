+++
title = "Add a button to Highcharts"
description = "Adding a Font Awesome icon button"
author = "Pedro"
date = 2020-07-01T12:10:40+01:00
tags = ["Highcharts-draggable-points"]
categories = ["Highcharts"]
draft = false
+++

Do you know that you can add buttons to your [Highcharts](https://www.highcharts.com/) graphs? In this post I'll show you how.

# Requirement
At my current project I have a requirement to add a button to a bar graph with a [Font Awesome](https://fontawesome.com/) icon. In this example my button will show an Hello World alert so you can easily change it for your needs.

# Solution
To create the button I used the [SVGRenderer](https://api.highcharts.com/class-reference/Highcharts.SVGRenderer) that allows to create SVG drawings on your charts. The [SVGRenderer.button](https://api.highcharts.com/class-reference/Highcharts.SVGRenderer#button) method allows to render the label using HTML (property `useHTML`) so you can easily draw the [Font Awesome](https://fontawesome.com/) icon on it. This code should be added to the chart load event. 

```js
Highcharts.chart('container', {
  chart: {
    type: 'bar',
    events: {
      load: function() {
        this.renderer.button('<i class="fas fa-chart-line"></i>', 5, 5, function() {
          // Add your code here
          alert('Hello world!');
        }, {
          height: 16,
          width: 16,
          'text-align': 'center'
        }, null, null, null, null, true).add()
      }
    }
  },
//...
}
``` 

# References
* [Source code](https://jsfiddle.net/petipalmares/8hzq4gaL/)
* [Official documentation - SVGRenderer](https://api.highcharts.com/class-reference/Highcharts.SVGRenderer)
* [Official demo - SVGRenderer](https://www.highcharts.com/demo/renderer)