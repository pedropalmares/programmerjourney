+++
title = "Creating a simple free blog"
description = "Using Hugo + GitHub Pages for hosting"
author = "Pedro"
date = 2020-06-06T00:00:00Z
tags = ["Blogging","Hugo"]
categories = ["Blogging"]
draft = false
+++

In this post, I'll guide you in how to create a simple blog site using Hugo as a static site generator and Github Pages to host it. This solution is free but I suggest that you buy your own domain which is around $10/year!

# Install Hugo

The instructions to install Hugo are different for each operation system so please read the [official documentation](https://gohugo.io/getting-started/installing).

After installation is complete run `hugo new site MyBlog`:
```batchfile
C:\Blog>hugo new site MyBlog
Congratulations! Your new Hugo site is created in C:\Blog\MyBlog.

Just a few more steps and you're ready to go:

1. Download a theme into the same-named folder.
   Choose a theme from https://themes.gohugo.io/ or
   create your own with the "hugo new theme <THEMENAME>" command.
2. Perhaps you want to add some content. You can add single files
   with "hugo new <SECTIONNAME>\<FILENAME>.<FORMAT>".
3. Start the built-in live server via "hugo server".
```
This will create the site in a new folder named `MyBlog`.

# Choosing a theme

There are several options in [Hugo Themes](https://themes.gohugo.io/).

For my blog I've chosen [Ghostwriter](https://themes.gohugo.io/ghostwriter/). You can download it [here](https://github.com/jbub/ghostwriter/archive/master.zip). You could `git clone` it but by downloading it you can tweak it later and I think that it's easier to have all your blog source files together. After download:
* Unpack it in `themes\ghostwriter` inside your `MyBlog` folder. Don't forget to rename `ghostwriter-master` folder.
* Copy `themes\ghostwriter\exampleSite\content\page` to `content\page`.
* Copy `themes\ghostwriter\exampleSite\content\post` to `content\post`.

# Configuration

* Edit `config.toml` in your `MyBlog` folder
* The baseURL is already set for GitHub Pages. 
  * If don't know what you will be using for hosting you can leave this parameter as `"/"`.

```toml
baseURL = "https://<username>.github.io/<repository>/"
title = "My blog"
theme = "ghostwriter"
publishDir = "docs"

[Params]
    mainSections = ["post"]
    intro = true
    headline = "My blog"
    description = "My blog's description"
    opengraph = true
    dateFormat = "Mon, Jan 2, 2006"

[Permalinks]
    post = "/:filename/"
```

* This is a minimal configuration file. You can customize it later.
* Read the [official documentation](https://github.com/jbub/ghostwriter) for more details.

# Serve your blog locally
* Run `hugo serve`
```batchfile
C:\Blog\MyBlog>hugo serve
Building sites …
                   | EN
-------------------+-----
  Pages            | 33
  Paginator pages  |  0
  Non-page files   |  0
  Static files     |  8
  Processed images |  0
  Aliases          | 13
  Sitemaps         |  1
  Cleaned          |  0

Built in 139 ms
Watching for changes in C:\Blog\MyBlog\{archetypes,content,data,layouts,static,themes}
Watching for config changes in C:\Blog\MyBlog\config.toml
Environment: "development"
Serving pages from memory
Running in Fast Render Mode. For full rebuilds on change: hugo server --disableFastRender
Web Server is available at //localhost:1313/myblog (bind address 127.0.0.1)
Press Ctrl+C to stop
```
* Open [http://localhost:1313/](http://localhost:1313/myblog) and you should see your site.

![Blog](/img/blog.png)

* You can explore your new blog now!
* The posts that you see are coming from the files that were copied to `content\post` so you can delete them now.

# Customize the layout
  * Don't customize it now! Content is more important than style and you will have time for that later.
  * If you want to tweak colors without wasting a lot of time just add a `<style>` tag with CSS in `themes/ghostwriter/layouts/partials/header.html`.
  * The `post` template is defined in `themes\ghostwriter\layouts\post\single.html`.
  * Read [Templates documentation](https://gohugo.io/templates/) for more details.

# Creating a new post
To create a new post you have two different options: 
  1. Add a new `.md` file in the `content\post` folder
  2. Run `hugo new post\my-first-post.md` which will create a post with a default template.

For the filename you can use a specific name, incremental number or a date.

Run `hugo` to generate your site into the `docs`folder. This is the folder that includes the files that will be hosted.

# Hosting
* I will be using GitHub Pages as a Project Page
  * Read the [official documentation](https://gohugo.io/hosting-and-deployment/hosting-on-github/) for more details on Hosting Hugo on GitHub.
  * Read [this](https://gohugo.io/hosting-and-deployment/) if you want to see other hosting options.
* Open GitHub website and create a new repository
* Create a repository for your files and push them to the repository
```batchfile
C:\Blog\MyBlog>git init
Initialized empty Git repository in C:/blog/MyBlog/.git/

C:\Blog\MyBlog>git add .

C:\Blog\MyBlog>git commit -m "first commit"
[master (root-commit) c8c5821] first commit
 116 files changed, 16246 insertions(+)

... [Removed lines for easy reading]

C:\Blog\MyBlog>git remote add origin https://github.com/<username>/<repository>.git

C:\Blog\MyBlog>git push -u origin master
Enumerating objects: 172, done.
Counting objects: 100% (172/172), done.
Delta compression using up to 8 threads
Compressing objects: 100% (132/132), done.
Writing objects: 100% (172/172), 450.33 KiB | 11.26 MiB/s, done.
Total 172 (delta 47), reused 0 (delta 0)
remote: Resolving deltas: 100% (47/47), done.
To https://github.com/<username>/<repository>.git
 * [new branch]      master -> master
Branch 'master' set up to track remote branch 'master' from 'origin'.
```
* On GitHub Settings page → GitHub Pages
  * Source: `master branch /docs folder`
  * Custom domain: `www.example.com`. 
    * I use [Namecheap](https://www.namecheap.com/) to buy new domains but you can use whatever you want.
  * Run `git pull`
* On your Namecheap Domain List → Manage → Advanced DNS
  * Remove all host records
  * Add `A Record` for host `@` with value `185.199.108.153`
  * Add `A Record` for host `@` with value `185.199.109.153`
  * Add `A Record` for host `@` with value `185.199.110.153`
  * Add `A Record` for host `@` with value `185.199.111.153`
  * Add `CNAME record` for host `www` with value `<username>.github.io`
* On GitHub Settings page `Enforce HTTPS`. 
  * May take 24 hours to be enabled.

Your site should be available now!

# Google Analytics (Optional)
* Get Tracking ID from Google Analytics
* Add Tracking ID to `config.toml`
```toml
googleAnalytics = "UA-123-45"
```
* Commit and Push to repository
* Read the [official documentation](https://gohugo.io/templates/internal/) for more details.
* On Google Search Console
  * Get TXT record
* On your Namecheap Domain List → Manage → Advanced DNS
  * Add `TXT record` for host `@` with value got on previous step.

# Customize layout (Optional)
Change colors in `themes\ghostwriter\static\styles\site\styles.scss` and run:
```batchfile
C:\Blog\MyBlog\themes\ghostwriter>npm run build
```


Generate CSS for syntax highlighting using Chroma by running: 
```batchfile
C:\Blog\MyBlog>hugo gen chromastyles --style=monokai > themes\ghostwriter\static\dist\syntax.css
```