+++
title = "C# List of Tuples with Named Fields"
description = ""
author = "Pedro"
date = 2020-08-01T07:23:33+01:00
tags = ["C#"]
categories = ["C#"]
+++

One of these days I was developing a project using tuples with named fields, making it easier to understand the code when using tuples. I then wanted to create a List of them but the way to do it didn't seem to be straightforward to me. So I decided to show you all the use cases of tuples in this post.

# Unnamed fields tuple
This is the most simple case of tuples when you don't specify a name to the fields and they are named by `Item1`, `Item2`, etc.

```cs
var tuple = ("Porto", "Portugal");
Console.WriteLine(tuple.Item1, tuple.Item2);
```

# Named fields tuple
In the declaration of the tuple you can specify the name of the field. Much more easier to understand than `Item1`.

```cs
var namedTuple = (City: "Porto", Country: "Portugal");
Console.WriteLine(namedTuple.City, namedTuple.Country);
```

# List of unnamed fields tuple
The same way as creating a list of any object in C#.

```cs
var tuples = new List<(string, string)>
{
    ("Porto", "Portugal"),
    ("Barcelona", "Spain")
};
foreach (var myTuple in tuples)
{
    Console.WriteLine(myTuple.Item1, myTuple.Item2);
}
```

# List of named fields tuples - The goal of this post!
To create a list of named fields tuples you have to specify the field names on the type of the list being created.

```cs
var namedTuples = new List<(string City, string Country)>
{
    ("Porto", "Portugal"),
    ("Barcelona", "Spain")
};
foreach (var myTuple in namedTuples)
{
    Console.WriteLine(myTuple.City, myTuple.Country);
}
```

# Deconstructing
The final case is a bit different but still related which is by deconstructing the tuple into separate variables.
```cs
var tupleToDeconstruct = ("Porto", "Portugal");
var (city, country) = tupleToDeconstruct;
Console.WriteLine(city, country);
```

Hope you find this helpful to write cleaner code!