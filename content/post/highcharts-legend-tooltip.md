+++
title = "Tooltip on a Highcharts Legend"
description = "Showing a tooltip for a legend on mouse over"
author = "Pedro"
date = 2020-08-11T10:41:41+01:00
tags = []
categories = ["Highcharts"]
+++

Looking for a way to add tooltips to the legends of your [Highcharts](https://www.highcharts.com/) charts? Let me show you how to do it.

# Requirement
At my current project we use a lot of initials and abbreviations and we decided that a tooltip on a legend would be the most effective way to show a quick explanation to the user. 

# Solution
To create the tooltip we just need to change the chart's options to enable the `useHTML` property to render the legend and add the tooltip logic to the `labelFormatter` property.

```js
Highcharts.chart('container', {
    // ...
    legend: {
      useHTML: true,
      labelFormatter: function () {
        var tooltip;
        
        switch (this.index) {
            case 0:
                tooltip = 'Includes Portuguese taxes';
                break;
            case 1:
                tooltip = 'No taxes included';
                break;
        }
        
        return '<span data-toggle="tooltip" title="' + tooltip + '">' + this.name + '</span>';
      }
    }
    //...
});
``` 

# References
* [Source Code](https://jsfiddle.net/petipalmares/zrdnv3fu/)
* [Official documentation - Legend](https://api.highcharts.com/highcharts/legend)