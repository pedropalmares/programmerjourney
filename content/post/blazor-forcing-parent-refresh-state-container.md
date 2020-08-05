+++
title = "Forcing parent component to refresh when using a State container in Blazor"
description = ""
author = "Pedro"
date = 2020-07-24T17:00:28+01:00
tags = ["Blazor"]
categories = ["Blazor"]
draft = false
+++

One of the ways that I use to communicate between Blazor components in large applications is to use a state container. In this post I'll show you how you can force the parent container to refresh when needed. You can find the source code for this [here](https://github.com/pedropalmares/BlazorServerSamples/commit/bda723c061ea3bc13573537d33adfab9fa80d71e).

In this example, we have a page with two components where each component has a button and also an alert showing the selected component.

![Example](/img/blazor-forcing-parent-refresh-state-container-1.png)

# State container
In this example, we have a simple `VehicleState` class as our state container. 
```cs
public class VehicleState
{
    public event Action OnChange;

    private void NotifyStateChanged() => OnChange?.Invoke();

    public string SelectedVehicle { get; set; }

    public void SetVehicle (string vehicle)
    {
        SelectedVehicle = vehicle;
        NotifyStateChanged();
    }
}
```

This class stores the currently selected vehicle and a method to update the selected vehicle. There is also a `OnChange` event to be used by all components that want to show the selected vehicle.

# Child components

```html
// Sedan component
@inject VehicleState VehicleState 

<button class="btn btn-primary" @onclick="SelectVehicle">@name</button>

@code {
    private string name = "Sedan";

    void SelectVehicle()
    {
        VehicleState.SetVehicle(name);
    }
}
```

```html
// Coupe component
@inject VehicleState VehicleState

<button class="btn btn-primary" @onclick="SelectVehicle">@name</button>

@code {
    private string name = "Coupe";

    void SelectVehicle()
    {
        VehicleState.SetVehicle(name);
    }
}
```

These child components update the selected vehicle in the state container when a button is clicked.

# Parent component

```html 
@inject VehicleState VehicleState

@implements IDisposable

<VehicleSedan />
<VehicleCoupe />

@if (VehicleState.SelectedVehicle != null)
{
    <div class="alert alert-primary mt-2" role="alert">
        Your chosen vehicle is @VehicleState.SelectedVehicle.
    </div>
}

@code {
    protected override void OnInitialized()
    {
        VehicleState.OnChange += StateHasChanged;
    }

    public void Dispose()
    {
        VehicleState.OnChange -= StateHasChanged;
    }
}
```
The parent component references both child components and handles the `VehicleState.OnChange` event invoking `StateHasChanged` forcing the component to re-render.
Don't forget to unsubscribe from `VehicleState.OnChange` to prevent a possible memory leak.

Are you using a different method for large applications?