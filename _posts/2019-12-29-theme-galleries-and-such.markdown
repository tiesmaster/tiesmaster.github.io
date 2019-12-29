---
layout: post
title: "Setting up Developer Blog with Jekyll 06: Theme Galleries, and such"
date: 2019-12-29 14:02:48 +0100
categories: jekyll setup-dev-blog series
---

So the goal of the last post was to select a theme for the blog, and move on to the next thing for the blog. However, it turned out to be not that easy to _just_ select a theme. Unfortunately, GitHub Pages is a bit limited in "bring your own theme". I wanted it to be a gem-based theme, however, it turns out that only a handful of themes are supported. And although, you can use any theme in a GitHub repo, using `remote_theme`, however, I find that a bit too risky. So I've decided to use the _old-style_ "copy-theme into your own repo" approach. So first, let's have a look what we can choose from.

# Galleries

Looking at the [docs of Jekyll](https://jekyllrb.com/docs/themes/#pick-up-a-theme), I see there are at least 4 different gallery sites, and Google shows up a bunch more. Let's have a look if any of these really stand out.

## [jamstackthemes.dev](jamstackthemes.dev)

So, the first gallery. It has 116 themes, it's apparently not only for Jekyll themes, but primarily for "JAMstack" sites.

I've never heared of the JAMstack, but turns out this is a new variation on the _old school_ LAMP stack, or the, more recent, MEAN stack. JAM stands for JS, APIs, and markup, so basically, a SPA site that connects to APIs, for example a react app without a dedicated backend. Funny that also for this architecture there is an abbreviation made up ;)

So this is not for blogs, but for apps. However, might still be an useful listing of themes. It also shows you the last commit, quite handy. Can sort on amount of stars!! All the popular themes are there (Jekyll Now, Hyde, Beatiful Jekyll).

So still promising.

## [jekyllthemes.org](jekyllthemes.org)

Plenty of themes here: 20 on the first page, and up to 20 pages ;) Looks like non-curated list of themes, no stars, no sorting, just a very long list of themes with a thumbnail, and link to the repo/homepage.

## [jekyllthemes.io](jekyllthemes.io)

Next one, is actually curated (as they say theirselves ;) Lots of paid themes. So this is a commercial "gallery".

## [jekyll-themes.com](jekyll-themes.com)

This one, is also with paid themes.

This is the last one coming from the docs of Jekyll. Next ones came up from Googling.

## [themes.jekyllrc.org](themes.jekyllrc.org)

Looks very similar to jekyllthemes.org, though, the site is loading poorly. So skipping this one for now.

## [themefisher.com/best-jekyll-themes](themefisher.com/best-jekyll-themes)

This is not really a gallery, but "35+ Best Jekyll themes for Creating Static Site 2019". Although, it doesn't list the most commonly seen themes, like Hyde, and Beautifl Jekyll, however, it does contain a shitload of very nice looking themes.

# Jekyll Bootstrap, Hyde, and Jekyll Bootstrap

A couple ones stand out from the crowd, you see a lot of developer blogs created with these. Think of [ploeh's blog](https://blog.ploeh.dk/) ([Jekyll Bootstrap 3](https://jekyll-bootstrap-3.github.io/)), or this blog of [Jimmy Bogard](https://jimmybogard.com/) ([Beautiful Jekyll](https://deanattali.com/beautiful-jekyll/)). I can't find any other blogs, at this moment, that uses these kind of themes, but I'm sure I'll stumble upon them when I'm not looking for them anymore ;)

## Jekyll Bootstrap

Apparently, there are [at least](http://jekyllbootstrap.com/) [two versions](https://jekyll-bootstrap-3.github.io/) floating around. I really like this theme, as it is very complete. The pages are very advanced, like they easily show you a list of all the pages, also categorized by your tags. There are also various themes, _within this theme_ (theme-ception, anyone?), though, their links goes to a dead end (however, they appear to also be listed [on GitHub itself](https://github.com/jekyllbootstrap)). But the newest version does point to a [couple themes](https://jekyll-bootstrap-3.github.io/preview/#/theme/Bootstrap) that actually work.

What's also interesting, is that the old version also even contains [some of its own documentation on Jekyll](http://jekyllbootstrap.com/lessons/jekyll-introduction.html) itself (which looks actually quite interesting, from first glance). Next, there are even some [`rake tasks`](http://jekyllbootstrap.com/usage/jekyll-quick-start.html#toc_7) for creating a new post. I don't know if I would replace [my current setup](/jekyll/setup-dev-blog/series/2019/12/21/jekyll-new-post.html) for creating a new post, but it's interesting to see what's out there.

## Beautiful Jekyll

This one is really... Beautiful ;) It just looks stunning. It's responsive, has a nice listing of posts. Looks like you get the best out of the box. I'm going to give this a try.
