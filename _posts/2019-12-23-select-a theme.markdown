---
layout: post
title: "Setting up Developer Blog with Jekyll 05: Select a theme"
date: 2019-12-23 20:21:24 +0100
categories: jekyll setup-dev-blog series
---

So last time, I took a break, and tried to make it easier to start a new post. I was able to do just `Solution Explorer` > `New Post`, and that worked (almost) perfectly. I just figured out, I need to add quotes around the title, but other than that, it's working like a charm ;) But first: Themes!

I still know from my [previous attempt](/jekyll/setup-dev-blog/series/2019/11/20/init.html) in starting a dev blog, that I was overwhelmed with themes. There are a shitload of themes, in almost even more galleries. And some of the themes required you to clone the GitHub repo, and _just_ customize it to your needs, which almost never works as you'd expect. So this time, I'm going to make sure that I fully cover this topic, by bisecting it down to its core ;)

# What's the anatomy of a theme?

So first of all, what's really a theme? What we saw [previously](/jekyll/setup-dev-blog/series/2019/11/29/what-do-you-get.html#jekyll), it's _just_ a Ruby gem that you need to install in your `Gemfile`, and select in your `_config` file. The default theme is [`minima`](https://github.com/jekyll/minima), so let's have a look what's inside that:

```shell
$ tree .
.
├── 404.html
├── CODE_OF_CONDUCT.md
├── Gemfile
├── History.markdown
├── LICENSE.txt
├── README.md
├── _config.yml
├── _includes
│   ├── disqus_comments.html
│   ├── footer.html
│   ├── google-analytics.html
│   ├── head.html
│   ├── header.html
│   └── social.html
├── _layouts
│   ├── default.html
│   ├── home.html
│   ├── page.html
│   └── post.html
├── _posts
│   ├── 2016-05-19-super-short-article.md
│   ├── 2016-05-20-my-example-post.md
│   ├── 2016-05-20-super-long-article.md
│   ├── 2016-05-20-this-post-demonstrates-post-content-styles.md
│   └── 2016-05-20-welcome-to-jekyll.md
├── _sass
│   ├── minima
│   │   ├── _base.scss
│   │   ├── _layout.scss
│   │   ├── custom-styles.scss
│   │   ├── custom-variables.scss
│   │   └── initialize.scss
│   ├── minima-classic.scss
│   ├── minima-solarized-dark.scss
│   └── minima-solarized.scss
├── about.md
├── assets
│   ├── css
│   │   └── style.scss
│   └── minima-social-icons.svg
├── index.md
├── minima.gemspec
├── screenshot.png
└── script
    ├── bootstrap
    ├── build
    ├── cibuild
    └── server

8 directories, 40 files
```

That looks quite overwhelming, but maybe the documentation can be of help here? And it does, it speaks specifically over [gem-based themes](https://jekyllrb.com/docs/themes/#understanding-gem-based-themes), I suppose in contrast of the "old non-gemfile" themes. This is where you had to clone a different repo, and just adjust some details to your own. Which opens up the proverbial can of worms, if you ask me.

It looks like the current world of gem-based themes are a lot better. It hides a lot of the "boilerplate" from your Jekyll directory structure, but in order to understand what your pulling into your site, with a specific theme, it's still instrumental to understand how the [directory structure of Jekyll](https://jekyllrb.com/docs/structure/) works. So it doesn't hurt to read up on that, if you haven't.

I also can't stress enought how the gem-based themes basically work: I see it as a set of "overlays" over each other. Simarly, how for example Docker images are stacked upon each other, if you're familiar with that. Though, I don't expect deletion of files to be supported, but changing a file _is_ [possible](https://jekyllrb.com/docs/themes/#overriding-theme-defaults).

# Switch to a different gem-based theme

It's easy to switch to a different theme by just installing that gem, and select it in the `_config.yml` file. The [instructions](https://jekyllrb.com/docs/themes/#installing-a-theme) are quite clear, however, I found out that there is just one caveat: GitHub only allows you to use a handful of whitelisted themes :(

> If you're publishing your Jekyll site on [GitHub Pages](https://pages.github.com/), note that GitHub Pages supports only [some gem-based themes](https://pages.github.com/themes/). GitHub Pages also supports [using any theme hosted on GitHub](https://help.github.com/articles/adding-a-jekyll-theme-to-your-github-pages-site/#adding-a-jekyll-theme-in-your-sites-_configyml-file) using the `remote_theme` configuration as if it were a gem-based theme.

This makes me really sad... Though, as it states, there is apparently support for using a GitHub repository as source, instead of a gem. However, I find that quite tricky, since that effectively will make your site really fragile. I don't know exactly when it might update your site with the latest source from the theme's GitHub repo; probably only when you do a `$ git push`. However, I don't want to fall into the trap that you quickly publish a new post, and as a result of an updated upstream dependency, now you have a broken site. Bottom line, updating a theme you really want to do explicitly, and inspect visually.

# Choosing one of the whitelisted GitHub Pages themes

Turns out, the situation with the GitHub provided themes is even shittier: none of the GitHub provided themes have the default layouts (`default`/`home`/`page`/`post`), except for [`minimal`](https://github.com/pages-themes/minimal) (not to be confused with the theme [`minima`](https://github.com/jekyll/minima), which is the default "out of the box" theme of Jekyll). Though, `minimal` still only brings the `post` layout with it, so you're still missing the other two layouts, so that means that you still need to do half of the themes work, and if you're going to do that anyhow, why not go all in, and ingest a much more sophisticated theme from one of the galleries.

It will be annoying that you need to copy over the source, and update everything, but that means just doing a permanent fork, and with git, it makes it easier to keep up to date. Of course, it also depends on how much I will deviate from the theme. In case I will, then I will just more as a starter template, then really as a theme. My expectation: deviation will happen probably anyhow. So then it's best to really embrace the themes code, and take that in, but that also means that it's really important to understand the code of the theme. It's not just another package you're pulling in, of which the internals are implementation details.

So this is kinda disappointing that this post doesn't end up with some added value, but we'll do that next post. As expected, the themes work was going to be a bit of effort, so it's fine it's going to span another, or a couple more posts ;)
