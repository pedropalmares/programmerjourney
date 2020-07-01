+++
title = "Highcharts Draggable Bar workaround"
description = "Problem when dragging bar at maximum value"
author = "Pedro"
date = 2020-07-01T10:22:10+01:00
tags = ["Highcharts-draggable-points"]
categories = ["Highcharts"]
draft = false
+++

I've been developing charts with [Highcharts](https://www.highcharts.com/) for around 1 year now. It is a great charting engine and very easy to use so I highly recommend it!

# draggable-points Module
One of the modules that I use in some of my graphs is the draggable-points. This module allows to drag and drop points around the graph allowing the user to have a visual input. That small circle at the end of the bar is a visual guidance telling the user that the bar is draggable.
![Draggable-points example](/img/highcharts-draggable-bar-1.png)

# The problem
While working on my current project I found a problem where the user wasn't allowed to change a value when the value was at its maximum.
In the image below you can see that the small circle is not shown therefore the value can't be changed.
![Problem](/img/highcharts-draggable-bar-2.png)

# The workaround
I came up with a workaround by adding a small delta to the y-axis maximum value and setting the endOnTick property to false.
```js
yAxis: {
    min: 0,
    // max: 10,                     // Problem
    max: 10.1, endOnTick: false     // Workaround
}
```
![Workaround](/img/highcharts-draggable-bar-3.png)

# References
* [Source Code](https://jsfiddle.net/petipalmares/em654d08/)
* [Official documentation - draggable-points](https://api.highcharts.com/highcharts/plotOptions.series.dragDrop)
* [Official documentation - endOnTick](https://api.highcharts.com/highcharts/xAxis.endOnTick)