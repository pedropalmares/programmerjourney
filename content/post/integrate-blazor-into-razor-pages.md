+++
title = "Integrate Blazor into Razor Pages"
description = ""
author = "Pedro"
date = 2020-07-10T14:34:41+01:00
tags = ["Blazor","Razor"]
categories = ["Blazor"]
draft = false
+++

I've been looking at Blazor components for some time and I was looking for a way to integrate them into my existing ASP.NET Core 3.1 Web applications. It's very easy!

# Setup
In the layout file `_Layout.cshtml` add this `<base>` tag to the `<head>` element:
```html
<base href="~/" />
```

Also in the layout file `_Layout.cshtml` add this `<script>` tag before the closing `<body>` tag:
```html
<script src="_framework/blazor.server.js"></script>
```

Add an `_Imports.razor` Blazor component to your `Pages` folder:
```cs
@using System.Net.Http
@using Microsoft.AspNetCore.Authorization
@using Microsoft.AspNetCore.Components.Authorization
@using Microsoft.AspNetCore.Components.Forms
@using Microsoft.AspNetCore.Components.Routing
@using Microsoft.AspNetCore.Components.Web
@using Microsoft.JSInterop

// Change row below to use your namespace
@using MyNamespace          
```

In `Startup.cs` file register the Blazor Service, map the Blazor Hub endpoint and a fallback:
```cs
public void ConfigureServices(IServiceCollection services)
{
    services.AddRazorPages();
    services.AddServerSideBlazor();
}

public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
{
    ...

    app.UseEndpoints(endpoints =>
    {
        endpoints.MapRazorPages();
        endpoints.MapBlazorHub();
        endpoints.MapFallbackToPage("/_Host");
    });
}
```

Add an `App.razor` Razor component to your `Pages` folder:
```cs
@using Microsoft.AspNetCore.Components.Routing

<Router AppAssembly="typeof(Program).Assembly">
    <Found Context="routeData">
        <RouteView RouteData="routeData" />
    </Found>
    <NotFound>
        <h1>Page not found</h1>
    </NotFound>
</Router>
```

Add a `_Host.cshtml` Razor file to your `Pages` folder:
```cs
@page "/blazor"
@{
    Layout = "_Layout";
}
<app>
    <component type="typeof(App)" render-mode="Server" />
</app>
```

# Adding Blazor components
For my example I'm creating a Time component to show current date and time.
Create a `Time.razor` Blazor component in your `Pages` folder:
```cs
@page "/time"

<h1>@time</h1>

@code {
    private DateTime time;

    protected override void OnInitialized()
    {
        time = DateTime.Now;
    }
}
```
To add this Blazor component into your existing Index.cshtml file just add:
```html
<component>
    @(await Html.RenderComponentAsync<IntegratingBlazor.Pages.Time>(RenderMode.Server))
</component>
```

![Blazor component in Razor page](/img/integrate-blazor-into-razor-pages-1.png)

Or open this Blazor component in a new page just by browsing to the `/time` url.
![Blazor component in new page](/img/integrate-blazor-into-razor-pages-2.png)

Let me know you if you have any problem with your code!