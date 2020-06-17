+++
title = "Editing Razor views when debugging"
description = "How to update Razor views without restarting"
author = "Pedro"
date = 2020-06-17T10:18:21+01:00
tags = ["ASP.NET Core 3.0"]
categories = ["Razor"]
draft = false
+++

If you have been programming with Razor Pages on ASP.NET Core 3.0 you know that restarting your application every time you make a change is not very productive.

By default, your changes are not refreshed automatically and you need to  restart your application. Let me show you how to change this behavior.

# Add required Nuget package
You need to add the [Microsoft.AspNetCore.Mvc.Razor.RuntimeCompilation](https://www.nuget.org/packages/Microsoft.AspNetCore.Mvc.Razor.RuntimeCompilation/) Nuget to your project.

![Add Nuget](/img/razor-views-debug-edit-1.png)

# Edit project file
This Nuget should be only referenced when you are running your application in Debug mode. 

You need to edit the project file:

![Edit Project File Menu](/img/razor-views-debug-edit-2.png)

Add the condition `Condition="'$(Configuration)' == 'Debug'"` based on the active `Configuration` value:

![Edit Project File](/img/razor-views-debug-edit-3.png)

# Update Startup.ConfigureServices
The final step is to include a call to `AddRazorRuntimeCompilation`.
```cs
public class Startup
{
    public Startup(IConfiguration configuration, IWebHostEnvironment env)
    {
        Configuration = configuration;
        Env = env;
    }

    public IWebHostEnvironment Env { get; set; }
    public IConfiguration Configuration { get; }

    // This method gets called by the runtime. Use this method to add services to the container.
    public void ConfigureServices(IServiceCollection services)
    {
        IMvcBuilder builder = services.AddRazorPages();

#if DEBUG
        if (Env.IsDevelopment())
        {
            builder.AddRazorRuntimeCompilation();
        }
#endif
    }
```

Read the [official documentation](https://docs.microsoft.com/en-us/aspnet/core/mvc/views/view-compilation?view=aspnetcore-3.0&tabs=visual-studio) for more details or for other versions.