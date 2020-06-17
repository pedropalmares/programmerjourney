+++
title = "Adding comments to a Hugo blog with Disqus"
description = ""
author = "Pedro"
date = 2020-06-17T11:29:02+01:00
tags = ["Blog","Hugo"]
categories = ["Blog"]
draft = false
+++

In this post I'll show you how to add comments to a Hugo blog with Disqus.

# Signup to Disqus
The first step is to create an account on [Disqus](https://disqus.com/profile/signup/) and add your site to the account.
The basic plan is free to use.

# Add Disqus Short Name
Then we need to add the Disqus Short Name to your blog `config.toml`
```toml
disqusShortname = "yourshortname"
```

Done! It's very easy!

For more details read the [official documentation](https://gohugo.io/content-management/comments/).