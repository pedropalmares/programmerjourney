+++
title = "Passing Cascading Values and Parameters in Blazor"
description = "How to pass a value from a component to all its descending components"
author = "Pedro"
date = 2020-08-16T16:51:07+01:00
tags = ["Blazor"]
categories = ["Blazor"]
+++

Blazor has several ways to pass values from a component to its child. However, when there are several layers between the components, the best way to pass data from an ancestor component to a descendant component is by using cascading values and parameters. In this post, I'll show you how to pass a value from a component to its grandchild component. You can find the source code for this [here](https://github.com/pedropalmares/BlazorServerSamples/commit/384a5445410e1644d6fca8c807e4b8fc0e894f39).

![Example](/img/blazor-cascading-value-1.png)

# Single Cascading Parameter
The simplest way to use cascading values and parameters is by sending the value with a `CascadingValue` tag and getting the value from the child component with a `[CascadingParameter]`. Notice that this only works correctly when you are only passing one value to its descendants.

```html
// Parent component

<CascadingValue Value="message">
    <ChildComponent></ChildComponent>
</CascadingValue>

@code {
    string message = "I'm a value from the parent component.";
}
```

```html
// ChildComponent
<p>@Message</p>

@code {
    [CascadingParameter]
    public string Message { get; set; }
}
```

# Multiple Cascading Parameter
When you need to pass multiple values you need to have a way to identify the parameters that are being passed. This can be done by differentiating them by type or by name.

## Identify by Type
If you are passing values with different types, such as int and string for example, the component will know how to match the value to the parameter automatically.

```html
// Parent component

<CascadingValue Value="message">
    <CascadingValue Value="age">
        <ChildComponent></ChildComponent>
    </CascadingValue>
</CascadingValue>

@code {
    string message = "I'm a value from the parent component.";
    int age = 10;
}
```

```html
// ChildComponent
<p>@StringFromParent - @IntFromParent</p>

@code {
    [CascadingParameter]
    public string StringFromParent { get; set; }

    [CascadingParameter]
    public int IntFromParent { get; set; }
}
```

## Identify by Name
When different values have the same type, you have to identify them by a name.

This is, in my opinion, the best way to pass values from a component to its descendants!

```html
// Parent component

<CascadingValue Value="message" Name="Message">
    <CascadingValue Value="anotherMessage" Name="AnotherMessage">
        <ChildComponent></ChildComponent>
    </CascadingValue>
</CascadingValue>

@code {
    string message = "I'm a value from the parent component.";
    string anotherMessage = "I'm another value from the parent component.";
}
```

```html
// ChildComponent
<p>@StringFromParent</p>
<p>@AnotherStringFromParent</p>

@code {
    [CascadingParameter(Name = "Message")]
    public string StringFromParent { get; set; }

    [CascadingParameter(Name = "AnotherMessage")]
    public string AnotherStringFromParent { get; set; }
}
```

I hope that you find this post helpful and that it can bring value to your projects. Let me know how it goes!